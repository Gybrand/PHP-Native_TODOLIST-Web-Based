<?php 
require 'config.php';
session_start( );
include 'function/modal/modal_add_pekerjaan.php';
?>

<!DOCTYPE html>
<html lang="id">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tabel Pekerjaan</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/sdbarr.css">

</head>

<body>
    <?php 
        include 'sidebar.php'; 
        $nipp = $_GET['nipp'];

        // Query untuk mendapatkan nama berdasarkan nipp
        $queryNama = "SELECT nama FROM userdata WHERE nipp = '$nipp'";
        $resultNama = $conn->query($queryNama);
        $nama = '';

        if ($resultNama->num_rows > 0) {
            $rowNama = $resultNama->fetch_assoc();
            $nama = $rowNama['nama']; // Ambil nama dari hasil query
        }

        $query = "SELECT * FROM pekerjaan WHERE nipp = '$nipp'";
        $result = $conn->query($query);
    ?>

    <div id="content">
        <div id="top-bar" class="d-flex"
            style="position: fixed; top: 10; left: 10; width: 100%; z-index: 100; background-color: white; padding: 15px 30px; box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); height: 70px;">
            <!-- Tombol Toggle Sidebar -->
            <button type="button" id="toggleSidebar" class="btn btn-primary me-2">
                <i class="fas fa-bars"></i>
            </button>
            <p class="badge bg-primary text-wrap fw-bold me-2 text fs-5" style="height: 2.3rem;">Kerjaan
                <?= htmlspecialchars($nama); ?></p>
            <form method="post" class="me-2">
                <button type="button" class="btn btn-outline-primary" data-bs-toggle="modal"
                    data-bs-target="#addPekerjaanModal" onclick="setNipp('<?php echo urlencode($nipp); ?>')">
                    Tambah Kerjaan
                </button>
            </form>
            <form method="post" class="me-2">
                <button type="button" class="btn btn-outline-dark" id="rutinitasButton">
                    Rutinitas
                </button>
            </form>

            <!-- Pemisah -->
            <div class="vr mx-2 me-3"></div>

            <form method="post" class="me-2">
                <button type="button" class="btn btn-outline-info" onclick="scrollToTable('tableOnProgress')">
                    On Progress
                </button>
            </form>
            <form method="post" class="me-2">
                <button type="button" class="btn btn-outline-warning" onclick="scrollToTable('tablePending')">
                    Pending
                </button>
            </form>
            <form method="post" class="me-2">
                <button type="button" class="btn btn-outline-dark" onclick="scrollToTable('tableBelumMulai')">
                    Belum Dimulai
                </button>
            </form>
            <form method="post" class="me-2">
                <button type="button" class="btn btn-outline-success" onclick="scrollToTable('tableDone')">
                    Done
                </button>
            </form>
        </div>

        <div style="margin-top: 80px;">
            <div id="tableRutinitas" class="d-none">
                <?php include 'table/table_rutinitas.php'; ?>
                <?php include 'table/table_riwayat_rutinitas.php'; ?>
            </div>
            <div id="tableOnProgress">
                <?php include 'table/table_onprogress.php'; ?>
            </div>
            <div id="tablePending">
                <?php include 'table/table_pending.php'; ?>
            </div>
            <div id="tableBelumMulai">
                <?php include 'table/table_belummulai.php'; ?>
            </div>
            <div id="tableDone">
                <?php include 'table/table_done.php'; ?>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

    </div>
</body>

</html>

<script>
function scrollToTable(tableId) {
    const tableElement = document.getElementById(tableId);
    if (tableElement) {
        // Hitung posisi tabel
        const offsetTop = tableElement.getBoundingClientRect().top + window.pageYOffset - 90; // Tambahkan margin-top
        // Scroll ke posisi tabel dengan efek halus
        window.scrollTo({
            top: offsetTop,
            behavior: 'smooth'
        });
    }
}

document.getElementById('addPekerjaanModal').addEventListener('show.bs.modal', function(event) {
    var nipp = "<?php echo $nipp; ?>"; // Ambil nipp dari PHP
    document.getElementById('nippField').value = nipp; // Isi input hidden dengan nipp
});

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
        closeSidebarBtn.style.display = "block"; // Show the close button (arrow-left)
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

// Show Rutinitas Table and hide others
document.getElementById('rutinitasButton').addEventListener('click', function() {
    const tableRutinitas = document.getElementById('tableRutinitas');
    const tableOnProgress = document.getElementById('tableOnProgress');
    const tablePending = document.getElementById('tablePending');
    const tableBelumMulai = document.getElementById('tableBelumMulai');
    const tableDone = document.getElementById('tableDone');

    // Tombol navigasi kecuali Tambah Kerjaan dan Rutinitas
    const navButtons = document.querySelectorAll(
        '.vr, form.me-2:not(:has(#rutinitasButton)):not(:has([data-bs-target="#addPekerjaanModal"]))'
    );

    // Toggle visibility of the Rutinitas table
    if (tableRutinitas.classList.contains('d-none')) {
        // Show Rutinitas table and hide others
        tableRutinitas.classList.remove('d-none');
        tableOnProgress.classList.add('d-none');
        tablePending.classList.add('d-none');
        tableBelumMulai.classList.add('d-none');
        tableDone.classList.add('d-none');

        // Hide other navigation buttons
        navButtons.forEach(button => button.classList.add('d-none'));
    } else {
        // Hide Rutinitas table and show others
        tableRutinitas.classList.add('d-none');
        tableOnProgress.classList.remove('d-none');
        tablePending.classList.remove('d-none');
        tableBelumMulai.classList.remove('d-none');
        tableDone.classList.remove('d-none');

        // Show other navigation buttons
        navButtons.forEach(button => button.classList.remove('d-none'));
    }
});
</script>