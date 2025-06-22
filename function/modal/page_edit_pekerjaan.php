<?php
require '../../config.php';

// Validasi parameter input
if (isset($_GET['no'], $_GET['sub_nomor'], $_GET['nipp'])) {
    $no = (int)$_GET['no'];
    $sub_nomor = htmlspecialchars($_GET['sub_nomor']);
    $nipp = htmlspecialchars($_GET['nipp']);

    // Query untuk mengambil data pekerjaan
    $query = "SELECT * FROM pekerjaan WHERE no = ? AND sub_nomor = ? AND nipp = ?";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("iss", $no, $sub_nomor, $nipp);
    $stmt->execute();
    $result = $stmt->get_result();
    $pekerjaan = $result->fetch_assoc();

    if (!$pekerjaan) {
        die("Pekerjaan tidak ditemukan.");
    }
} else {
    die("Parameter tidak lengkap.");
}
?>


<!DOCTYPE html>
<html lang="id">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Pekerjaan</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../../css/side.css">
    <link rel="stylesheet" href="../../css/tablestyle.css">
</head>

<body>
    <?php 
        include '../../sidebar.php'; 
        $nipp = $_GET['nipp'];
        $query = "SELECT * FROM pekerjaan WHERE nipp = '$nipp'";
        $result = $conn->query($query);
    ?>
    <div id="content">
        <div class="container mt-2">
            <h2>Edit Pekerjaan</h2>
            <form action="../edit/edit_pekerjaan.php" method="post">
                <input type="hidden" name="no" value="<?= htmlspecialchars($pekerjaan['no']); ?>">
                <input type="hidden" name="sub_nomor" value="<?= htmlspecialchars($pekerjaan['sub_nomor']); ?>">
                <input type="hidden" name="nipp" value="<?= htmlspecialchars($pekerjaan['nipp']); ?>">

                <div class="mb-3">
                    <label for="deskripsi" class="form-label">Deskripsi Pekerjaan</label>
                    <textarea id="deskripsi" name="deskripsi" class="form-control"
                        rows="4"><?= htmlspecialchars($pekerjaan['deskripsi']); ?></textarea>
                </div>

                

                <div class="mb-3">
                    <label for="deadline" class="form-label">Deadline</label>
                    <input type="date" id="deadline" name="deadline" class="form-control"
                        value="<?= htmlspecialchars($pekerjaan['deadline']); ?>">
                </div>

                <div class="mb-3">
                    <label for="status" class="form-label">Status</label>
                    <select id="status" name="status" class="form-select">
                        <option value="Pending" <?= $pekerjaan['status'] == 'Pending' ? 'selected' : ''; ?>>Pending
                        </option>
                        <option value="On Progress" <?= $pekerjaan['status'] == 'On Progress' ? 'selected' : ''; ?>>On
                            Progress</option>
                        <option value="Belum Dimulai" <?= $pekerjaan['status'] == 'Belum Dimulai' ? 'selected' : ''; ?>>
                            Belum Dimulai</option>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="catatan" class="form-label">Catatan</label>
                    <textarea id="catatan" name="catatan" class="form-control"
                        rows="1"><?= htmlspecialchars($pekerjaan['catatan']); ?></textarea>
                </div>
                <div class="mb-3">
                    <label for="output" class="form-label">Output</label>
                    <textarea id="output" name="output" class="form-control"
                        rows="1"><?= htmlspecialchars($pekerjaan['output']); ?></textarea>
                </div>

                <div class="mb-3">
                    <label class="form-label">Link KK</label>
                    <div id="tombol-container">
                        <?php
                        // Ambil data tombol terkait pekerjaan
                        $query_tombol = "SELECT * FROM tombol_data WHERE no = ? AND sub_nomor = ? AND nipp = ?";
                        $stmt_tombol = $conn->prepare($query_tombol);
                        $stmt_tombol->bind_param("iss", $no, $sub_nomor, $nipp);
                        $stmt_tombol->execute();
                        $result_tombol = $stmt_tombol->get_result();

                        if ($result_tombol->num_rows > 0) {
                            while ($tombol = $result_tombol->fetch_assoc()) {
                        ?>
                        <div class="input-group mb-2">
                            <input type="url" name="link_kk[]" class="form-control" placeholder="Link KK"
                                value="<?= htmlspecialchars($tombol['link']); ?>">
                            <input type="text" name="nama_tombol[]" class="form-control" placeholder="Nama Tombol"
                                value="<?= htmlspecialchars($tombol['nama_tombol']); ?>">
                            <button type="button" class="btn btn-danger remove-tombol">Hapus</button>
                        </div>
                        <?php
                            }
                        } else {
                            // Tambahkan satu input kosong jika tidak ada tombol data
                            ?>
                        <div class="input-group mb-2">
                            <input type="url" name="link_kk[]" class="form-control" placeholder="Link KK">
                            <input type="text" name="nama_tombol[]" class="form-control" placeholder="Nama Tombol">
                            <button type="button" class="btn btn-danger remove-tombol">Hapus</button>
                        </div>
                        <?php
        }
        ?>
                    </div>
                    <button type="button" class="btn btn-success" id="add-tombol">Tambah Tombol</button>
                </div>




                <button type="submit" name="submit" class="btn btn-primary">Update</button>
                <a href="../../pekerjaan.php?nipp=<?= htmlspecialchars($pekerjaan['nipp']); ?>"
                    class="btn btn-secondary">Batal</a>
            </form>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script>
    document.getElementById('add-tombol').addEventListener('click', function() {
        const container = document.getElementById('tombol-container');
        const newInput = document.createElement('div');
        newInput.className = 'input-group mb-2';
        newInput.innerHTML = `
        <input type="url" name="link_kk[]" class="form-control" placeholder="Link KK">
        <input type="text" name="nama_tombol[]" class="form-control" placeholder="Nama Tombol">
        <button type="button" class="btn btn-danger remove-tombol">Hapus</button>
    `;
        container.appendChild(newInput);
    });

    document.getElementById('tombol-container').addEventListener('click', function(e) {
        if (e.target.classList.contains('remove-tombol')) {
            e.target.parentElement.remove();
        }
    });
    </script>

</body>

</html>