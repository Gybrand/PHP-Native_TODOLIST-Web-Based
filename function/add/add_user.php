<?php
include '../../config.php'; // Database connection

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $nipp = mysqli_real_escape_string($conn, $_POST['nipp']);
    $nama = mysqli_real_escape_string($conn, $_POST['nama']);

    // Insert query
    $sql = "INSERT INTO userdata (nipp, nama) VALUES ('$nipp', '$nama')";

    if (mysqli_query($conn, $sql)) {
        echo "<script>
                alert('User added successfully!');
                window.location.href = '../../index.php';
              </script>";
    } else {
        echo "<script>
                alert('Error adding user: " . mysqli_error($conn) . "');
                window.location.href = '../../index.php';
              </script>";
    }
}
