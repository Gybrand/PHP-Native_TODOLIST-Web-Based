<div class="container-fluid mt-5">
    <hr>
    <span class="badge rounded-pill text-bg-secondary mb-3 fw-bold text fs-5" style="height: 2.3rem;">Belum
        Dimulai</span>
    <table class="table table-bordered table-striped">
        <thead>
            <tr>
                <th class="text-center">No</th>
                <th class="text-center">Sub</th>
                <th class="text-center">Deskripsi Pekerjaan</th>
                <th class="text-center">Deadline</th>
                <th class="text-center">Status</th>
                <th class="text-center">Catatan</th>
                <th class="text-center">Output Kerjaan</th>
                <th class="text-center">Link KK</th>
                <th class="text-center">Aksi</th>
            </tr>
        </thead>
        <tbody>
            <?php 
            // Query untuk menampilkan pekerjaan dengan status 'Belum Dimulai' dan mengurutkan berdasarkan deadline yang paling dekat
            $query = "SELECT * FROM pekerjaan WHERE nipp = '$nipp' AND status = 'Belum Dimulai' ORDER BY 
              CASE 
                  WHEN deadline = '-' OR deadline IS NULL THEN 1
                  ELSE 0
              END, 
              deadline ASC";
            $result = $conn->query($query);

            if ($result->num_rows > 0): ?>
            <?php while ($row = $result->fetch_assoc()): ?>
            <tr>
                <td><?= htmlspecialchars($row['no']); ?></td>
                <td><?= htmlspecialchars($row['sub_nomor']); ?></td>
                <td><?= htmlspecialchars($row['deskripsi']); ?></td>

                <td>
                    <?php
                    // Mengambil nilai tanggal dari database
                    $deadline = htmlspecialchars($row['deadline']);

                    // Jika tanggal ada dan valid, format menggunakan DateTime
                    if ($deadline) {
                        $dateObj = DateTime::createFromFormat('Y-m-d', $deadline); // Menggunakan format dari database (YYYY-MM-DD)
                        if ($dateObj) {
                            echo $dateObj->format('d M Y'); // Format yang diinginkan (DD-MM-YYYY)
                        } else {
                            echo $deadline; // Menampilkan tanggal apa adanya jika format tidak valid
                        }
                    } else {
                        echo '-'; // Jika tidak ada tanggal
                    }
                    ?>
                </td>
                <td>
                    <?php
    $status = htmlspecialchars($row['status']);
    $badgeClass = '';
    $lateBadge = '';

    // Tentukan kelas berdasarkan nilai status
    switch ($status) {
        case 'Done':
            $badgeClass = 'badge bg-success';
            break;
        case 'On Progress':
            $badgeClass = 'badge bg-info';
            break;
        case 'Pending':
            $badgeClass = 'badge bg-warning';
            break;
        default:
            $badgeClass = 'badge bg-secondary';
            break;
    }

    // Cek apakah deadline sudah lewat
    $deadline = htmlspecialchars($row['deadline']);
    if ($deadline && $status == 'Belum Dimulai') {
        $today = new DateTime();
        $deadlineDate = DateTime::createFromFormat('Y-m-d', $deadline);

        // Cek apakah deadline sudah lewat
        if ($deadlineDate && $deadlineDate < $today) {
            $lateBadge = '<span class="badge bg-danger ms-2 mt-1 d-block">Terlambat</span>';
        }
    }
    ?>
                    <span class="<?= $badgeClass; ?>"><?= $status; ?></span>
                    <?= $lateBadge; ?>
                </td>

                <td><?= htmlspecialchars($row['catatan']); ?></td>
                <td><?= htmlspecialchars($row['output']); ?></td>
                <td>
                    <?php
                            $queryLinks = "SELECT link, nama_tombol FROM tombol_data WHERE no = ? AND sub_nomor = ? AND nipp = ?";
                            $stmtLinks = $conn->prepare($queryLinks);
                            $stmtLinks->bind_param("iss", $row['no'], $row['sub_nomor'], $row['nipp']);
                            $stmtLinks->execute();
                            $resultLinks = $stmtLinks->get_result();

                            if ($resultLinks->num_rows > 0) {
                                while ($linkRow = $resultLinks->fetch_assoc()) {
                                    $link = htmlspecialchars($linkRow['link']);
                                    $namaTombol = htmlspecialchars($linkRow['nama_tombol']);

                                    // Cek apakah link mengarah ke Google Spreadsheet
                                    $buttonClass = (strpos($link, 'docs.google.com/spreadsheets') !== false) ? 'btn-success' : 'btn-secondary';

                                    echo '<a href="' . $link . '" class="btn ' . $buttonClass . ' btn-sm mb-1" style="text-align: left;" target="_blank">'
                                         . $namaTombol . '</a><br>';
                                }
                            } else {
                                echo '-';
                            }
                            ?>
                </td>

                <td>
                    <?php if (isset($_SESSION['admin_logged_in'])): ?>
                    <form action="update/update_status_done.php" method="POST" class="d-inline">
                        <input type="hidden" name="no" value="<?= $row['no']; ?>">
                        <input type="hidden" name="sub_nomor" value="<?= $row['sub_nomor']; ?>">
                        <input type="hidden" name="nipp" value="<?= $row['nipp']; ?>">
                        <button type="submit" class="btn btn-success btn-sm">Done</button>
                    </form>
                    <?php endif; ?>

                    <!-- Tombol Edit -->
                    <a href="function/modal/page_edit_pekerjaan.php?no=<?= $row['no']; ?>&sub_nomor=<?= urlencode($row['sub_nomor']); ?>&nipp=<?= urlencode($row['nipp']); ?>"
                        class="btn btn-warning btn-sm">Edit</a>

                    <!-- Tombol Delete -->
                    <a href="function/delete/delete_pekerjaan.php?no=<?= $row['no']; ?>&sub_nomor=<?= urlencode($row['sub_nomor']); ?>&nipp=<?= urlencode($row['nipp']); ?>"
                        class="btn btn-danger btn-sm mt-1"
                        onclick="return confirm('Apakah Anda yakin ingin menghapus pekerjaan ini?');">
                        Delete
                    </a>
                </td>
            </tr>
            <?php endwhile; ?>
            <?php else: ?>
            <tr>
                <td colspan="9" class="text-center">Tidak ada pekerjaan dengan status 'Belum Dimulai' ditemukan untuk
                    NIPP ini.</td>
            </tr>
            <?php endif; ?>
        </tbody>
    </table>
</div>