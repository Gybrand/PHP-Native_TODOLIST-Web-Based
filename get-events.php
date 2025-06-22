<?php
header('Content-Type: application/json');
include 'config.php';
include 'send-email.php';

$events = [];
$today = date('Y-m-d');

// --- Ambil data dari tabel rutin ---
$sql_rutin = "SELECT r.id, r.nama_tugas, r.hari, r.bulan, r.tahun, u.nama
              FROM rutin r
              LEFT JOIN userdata u ON r.nipp = u.nipp
              ORDER BY r.tahun, r.bulan, r.hari";

$result_rutin = mysqli_query($conn, $sql_rutin);
while ($row = mysqli_fetch_assoc($result_rutin)) {
    $year = $row['tahun'];
    $month = str_pad($row['bulan'], 2, '0', STR_PAD_LEFT);
    $day = str_pad($row['hari'], 2, '0', STR_PAD_LEFT);
    $date = "$year-$month-$day";

    // Warna default hitam
    $color = '#000000';

    // Jika tanggal sudah lewat hari ini, ganti warna jadi merah
    if ($date < $today) {
        $color = '#960311'; // Bootstrap danger
    }

    $events[] = [
        'id' => 'rutin-' . $row['id'],
        'title' => $row['nama'] . ' - ' . $row['nama_tugas'],
        'start' => $date,
        'allDay' => true,
        'color' => $color
    ];
}

// --- Ambil data dari tabel pekerjaan ---
$sql_pekerjaan = "SELECT p.no, p.sub_nomor, p.deskripsi, p.deadline, p.status, u.nama
                 FROM pekerjaan p
                 LEFT JOIN userdata u ON p.nipp = u.nipp
                 WHERE p.deadline IS NOT NULL AND p.deadline != '' AND LOWER(p.status) != 'done'
                 ORDER BY p.deadline";

$result_pekerjaan = mysqli_query($conn, $sql_pekerjaan);
while ($row = mysqli_fetch_assoc($result_pekerjaan)) {
    $date = $row['deadline'];
    $status = strtolower($row['status']);

    // Warna default
    $color = '#6c757d'; // secondary
    if ($status === 'on progress') {
        $color = '#0dcaf0'; // info
    } elseif ($status === 'pending') {
        $color = '#ffc107'; // warning
    } elseif ($status === 'belum dimulai') {
        $color = '#6c757d'; // secondary
    }

    // Jika deadline sudah lewat
    if ($date < $today) {
        $color = '#dc3545'; // danger
    }

    $events[] = [
        'id' => 'pekerjaan-' . $row['no'],
        'title' => $row['nama'] . ' - ' . $row['deskripsi'],
        'start' => $date,
        'allDay' => true,
        'color' => $color
    ];
}

// --- Notifikasi Email Jika Ada Deadline Hari Ini dan Belum 'Done' ---
$sql_today = "SELECT p.deskripsi, u.nama, p.status 
              FROM pekerjaan p
              LEFT JOIN userdata u ON p.nipp = u.nipp
              WHERE p.deadline = '$today' AND LOWER(p.status) != 'done'";

$result_today = mysqli_query($conn, $sql_today);

if (mysqli_num_rows($result_today) > 0) {
    $log_file = 'last_email_sent.log';
    $last_sent = file_exists($log_file) ? trim(file_get_contents($log_file)) : '';

    if ($last_sent !== $today) {
        $dataTugas = [];
        while ($row = mysqli_fetch_assoc($result_today)) {
            $dataTugas[] = $row;
        }

        if (kirimEmailDeadlineHariIni($dataTugas)) {
            file_put_contents($log_file, $today);
        }
    }
}

// Debug log jika perlu (opsional)
file_put_contents('debug.log', json_encode($events, JSON_PRETTY_PRINT));

// Output JSON ke kalender
echo json_encode($events);
