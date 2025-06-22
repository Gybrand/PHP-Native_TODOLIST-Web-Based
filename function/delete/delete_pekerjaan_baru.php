<?php
include '../../config.php'; // Pastikan koneksi database sudah ada

// Query untuk menghapus semua data pekerjaan
$query = "DELETE FROM kerjaan_baru";

if ($conn->query($query) === TRUE) {
    // Jika berhasil, arahkan ke halaman dengan pesan sukses
    $_SESSION['message'] = 'Semua pekerjaan berhasil dihapus';
    header('Location: ../../page_tambah_kerjaan.php');
} else {
    // Jika gagal, arahkan dengan pesan error
    $_SESSION['message'] = 'Gagal menghapus pekerjaan: ' . $conn->error;
    header('Location: ../../page_tambah_kerjaan.php');
}

$conn->close();
exit;
?>
