<?php 

// Konfigurasi pagination
$entriesPerPage = 20; // Jumlah data per halaman
$page = isset($_GET['page_done']) ? (int)$_GET['page_done'] : 1; // Halaman saat ini (default 1)
$offset = ($page - 1) * $entriesPerPage; // Hitung offset

// Query total data untuk menghitung jumlah halaman
$countQuery = "SELECT COUNT(*) as total FROM pekerjaan WHERE nipp = '$nipp' AND status = 'DONE'";
$countResult = $conn->query($countQuery);
$totalEntries = $countResult->fetch_assoc()['total'];
$totalPages = ceil($totalEntries / $entriesPerPage); // Total halaman

// Query data dengan limit dan offset untuk halaman saat ini
$query = "SELECT * FROM pekerjaan WHERE nipp = '$nipp' AND status = 'DONE' LIMIT $entriesPerPage OFFSET $offset";
$result = $conn->query($query);
?>

<div class="container-fluid mt-5">
    <hr>
    <span class="badge rounded-pill text-bg-success mb-3 fw-bold text fs-5" style="height: 2.3rem;">Done</span>
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
            <?php if ($result->num_rows > 0): ?>
            <?php while ($row = $result->fetch_assoc()): ?>
            <tr>
                <td><?= htmlspecialchars($row['no']); ?></td>
                <td><?= htmlspecialchars($row['sub_nomor']); ?></td>
                <td><?= htmlspecialchars($row['deskripsi']); ?></td>
                <td>
                    <?php
                            $deadline = htmlspecialchars($row['deadline']);
                            if ($deadline) {
                                $dateObj = DateTime::createFromFormat('Y-m-d', $deadline);
                                echo $dateObj ? $dateObj->format('d M Y') : $deadline;
                            } else {
                                echo '-';
                            }
                            ?>
                </td>
                <td>
                    <span class="badge <?= ($row['status'] == 'Done') ? 'bg-success' : 'bg-secondary'; ?>">
                        <?= htmlspecialchars($row['status']); ?>
                    </span>
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
                                    $buttonClass = (strpos($link, 'docs.google.com/spreadsheets') !== false) ? 'btn-success' : 'btn-secondary';
                                    echo '<a href="' . $link . '" class="btn ' . $buttonClass . ' btn-sm mb-1" target="_blank">'
                                        . $namaTombol . '</a><br>';
                                }
                            } else {
                                echo '-';
                            }
                            ?>
                </td>
                <td>
                    <a href="function/modal/page_edit_pekerjaan.php?no=<?= $row['no']; ?>&sub_nomor=<?= urlencode($row['sub_nomor']); ?>&nipp=<?= urlencode($row['nipp']); ?>"
                        class="btn btn-warning btn-sm mt-1">Edit</a>
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
                <td colspan="9" class="text-center">Tidak ada pekerjaan dengan status 'Done' ditemukan untuk NIPP ini.
                </td>
            </tr>
            <?php endif; ?>
        </tbody>
    </table>

    <nav>
        <ul class="pagination justify-content-center">
            <?php if ($page > 1): ?>
            <!-- Tautan ke halaman pertama -->
            <li class="page-item">
                <a class="page-link" href="?nipp=<?= urlencode($nipp); ?>&page_done=1">First</a>
            </li>
            <!-- Tautan ke halaman sebelumnya -->
            <li class="page-item">
                <a class="page-link" href="?nipp=<?= urlencode($nipp); ?>&page_done=<?= $page - 1; ?>">Previous</a>
            </li>
            <?php endif; ?>

            <!-- Tautan ke 3 halaman di sekitar halaman aktif -->
            <?php 
        $range = 5; // Tentukan range halaman
        $start = max(1, $page - floor($range / 2)); 
        $end = min($totalPages, $start + $range - 1);

        // Pastikan jumlah halaman yang ditampilkan sesuai range
        if ($end - $start < $range - 1) {
            $start = max(1, $end - $range + 1);
        }

        for ($i = $start; $i <= $end; $i++): ?>
            <li class="page-item <?= ($i == $page) ? 'active' : ''; ?>">
                <a class="page-link" href="?nipp=<?= urlencode($nipp); ?>&page_done=<?= $i; ?>"><?= $i; ?></a>
            </li>
            <?php endfor; ?>

            <?php if ($page < $totalPages): ?>
            <!-- Tautan ke halaman berikutnya -->
            <li class="page-item">
                <a class="page-link" href="?nipp=<?= urlencode($nipp); ?>&page_done=<?= $page + 1; ?>">Next</a>
            </li>
            <!-- Tautan ke halaman terakhir -->
            <li class="page-item">
                <a class="page-link" href="?nipp=<?= urlencode($nipp); ?>&page_done=<?= $totalPages; ?>">Last</a>
            </li>
            <?php endif; ?>
        </ul>
    </nav>



</div>