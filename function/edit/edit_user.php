<?php
include '../../config.php';

// Check if form is submitted
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Get the data from the form
    $nipp = mysqli_real_escape_string($conn, $_POST['nipp']); // NIPP will remain unchanged
    $nama = mysqli_real_escape_string($conn, $_POST['nama']); // Nama will be updated

    // Update the user data in the database
    $query = "UPDATE userdata SET nama = '$nama' WHERE nipp = '$nipp'";
    $result = mysqli_query($conn, $query);

    if ($result) {
        echo "<script>
                alert('User update successfully!');
                window.location.href = '../../index.php';
              </script>";
    } else {
        echo "Error updating user: " . mysqli_error($conn);
    }
}
?>
