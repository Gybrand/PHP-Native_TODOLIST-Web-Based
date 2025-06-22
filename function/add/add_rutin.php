<?php
include '../../config.php';

// Memeriksa apakah form telah disubmit
if (isset($_POST['submit'])) {
    // Ambil data dari form, tanpa ID
    $nipp = $_POST['nipp']; // NIPP
    $nama_tugas = $_POST['nama_tugas']; // Nama tugas
    $hari = $_POST['hari']; // Bulan
    $bulan = $_POST['bulan']; // Bulan
    $tahun = $_POST['tahun']; // Tahun
    $periode = $_POST['periode']; // Periode tugas

    $sql_rutin = "INSERT INTO rutin (nipp, nama_tugas, hari, bulan, tahun, periode) 
                  VALUES (?, ?, ?, ?, ?, ?)";
    $stmt = $conn->prepare($sql_rutin);
    $stmt->bind_param("ssssss", $nipp, $nama_tugas,$hari, $bulan, $tahun, $periode); // Bind parameter
    

    // Eksekusi query untuk insert rutinitas
    if ($stmt->execute()) {
        // Mendapatkan ID yang dihasilkan oleh auto-increment
        $id = $stmt->insert_id;

        // Menyimpan status penyelesaian rutinitas (default false)
        $sql_penyelesaian = "INSERT INTO penyelesaian_rutin (id, nipp, status_selesai) 
                             VALUES (?, ?, 0)";
        $stmt_penyelesaian = $conn->prepare($sql_penyelesaian);
        $stmt_penyelesaian->bind_param("is", $id, $nipp);

        // Eksekusi query untuk status penyelesaian
        if ($stmt_penyelesaian->execute()) {
            // Redirect ke halaman pekerjaan.php dengan parameter nipp
            echo "<script>alert('Berhasil Menambah Rutinitas'); window.location.href='../../pekerjaan.php?nipp=" . urlencode($nipp) . "';</script>";
            exit(); // Menghentikan eksekusi setelah redirect
        } else {
            echo "Gagal menambahkan status penyelesaian: " . $conn->error;
        }
    } else {
        // Jika query gagal, tampilkan pesan error
        echo "Gagal menambahkan rutinitas: " . $conn->error;
    }
}
?>