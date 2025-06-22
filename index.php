<?php 
session_start();
?>

<!DOCTYPE html>
<html lang="id">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="refresh" content="3600">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="image/pelin.png">
    <title>Tabel Pekerjaan</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/sdbarr.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>

<body>
    <?php include 'sidebar.php'; ?>
    <div id="content">
        <div id="top-bar" class="d-flex"
            style="position: fixed; top: 10px; left: 10px; width: 100%; z-index: 20; background-color: white; padding: 15px 30px; box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); height: 70px;">
            <!-- Tombol Toggle Sidebar -->
            <button type="button" id="toggleSidebar" class="btn btn-primary me-2">
                <i class="fas fa-bars"></i>
            </button>
            <p class="badge bg-primary text-wrap fw-bold me-2 text fs-5" style="height: 2.3rem;">Dashboard Kerjaan Aset
                Tetap
            </p>
        </div>

        <div style="margin-top: 10px;">
            <?php include 'calendars.php'; ?>
            <!-- <php include 'chart.php'; ?>
            <div id="tableRutinitasDashboard">
                <php include 'table/table_rutinitas_dashboard.php'; ?>
            </div> -->
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    </div>
</body>

</html>

<script>
function toggleSidebar() {
    const sidebar = document.getElementById("sidebar");
    const content = document.getElementById("content");
    const toggleSidebarBtn = document.getElementById("toggleSidebar");
    const closeSidebarBtn = document.getElementById("closeSidebar");

    // Toggle sidebar visibility
    if (sidebar.style.display === "none" || sidebar.style.display === "") {
        sidebar.style.display = "block"; // Show sidebar
        content.classList.add("sidebar-active"); // Shift content to the right
        toggleSidebarBtn.style.display = "block"; // Hide the toggle button when the sidebar is open
        closeSidebarBtn.style.display = "none"; // Show the close button (arrow-left)
    } else {
        sidebar.style.display = "none"; // Hide sidebar
        content.classList.remove("sidebar-active"); // Reset content margin
        toggleSidebarBtn.style.display = "block"; // Show the toggle button again
        closeSidebarBtn.style.display = "none"; // Hide the close button (arrow-left)
    }
}

// Event listener for the toggle button
document.getElementById('toggleSidebar').addEventListener('click', toggleSidebar);
document.getElementById('closeSidebar').addEventListener('click',
    toggleSidebar); // Event listener for the arrow-left button
</script>