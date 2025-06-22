<?php
include '../../config.php';
// Process the form submission for adding pekerjaan
if (isset($_POST['submit'])) {
    // Ambil data dari formulir
    $no = (int)$_POST['no'];
    $sub_nomor = htmlspecialchars($_POST['sub_nomor']);
    $deskripsi = htmlspecialchars($_POST['deskripsi']);
    $deadline = isset($_POST['deadline']) && $_POST['deadline'] !== '' ? $_POST['deadline'] : NULL;
    $status = htmlspecialchars($_POST['status']);
    $catatan = htmlspecialchars($_POST['catatan']);
    $output = htmlspecialchars($_POST['output']);
    $nipp = htmlspecialchars($_POST['nipp']);

    // Tambahkan pekerjaan ke tabel `pekerjaan`
    $query = "INSERT INTO pekerjaan (no, sub_nomor, deskripsi, deadline, status, catatan, output, nipp)
              VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("isssssss", $no, $sub_nomor, $deskripsi, $deadline, $status, $catatan, $output, $nipp);

    if ($stmt->execute()) {
        // Ambil data link KK dan nama tombol
        $link_kk = isset($_POST['link_kk']) ? $_POST['link_kk'] : [];
        $nama_tombol = isset($_POST['nama_tombol']) ? $_POST['nama_tombol'] : [];

        // Proses setiap link KK dan nama tombol
        $query_tombol = "INSERT INTO tombol_data (no, sub_nomor, nipp, link, nama_tombol) VALUES (?, ?, ?, ?, ?)";
        $stmt_tombol = $conn->prepare($query_tombol);

        foreach ($link_kk as $index => $link) {
            $safe_link = htmlspecialchars($link); // Amankan setiap link
            $safe_nama_tombol = htmlspecialchars($nama_tombol[$index]); // Amankan setiap nama tombol
            $stmt_tombol->bind_param("issss", $no, $sub_nomor, $nipp, $safe_link, $safe_nama_tombol);
            $stmt_tombol->execute();
        }

        echo "<script>alert('Berhasil Menambahkan Pekerjaan'); window.location.href='../../pekerjaan.php?nipp=$nipp';</script>";
    } else {
        echo "Gagal menambahkan pekerjaan: " . $conn->error;
    }
}

?>