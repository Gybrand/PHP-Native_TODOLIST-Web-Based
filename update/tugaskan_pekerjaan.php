<?php
session_start();
include '../config.php'; // Koneksi ke database

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Ambil data dari form
    $nipp = $_POST['nipp'];
    $deadline = $_POST['deadline'];
    $nama_kerjaan = $_POST['nama_kerjaan'];
    $status = 'belum dimulai'; // Status default

    // Cari nomor terakhir berdasarkan nipp
    $query_last_no = "SELECT MAX(no) AS last_no FROM pekerjaan WHERE nipp = ?";
    $stmt_last_no = $conn->prepare($query_last_no);
    $stmt_last_no->bind_param("s", $nipp);
    $stmt_last_no->execute();
    $result_last_no = $stmt_last_no->get_result();
    $last_no = $result_last_no->fetch_assoc();
    
    // Jika belum ada pekerjaan untuk nipp ini, mulai dari 1
    $new_no = ($last_no['last_no'] === null) ? 1 : $last_no['last_no'] + 1;

    // Insert data ke tabel pekerjaan dengan nomor baru dan status 'belum dimulai'
    $query = "INSERT INTO pekerjaan (no, deskripsi, deadline, nipp, status) VALUES (?, ?, ?, ?, ?)";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("issss", $new_no, $nama_kerjaan, $deadline, $nipp, $status);

    if ($stmt->execute()) {
        // Update nipp di tabel kerjaan_baru berdasarkan pekerjaan_id
        $pekerjaan_id = $_POST['pekerjaan_id'];  // Pastikan ini diterima dari form
        $update_query = "UPDATE kerjaan_baru SET nipp = ? WHERE id = ?";
        $update_stmt = $conn->prepare($update_query);
        $update_stmt->bind_param("si", $nipp, $pekerjaan_id);

        if ($update_stmt->execute()) {
            // Redirect kembali ke halaman utama setelah berhasil
            header("Location: ../page_tambah_kerjaan.php"); // Ganti dengan halaman yang sesuai
        } else {
            // Menangani error update
            echo "Terjadi kesalahan saat update: " . $update_stmt->error;
        }
    } else {
        // Menangani error insert
        echo "Terjadi kesalahan: " . $stmt->error;
    }
}
?>
