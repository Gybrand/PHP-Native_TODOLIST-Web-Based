<?php
include 'rutin_done.php';
include 'function/modal/modal_add_rutinitas.php';

// Mendapatkan bulan dan tahun saat ini
$current_month = date('m');  // Bulan saat ini
$current_year = date('Y');   // Tahun saat ini

?>
<div class="container-fluid mt-5">
<div class="d-flex justify-content-between align-items-center">
<span class="badge rounded-pill text-bg-dark mb-3 fw-bold text fs-5" style="height: 2.3rem;">Daftar Rutinitas Belum Selesai</span>
</div>

    <!-- Tabel Rutinitas -->
    <table class="table table-bordered table-striped">
        <thead>
            <tr>
                <th class="text-center">No</th>
                <th class="text-center">Nama</th>
                <th class="text-center">Deadline</th> <!-- Kolom Deadline dipindahkan ke kiri -->
                <th class="text-center">Tugas</th>
            </tr>
        </thead>
        <tbody>
            <?php 
                // Counter untuk nomor urut
                $no = 1;

                // Query rutinitas dengan filter bulan dan tahun (hanya untuk bulan ini dan bulan sebelumnya)
                $query = "SELECT rutin.*, userdata.nama FROM rutin
                          JOIN userdata ON rutin.nipp = userdata.nipp
                          WHERE (rutin.tahun < ? OR (rutin.tahun = ? AND rutin.bulan <= ?))
                          ORDER BY rutin.tahun DESC, rutin.bulan DESC";
                $stmt = $conn->prepare($query);
                $stmt->bind_param("sss", $current_year, $current_year, $current_month);  // Menggunakan tahun dan bulan saat ini
                $stmt->execute();
                $result = $stmt->get_result();

                // Array bulan untuk konversi angka bulan menjadi nama bulan
                $bulan_array = [
                    1 => 'Januari', 2 => 'Februari', 3 => 'Maret', 4 => 'April', 5 => 'Mei', 6 => 'Juni',
                    7 => 'Juli', 8 => 'Agustus', 9 => 'September', 10 => 'Oktober', 11 => 'November', 12 => 'Desember'
                ];

                if ($result && $result->num_rows > 0): 
                    while ($row = $result->fetch_assoc()): 
                        $bulan_nama = $bulan_array[$row['bulan']]; // Mendapatkan nama bulan
            ?>
            <tr>
                <td class="text-center"><?= $no++; ?></td>
                <td class="text-center"><?= htmlspecialchars($row['nama']); ?></td> <!-- Nama pemilik -->
                <td class="text-center"><?= htmlspecialchars($row['hari']) . ' ' . $bulan_nama . ' ' . htmlspecialchars($row['tahun']); ?></td> <!-- Deadline -->
                <td class="text-center"><?= htmlspecialchars($row['nama_tugas']); ?></td> <!-- Tugas -->
            </tr>
            <?php 
                    endwhile; 
                else: 
                ?>
            <tr>
                <td colspan="4" class="text-center">Tidak ada rutinitas ditemukan.</td>
            </tr>
            <?php endif; ?>
        </tbody>
    </table>
</div>
