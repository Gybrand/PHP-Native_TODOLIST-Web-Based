<?php
include 'config.php';

// Mendapatkan NIPP dari parameter URL atau session (sesuaikan kebutuhan)
$nipp = isset($_GET['nipp']) ? $_GET['nipp'] : '';

// Array bulan untuk konversi angka bulan menjadi nama bulan
$bulan_array = [
    1 => 'Januari', 2 => 'Februari', 3 => 'Maret', 4 => 'April', 5 => 'Mei', 6 => 'Juni',
    7 => 'Juli', 8 => 'Agustus', 9 => 'September', 10 => 'Oktober', 11 => 'November', 12 => 'Desember'
];

// Query untuk mendapatkan riwayat penyelesaian
$query = "SELECT p.id, p.nipp, p.bulan, p.tahun, p.status_selesai, p.gambar, p.link, r.nama_tugas
          FROM penyelesaian_rutin p
          INNER JOIN rutin r ON p.id = r.id
          WHERE p.nipp = ?
          ORDER BY p.tahun DESC, p.bulan DESC";
$stmt = $conn->prepare($query);
$stmt->bind_param("s", $nipp);
$stmt->execute();
$result = $stmt->get_result();
?>

<div class="container-fluid mt-5">
<span class="badge rounded-pill text-bg-dark mb-3 fw-bold text fs-5" style="height: 2.3rem;">Riwayat Penyelesaian Rutinitas</span>
    <table class="table table-bordered table-striped mt-3">
        <thead>
            <tr>
                <th class="text-center">No</th>
                <th class="text-center">Nama Tugas</th>
                <th class="text-center">Tanggal Penyelesaian</th>
                <th class="text-center">Gambar</th>
                <th class="text-center">Link</th>
            </tr>
        </thead>
        <tbody>
            <?php 
            if ($result && $result->num_rows > 0):
                $no = 1;
                while ($row = $result->fetch_assoc()): 
                    $bulan_nama = $bulan_array[$row['bulan']]; // Mendapatkan nama bulan
            ?>
            <tr>
                <td class="text-center"><?= $no++; ?></td>
                <td class="text-center"><?= htmlspecialchars($row['nama_tugas']); ?></td>
                <td class="text-center"><?= htmlspecialchars($row['bulan']) . ' ' . $bulan_nama . ' ' . htmlspecialchars($row['tahun']); ?></td>
                <td class="text-center">
                    <?php if (!empty($row['gambar'])): ?>
                        <!-- Tombol Gambar -->
                        <a href="<?= htmlspecialchars($row['gambar']); ?>" target="_blank" class="btn btn-outline-dark">
                            <img src="<?= htmlspecialchars($row['gambar']); ?>" alt="Gambar" style="width: 50px; height: auto;">
                        </a>
                    <?php else: ?>
                        Tidak Ada
                    <?php endif; ?>
                </td>
                <td class="text-center">
                    <?php if (!empty($row['link'])): ?>
                        <a href="<?= htmlspecialchars($row['link']); ?>" target="_blank" class="btn btn-primary">Lihat Link</a>
                    <?php else: ?>
                        <span class="text-muted">Tidak Ada</span>
                    <?php endif; ?>
                </td>
            </tr>
            <?php 
                endwhile; 
            else: 
            ?>
            <tr>
                <td colspan="5" class="text-center">Tidak ada riwayat penyelesaian ditemukan.</td>
            </tr>
            <?php endif; ?>
        </tbody>
    </table>
</div>
