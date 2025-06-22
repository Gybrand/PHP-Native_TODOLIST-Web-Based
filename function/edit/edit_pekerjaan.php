<?php
include '../../config.php';

if (isset($_POST['submit'])) {
    // Ambil data dari form
    $no = $_POST['no'];
    $sub_nomor = $_POST['sub_nomor'];
    $nipp = $_POST['nipp'];
    $deskripsi = $_POST['deskripsi'];
 
    $deadline = isset($_POST['deadline']) && $_POST['deadline'] !== '' ? $_POST['deadline'] : NULL;
    $status = $_POST['status'];
    $catatan = $_POST['catatan'];
    $output = $_POST['output'];

    // Update data pekerjaan
    $query = "UPDATE pekerjaan SET deskripsi = ?, deadline = ?, status = ?, catatan = ?, output = ?
              WHERE no = ? AND sub_nomor = ? AND nipp = ?";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("ssssssss", $deskripsi,  $deadline, $status, $catatan, $output, $no, $sub_nomor, $nipp);

    if ($stmt->execute()) {
        // Hapus tombol data lama
        $query_delete = "DELETE FROM tombol_data WHERE no = ? AND sub_nomor = ? AND nipp = ?";
        $stmt_delete = $conn->prepare($query_delete);
        $stmt_delete->bind_param("iss", $no, $sub_nomor, $nipp);
        $stmt_delete->execute();

        // Masukkan tombol data baru
        if (!empty($_POST['link_kk']) && !empty($_POST['nama_tombol'])) {
            $query_tombol = "INSERT INTO tombol_data (no, sub_nomor, nipp, link, nama_tombol) VALUES (?, ?, ?, ?, ?)";
            $stmt_tombol = $conn->prepare($query_tombol);

            foreach ($_POST['link_kk'] as $index => $link) {
                $nama_tombol = $_POST['nama_tombol'][$index];
                $stmt_tombol->bind_param("issss", $no, $sub_nomor, $nipp, htmlspecialchars($link), htmlspecialchars($nama_tombol));
                $stmt_tombol->execute();
            }
        }

        echo "<script>alert('Berhasil Memperbarui Pekerjaan'); window.location.href='../../pekerjaan.php?nipp=$nipp';</script>";
    } else {
        echo "Gagal memperbarui pekerjaan: " . $conn->error;
    }
}

?>