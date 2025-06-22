<?php 
session_start();
include '../../config.php'; // Pastikan Anda memiliki file koneksi ke database

if (isset($_GET['id'])) {
    $id = $_GET['id'];

    // Pastikan id adalah angka untuk menghindari SQL Injection
    $id = (int) $id;

    // Query untuk menghapus data berdasarkan ID
    $sql = "DELETE FROM kerjaan_baru WHERE id = $id";

    if ($conn->query($sql) === TRUE) {
        echo "<script>alert('Data berhasil dihapus!'); window.location.href='../../page_tambah_kerjaan.php';</script>";
    } else {
        echo "<script>alert('Terjadi kesalahan: {$conn->error}'); window.location.href='../../page_tambah_kerjaan.php';</script>";
    }
} else {
    echo "<script>alert('ID tidak ditemukan!'); window.location.href='../../page_tambah_kerjaan.php';</script>";
}
