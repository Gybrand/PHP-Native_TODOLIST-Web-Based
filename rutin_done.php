<?php
include 'config.php';

// Periksa apakah parameter 'done', 'id', dan 'nipp' ada di URL
if (isset($_POST['submit_done'], $_POST['id'], $_POST['nipp'])) {
    $id = $_POST['id'];
    $nipp = $_POST['nipp'];
    $link = isset($_POST['link']) ? $_POST['link'] : null;

    // Proses gambar
    $gambar = null;
    if (isset($_FILES['gambar']) && $_FILES['gambar']['error'] == UPLOAD_ERR_OK) {
        $target_dir = "uploads/";
        $gambar = $target_dir . basename($_FILES["gambar"]["name"]);
        move_uploaded_file($_FILES["gambar"]["tmp_name"], $gambar);
    }

    $sql_select = "SELECT * FROM rutin WHERE id = ? AND nipp = ?";
    $stmt_select = $conn->prepare($sql_select);
    $stmt_select->bind_param("is", $id, $nipp);
    $stmt_select->execute();
    $result_select = $stmt_select->get_result();
    $data_rutin = $result_select->fetch_assoc();

    if ($data_rutin) {
        $bulan = $data_rutin['bulan'];
        $tahun = $data_rutin['tahun'];
        $periode = $data_rutin['periode'];

        $date = DateTime::createFromFormat('Y-m-d', "$tahun-$bulan-01");
        $date->modify("+$periode month");

        $bulan_next = $date->format('m');
        $tahun_next = $date->format('Y');

        $sql_insert = "INSERT INTO penyelesaian_rutin (id, nipp, bulan, tahun, status_selesai, gambar, link)
                       VALUES (?, ?, ?, ?, ?, ?, ?)";
        $stmt_insert = $conn->prepare($sql_insert);
        $status_selesai = 1;
        $stmt_insert->bind_param("isiiiss", $id, $nipp, $bulan, $tahun, $status_selesai, $gambar, $link);

        if ($stmt_insert->execute()) {
            $sql_update = "UPDATE rutin SET bulan = ?, tahun = ? WHERE id = ? AND nipp = ?";
            $stmt_update = $conn->prepare($sql_update);
            $stmt_update->bind_param("iiis", $bulan_next, $tahun_next, $id, $nipp);

            if ($stmt_update->execute()) {
                echo "<script>alert('Berhasil Memperbarui Rutinitas'); window.location.href='pekerjaan.php?nipp=$nipp';</script>";
            } else {
                echo "<script>alert('Gagal Memperbarui Rutinitas'); window.location.href='pekerjaan.php?nipp=$nipp';</script>";
            }
        } else {
            echo "<script>alert('Gagal Mencatatkan Penyelesaian Rutinitas'); window.location.href='pekerjaan.php?nipp=$nipp';</script>";
        }
    } else {
        echo "<script>alert('Data Rutinitas Tidak Ditemukan'); window.location.href='pekerjaan.php?nipp=$nipp';</script>";
    }
}

