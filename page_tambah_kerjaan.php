<?php 
session_start();
include 'config.php'; // Pastikan Anda memiliki file koneksi ke database
?>

<!DOCTYPE html>
<html lang="id">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="image/web.png">
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
            style="position: fixed; top: 20px; left: 10px; width: 100%; z-index: 20; background-color: white; padding: 15px 30px; box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); height: 70px;">
            <button type="button" id="toggleSidebar" class="btn btn-primary me-2">
                <i class="fas fa-bars"></i>
            </button>
            <p class="badge bg-primary text-wrap fw-bold me-2 text fs-5" style="height: 2.3rem;">Tambah Pekerjaan</p>
        </div>

        <div class="container mt-5 pt-5">
            <!-- Form untuk menambah pekerjaan -->
            <form method="POST" action="function/add/add_pekerjaan_baru.php" class="row g-3 ">
                <div class="col-md-3">
                    <label for="nama_kerjaan" class="form-label">Nama Pekerjaan</label>
                    <input type="text" class="form-control" id="nama_kerjaan" name="nama_kerjaan" required>
                </div>
                <div class="col-md-3">
                    <label for="deadline" class="form-label">Deadline</label>
                    <input type="date" class="form-control" id="deadline" name="deadline" required>
                </div>
                <div class="col-md-3 align-self-end">
                    <button type="submit" class="btn btn-success w-100">Tambah</button>
                </div>
                <div class="col-md-3 align-self-end">
                    <button type="button" class="btn btn-danger w-100" data-bs-toggle="modal"
                        data-bs-target="#deleteAllModal">
                        Hapus Daftar Pekerjaan
                    </button>
                </div>
            </form>

            <!-- Tabel daftar pekerjaan -->
            <div class="container-fluid mt-5">
                <table class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th class="text-center">No</th>
                            <th class="text-center">Nama Tugas</th>
                            <th class="text-center">Tanggal</th>
                            <th class="text-center">Nama</th>
                            <th class="text-center">Aksi</th>
                        </tr>
                    </thead>
                    <tbody>
                    <tbody>
                        <?php 
                        $query = "
                            SELECT k.id, k.nama_kerjaan, k.deadline, k.nipp, u.nama 
                            FROM kerjaan_baru k
                            LEFT JOIN userdata u ON k.nipp = u.nipp
                            ORDER BY k.deadline ASC
                        ";
                        $result = $conn->query($query);

                        $no = 1;
                        if ($result && $result->num_rows > 0): 
                            while ($row = $result->fetch_assoc()): 
                                $isNippAssigned = !empty($row['nipp']); // Cek apakah nipp sudah terisi
                        ?>
                        <tr>
                            <td class="text-center"><?php echo $no++; ?></td>
                            <td class="text-center"><?php echo htmlspecialchars($row['nama_kerjaan']); ?></td>
                            <td class="text-center"><?php echo htmlspecialchars($row['deadline']); ?></td>
                            <td class="text-center"><?php echo htmlspecialchars($row['nama']); ?></td>
                            <!-- Menampilkan nama dari tabel userdata -->
                            <td class="text-center">
                                <!-- Tombol Tugaskan hanya akan tampil jika nipp belum terisi -->
                                <?php if (!$isNippAssigned): ?>
                                <button class="btn btn-primary" data-bs-toggle="modal"
                                    data-bs-target="#assignModal<?php echo $row['id']; ?>">Tugaskan</button>
                                <?php endif; ?>
                                <a href="function/delete/delete_pekerjaan_baru_satu.php?id=<?php echo $row['id']; ?>"
                                    class="btn btn-danger">Delete</a>
                            </td>
                        </tr>
                        <?php 
                            endwhile; 
                        else: 
                        ?>
                        <tr>
                            <td colspan="5" class="text-center">Tidak ada pekerjaan ditemukan.</td>
                        </tr>
                        <?php endif; ?>
                    </tbody>


                </table>
            </div>
        </div>
    </div>

    <!-- Modal untuk Tugaskan -->
    <?php 
    $result = $conn->query("SELECT id, nama_kerjaan, deadline FROM kerjaan_baru ORDER BY deadline ASC");
    while ($row = $result->fetch_assoc()): 
    ?>
    <div class="modal fade" id="assignModal<?php echo $row['id']; ?>" tabindex="-1" aria-labelledby="assignModalLabel"
        aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="assignModalLabel">Tugaskan Pekerjaan</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form method="POST" action="update/tugaskan_pekerjaan.php">
                        <input type="hidden" name="pekerjaan_id" value="<?php echo $row['id']; ?>">
                        <div class="mb-3">
                            <label for="nipp" class="form-label">Pilih NIPP</label>
                            <select class="form-select" name="nipp" required>
                                <?php
                                // Mengambil NIPP dari tabel userdata
                                $nippQuery = "SELECT nipp, nama FROM userdata";
                                $nippResult = $conn->query($nippQuery);
                                if ($nippResult && $nippResult->num_rows > 0):
                                    while ($nippRow = $nippResult->fetch_assoc()):
                                ?>
                                <option value="<?php echo $nippRow['nipp']; ?>">
                                    <?php echo htmlspecialchars($nippRow['nama']) . " - " . $nippRow['nipp']; ?>
                                </option>
                                <?php endwhile; endif; ?>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="deadline" class="form-label">Deadline</label>
                            <input type="text" class="form-control" name="deadline"
                                value="<?php echo htmlspecialchars($row['deadline']); ?>" readonly>
                        </div>
                        <div class="mb-3">
                            <label for="nama_kerjaan" class="form-label">Nama Pekerjaan</label>
                            <input type="text" class="form-control" name="nama_kerjaan"
                                value="<?php echo htmlspecialchars($row['nama_kerjaan']); ?>" readonly>
                        </div>
                        <button type="submit" class="btn btn-success">Tugaskan Pekerjaan</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <?php endwhile; ?>
    <!-- Modal Konfirmasi Hapus Semua -->
    <div class="modal fade" id="deleteAllModal" tabindex="-1" aria-labelledby="deleteAllModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="deleteAllModalLabel">Konfirmasi Hapus Semua Pekerjaan</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p>Apakah Anda yakin ingin menghapus semua pekerjaan? Data yang sudah dihapus tidak bisa
                        dikembalikan.</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Batal</button>
                    <form action="function/delete/delete_pekerjaan_baru.php" method="POST">
                        <button type="submit" class="btn btn-danger">Hapus Semua</button>
                    </form>
                </div>
            </div>
        </div>
    </div>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
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