<?php
include 'config.php';

// Check if 'nipp' is set in the URL
if (isset($_GET['nipp'])) {
    $nipp = mysqli_real_escape_string($conn, $_GET['nipp']);
    // Query to fetch user data based on 'nipp'
    $query = "SELECT nipp, nama FROM userdata WHERE nipp = '$nipp'";
    $result = mysqli_query($conn, $query);

    // Check if user exists
    if ($result && mysqli_num_rows($result) > 0) {
        $row = mysqli_fetch_assoc($result);
        // Return the user data as JSON
        echo json_encode($row);
    } else {
        echo json_encode(['error' => 'User not found']);
    }
}
?>
