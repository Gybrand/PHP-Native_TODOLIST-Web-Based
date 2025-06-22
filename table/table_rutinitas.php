<?php
include 'rutin_done.php';
include 'function/modal/modal_add_rutinitas.php';

// Mendapatkan bulan dan tahun saat ini
$current_month = date('m');  // Bulan saat ini
$current_year = date('Y');   // Tahun saat ini
?>
<div class="container-fluid mt-5">
    <div class="d-flex justify-content-between align-items-center">
        <span class="badge rounded-pill text-bg-dark mb-3 fw-bold text fs-5" style="height: 2.3rem;">Rutinitas</span>
        <!-- Tombol untuk membuka Modal -->
        <form method="post">
            <button type="button" class="btn btn-outline-dark" data-bs-toggle="modal"
                data-bs-target="#inputRutinitasModal">
                Tambah Rutinitas
            </button>
        </form>
    </div>

    <!-- Tabel Rutinitas -->
    <table class="table table-bordered table-striped">
        <thead>
            <tr>
                <th class="text-center">No</th>
                <th class="text-center">Nama Tugas</th>
                <th class="text-center">Tanggal</th>
                <th class="text-center">Periode</th>
                <th class="text-center">Aksi</th>
            </tr>
        </thead>
        <tbody>
            <?php 
                // Counter untuk nomor urut
                $no = 1;

                // Query rutinitas dengan filter bulan dan tahun lebih kecil atau sama dengan bulan dan tahun saat ini
                $nipp = isset($_GET['nipp']) ? $_GET['nipp'] : '';
                $query = "SELECT * FROM rutin WHERE nipp = ? AND (tahun < ? OR (tahun = ? AND bulan <= ?)) ORDER BY tahun DESC, bulan DESC";
                $stmt = $conn->prepare($query);
                $stmt->bind_param("ssss", $nipp, $current_year, $current_year, $current_month);  // Menggunakan NIPP, tahun, dan bulan saat ini
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
                <td class="text-center"><?= htmlspecialchars($row['nama_tugas']); ?></td>
                <td class="text-center"><?= htmlspecialchars($row['hari']) . ' ' . $bulan_nama . ' ' . htmlspecialchars($row['tahun']); ?>
                </td>
                <td class="text-center"><?= htmlspecialchars($row['periode']); ?> Bulan Sekali</td> <!-- Menampilkan periode tugas -->
                <td>
                    <!-- Tombol Done -->
                    <button type="button" class="btn btn-success btn-sm" data-bs-toggle="modal"
                        data-bs-target="#doneModal<?= $row['id']; ?>">
                        Done
                    </button>

                    <!-- Modal -->
                    <div class="modal fade" id="doneModal<?= $row['id']; ?>" tabindex="-1"
                        aria-labelledby="doneModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <form method="post" enctype="multipart/form-data" action="rutin_done.php">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="doneModalLabel">Selesaikan Rutinitas</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                            aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <input type="hidden" name="id" value="<?= $row['id']; ?>">
                                        <input type="hidden" name="nipp" value="<?= $row['nipp']; ?>">

                                        <div class="mb-3">
                                            <label for="gambar" class="form-label">Unggah Gambar</label>
                                            <input type="file" class="form-control" id="gambar" name="gambar"
                                                accept="image/*" required>
                                        </div>
                                        <div class="mb-3">
                                            <label for="link" class="form-label">Link</label>
                                            <input type="url" class="form-control" id="link" name="link"
                                                placeholder="Masukkan link" required>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary"
                                            data-bs-dismiss="modal">Batal</button>
                                        <button type="submit" name="submit_done"
                                            class="btn btn-success">Selesaikan</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>

                </td>
            </tr>
            <?php 
                    endwhile; 
                else: 
                ?>
            <tr>
                <td colspan="7" class="text-center">Tidak ada rutinitas ditemukan untuk bulan ini.</td>
            </tr>
            <?php endif; ?>
        </tbody>
    </table>
</div>