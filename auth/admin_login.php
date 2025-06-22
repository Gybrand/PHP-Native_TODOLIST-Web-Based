<?php
session_start();
include '../config.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $nipp = $_POST['nipp'];
    $password = $_POST['password'];

    $query = "SELECT * FROM useradmin WHERE nipp = ?";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("s", $nipp);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $admin = $result->fetch_assoc();
        if (password_verify($password, $admin['password'])) {
            $_SESSION['admin_logged_in'] = true;
            $_SESSION['admin_nipp'] = $nipp;
            header("Location: ../index.php");
            exit;
        } else {
            $_SESSION['login_error'] = "Password salah!";
        }
    } else {
        $_SESSION['login_error'] = "Admin dengan NIPP ini tidak ditemukan!";
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <!-- Card Container for Login -->
            <div class="card shadow-sm">
                <div class="card-body">
                    <h3 class="text-center mb-4">Login Admin</h3>

                    <!-- Display Login Errors -->
                    <?php if (isset($_SESSION['login_error'])): ?>
                        <div class="alert alert-danger"><?= $_SESSION['login_error']; ?></div>
                        <?php unset($_SESSION['login_error']); ?>
                    <?php endif; ?>

                    <!-- Login Form -->
                    <form action="admin_login.php" method="POST">
                        <div class="mb-3">
                            <label for="nipp" class="form-label">NIPP</label>
                            <input type="text" class="form-control" id="nipp" name="nipp" required>
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label">Password</label>
                            <input type="password" class="form-control" id="password" name="password" required>
                        </div>
                        <button type="submit" class="btn btn-primary w-100 mb-3">Login</button>
                    </form>

                    <!-- Back Button -->
                    <div class="text-center">
                        <a href="../index.php" class="btn btn-secondary w-100">Back to Dashboard</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS & Popper.js -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>

</body>
</html>
