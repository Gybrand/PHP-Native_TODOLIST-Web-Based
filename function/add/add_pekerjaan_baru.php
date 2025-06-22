<?php 
session_start();
include '../../config.php'; // Pastikan Anda memiliki file koneksi ke database

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Mengambil data dari form
    $nama_kerjaan = $conn->real_escape_string($_POST['nama_kerjaan']);
    $deadline = $conn->real_escape_string($_POST['deadline']);
    // Query untuk menambahkan pekerjaan ke database
    $sql = "INSERT INTO kerjaan_baru (nama_kerjaan, deadline) VALUES ('$nama_kerjaan', '$deadline')";

    if ($conn->query($sql) === TRUE) {
        echo "<script>alert('Data berhasil ditambahkan!'); window.location.href='../../page_tambah_kerjaan.php';</script>";
    } else {
        echo "<script>alert('Terjadi kesalahan: {$conn->error}'); window.location.href='../../page_tambah_kerjaan.php';</script>";
    }
}
?>
