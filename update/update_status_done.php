<?php
include '../config.php';

// Periksa apakah data yang dibutuhkan ada
if (isset($_POST['no'], $_POST['sub_nomor'], $_POST['nipp'])) {
    $no = $_POST['no'];
    $sub_nomor = $_POST['sub_nomor'];
    $nipp = $_POST['nipp'];

    // Query untuk mengubah status pekerjaan menjadi 'Done'
    $sql_update = "UPDATE pekerjaan SET status = 'Done' WHERE no = ? AND sub_nomor = ? AND nipp = ?";
    $stmt_update = $conn->prepare($sql_update);
    $stmt_update->bind_param("iss", $no, $sub_nomor, $nipp);

    if ($stmt_update->execute()) {
        // Jika berhasil, redirect kembali ke halaman pekerjaan.php
        echo "<script>alert('Status pekerjaan berhasil diubah menjadi Done.'); window.location.href='../pekerjaan.php?nipp=$nipp';</script>";
    } else {
        echo "<div class='alert alert-danger'>Gagal memperbarui status pekerjaan.</div>";
    }
} else {
    echo "<div class='alert alert-danger'>Data tidak lengkap.</div>";
}
?>
