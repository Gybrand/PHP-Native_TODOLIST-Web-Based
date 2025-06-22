<?php
include '../../config.php';

// Cek apakah parameter 'no', 'sub_nomor', dan 'nipp' ada di URL
if (isset($_GET['no']) && isset($_GET['sub_nomor']) && isset($_GET['nipp'])) {
    $no = $_GET['no'];
    $sub_nomor = $_GET['sub_nomor'];
    $nipp = $_GET['nipp'];

    // Query untuk menghapus data pekerjaan
    $query = "DELETE FROM pekerjaan WHERE no = ? AND sub_nomor = ? AND nipp = ?";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("iss", $no, $sub_nomor, $nipp);

    // Eksekusi query dan periksa apakah berhasil
    if ($stmt->execute()) {
        echo "<script>alert('Pekerjaan Berhasil Dihapus'); window.location.href='../../pekerjaan.php?nipp=$nipp';</script>";
    } else {
        echo "Gagal menghapus pekerjaan: " . $conn->error;
    }
} else {
    echo "Parameter tidak lengkap.";
}
?>
