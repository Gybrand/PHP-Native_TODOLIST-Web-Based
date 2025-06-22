<?php
include '../../config.php'; // Pastikan koneksi DB sudah benar

// Dapatkan NIPP dari request
if (isset($_GET['nipp'])) {
    $nipp = mysqli_real_escape_string($conn, $_GET['nipp']); // Sanitasi input agar aman dari SQL Injection

    // Mulai transaksi (optional, agar keduanya (user dan pekerjaan) terhapus dalam satu kesatuan)
    mysqli_begin_transaction($conn); // Mulai transaksi

    try {
        // Query untuk menghapus data pekerjaan berdasarkan NIPP
        $queryPekerjaan = "DELETE FROM pekerjaan WHERE nipp = '$nipp'";
        if (!mysqli_query($conn, $queryPekerjaan)) {
            throw new Exception('Error deleting pekerjaan: ' . mysqli_error($conn));
        }

        // Query untuk menghapus data user berdasarkan NIPP
        $queryUser = "DELETE FROM userdata WHERE nipp = '$nipp'";
        if (!mysqli_query($conn, $queryUser)) {
            throw new Exception('Error deleting user: ' . mysqli_error($conn));
        }

        // Commit transaksi jika semua query berhasil
        mysqli_commit($conn);
        echo 'User and related pekerjaan deleted successfully';
    } catch (Exception $e) {
        // Rollback transaksi jika ada error
        mysqli_rollback($conn); // Menggunakan fungsi rollback yang benar
        echo $e->getMessage();
    }

} else {
    echo 'NIPP not provided';
}

mysqli_close($conn); // Menutup koneksi DB
?>
