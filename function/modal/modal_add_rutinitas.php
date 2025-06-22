<?php
// Mengambil nilai 'nipp' dari parameter GET
$nipp = isset($_GET['nipp']) ? htmlspecialchars($_GET['nipp']) : '';

// Pastikan 'nipp' diteruskan ke form
?>

<!-- Modal Input Rutinitas -->
<div class="modal fade" id="inputRutinitasModal" tabindex="-1" aria-labelledby="inputRutinitasModalLabel"
    aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="inputRutinitasModalLabel">Tambah Rutinitas
                    <?php echo htmlspecialchars($nipp); ?></h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <!-- Form di dalam modal -->
                <form action="function/add/add_rutin.php" method="post">
                    <div class="mb-3">
                        <label for="nama_tugas" class="form-label">Nama Tugas:</label>
                        <input type="text" id="nama_tugas" name="nama_tugas" class="form-control" required>
                    </div>

                    <div class="mb-3">
                        <label for="hari" class="form-label">Hari:</label>
                        <input type="number" id="hari" name="hari" min="1" max="31" class="form-control" required>
                    </div>

                    <div class="mb-3">
                        <label for="bulan" class="form-label">Bulan:</label>
                        <input type="number" id="bulan" name="bulan" min="1" max="12" class="form-control" required>
                    </div>

                    <div class="mb-3">
                        <label for="tahun" class="form-label">Tahun:</label>
                        <input type="number" id="tahun" name="tahun" class="form-control" required>
                    </div>

                    <div class="mb-3">
                        <label for="periode" class="form-label">Periode Tugas:</label>
                        <select id="periode" name="periode" class="form-select" required>
                            <option value="1">Setiap Bulan Sekali</option>
                            <option value="3">Setiap 3 Bulan Sekali</option>
                            <option value="6">Setiap 6 Bulan Sekali</option>
                            <option value="12">Setiap Setahun Sekali</option>
                        </select>
                    </div>


                    <div class="modal-footer">
                        <button type="submit" name="submit" class="btn btn-primary">Input Rutinitas</button>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Batal</button>
                    </div>

                    <!-- Menambahkan input hidden untuk nipp -->
                    <input type="hidden" name="nipp" value="<?php echo $nipp; ?>" />
                </form>

            </div>
        </div>
    </div>
</div>

<script>
// Pastikan ketika modal dibuka, input hidden 'nipp' terisi
document.getElementById('inputRutinitasModal').addEventListener('show.bs.modal', function(event) {
    var nipp = "<?php echo $nipp; ?>"; // Mengambil nipp dari URL
    document.getElementById('nippField').value = nipp; // Set ke dalam field hidden
});
</script>