<?php
include '../config.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $nipp = $_POST['nipp'];
    $password = password_hash($_POST['password'], PASSWORD_DEFAULT);

    $query = "INSERT INTO useradmin (nipp, password) VALUES (?, ?)";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("ss", $nipp, $password);

    if ($stmt->execute()) {
        header("Location: ../index.php");
        exit;
    } else {
        $error = "Terjadi kesalahan saat mendaftar admin.";
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <!-- Card Container for Registration -->
            <div class="card shadow-sm">
                <div class="card-body">
                    <h3 class="text-center mb-4">Register Admin</h3>

                    <!-- Display Registration Errors -->
                    <?php if (isset($error)): ?>
                        <div class="alert alert-danger"><?= $error; ?></div>
                    <?php endif; ?>

                    <!-- Registration Form -->
                    <form action="admin_register.php" method="POST">
                        <div class="mb-3">
                            <label for="nipp" class="form-label">NIPP</label>
                            <input type="text" class="form-control" id="nipp" name="nipp" required>
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label">Password</label>
                            <input type="password" class="form-control" id="password" name="password" required>
                        </div>
                        <button type="submit" class="btn btn-primary w-100 mb-3">Register</button>
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
