<?php 

// Retrieve 'nipp' from GET parameter securely
$nipp = isset($_GET['nipp']) ? htmlspecialchars($_GET['nipp']) : null;

if ($nipp) {
    $query = "SELECT * FROM pekerjaan WHERE nipp = ?";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("s", $nipp); // Bind the nipp parameter to prevent SQL injection
    $stmt->execute();
    $result = $stmt->get_result();
}
?>

<?php
// Ambil nilai maksimum 'No' berdasarkan 'NIPP'
$queryMaxNo = "SELECT MAX(no) AS max_no FROM pekerjaan WHERE nipp = ?";
$stmtMaxNo = $conn->prepare($queryMaxNo);
$stmtMaxNo->bind_param("s", $nipp); // Gantikan $nipp dengan nilai NIPP yang sesuai
$stmtMaxNo->execute();
$resultMaxNo = $stmtMaxNo->get_result();
$rowMaxNo = $resultMaxNo->fetch_assoc();

// Jika terdapat hasil, tambahkan 1 pada nilai maksimum, jika tidak, mulai dari 1
$nextNo = $rowMaxNo['max_no'] ? $rowMaxNo['max_no'] + 1 : 1;
?>


<!-- Modal -->
<div class="modal fade" id="addPekerjaanModal" tabindex="-1" aria-labelledby="addPekerjaanModalLabel"
    aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addPekerjaanModalLabel">Tambah Pekerjaan
                    <?php echo $nipp ? htmlspecialchars($nipp) : ''; ?></h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <!-- Form inside modal -->
                <form action="function/add/add_pekerjaan.php" method="post" class="row g-3">
                    <div class="col-md-6">
                        <label for="noField" class="form-label">No</label>
                        <input type="number" value="<?= $nextNo; ?>" id="noField" name="no" class="form-control"
                            placeholder="Masukkan nomor" required>
                    </div>

                    <div class="col-md-6">
                        <label for="subNomorField" class="form-label">Sub Nomor</label>
                        <input type="text" id="subNomorField" name="sub_nomor" class="form-control"
                            placeholder="Masukkan sub nomor">
                    </div>
                    <div class="col-md-12">
                        <label for="deskripsiField" class="form-label">Deskripsi</label>
                        <textarea id="deskripsiField" name="deskripsi" class="form-control" rows="4"
                            placeholder="Masukkan deskripsi"></textarea>
                    </div>
                    
                    <div class="col-md-6">
                        <label for="deadlineField" class="form-label">Deadline</label>
                        <input type="date" id="deadlineField" name="deadline" class="form-control">
                    </div>

                    <div class="col-md-6">
                        <label for="statusField" class="form-label">Status</label>
                        <select id="statusField" name="status" class="form-select">
                            <option value="On Progress">On Progress</option>
                            <option value="Pending">Pending</option>
                            <option value="Belum Dimulai">Belum Dimulai</option>
                        </select>
                    </div>
                    <div class="col-md-12">
                        <label for="catatanField" class="form-label">Catatan</label>
                        <textarea id="catatanField" name="catatan" class="form-control" rows="3"
                            placeholder="Masukkan Catatan"></textarea>
                    </div>
                    <div class="col-md-12">
                        <label for="outputField" class="form-label">Output</label>
                        <textarea id="outputField" name="output" class="form-control" rows="3"
                            placeholder="Masukkan Output Pekerjaan"></textarea>
                    </div>
                    <div id="dynamicLinkGroup">
                        <div class="row g-3">
                            <div class="col-md-6">
                                <label for="linkField" class="form-label">Link KK</label>
                                <input type="url" name="link_kk[]" class="form-control"
                                    placeholder="Masukkan link (opsional)">
                            </div>
                            <div class="col-md-6">
                                <label for="buttonNameField" class="form-label">Nama Tombol</label>
                                <input type="text" name="nama_tombol[]" class="form-control"
                                    placeholder="Masukkan nama tombol">
                            </div>
                        </div>
                    </div>
                    <button type="button" id="addLinkButton" class="btn btn-secondary mt-2">Tambah Link</button>

                    <!-- Hidden input to pass NIPP -->
                    <input type="hidden" name="nipp" id="nippField">
                    <div class="col-12 text-end">
                        <button type="submit" name="submit" class="btn btn-primary">Tambah</button>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Batal</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


<script>
document.getElementById('addPekerjaanModal').addEventListener('show.bs.modal', function(event) {
    var nipp = "<?php echo $nipp ? htmlspecialchars($nipp) : ''; ?>"; // Safely retrieve nipp from PHP
    document.getElementById('nippField').value = nipp; // Set value in hidden field
});
</script>



<script>
document.getElementById('addLinkButton').addEventListener('click', function() {
    const group = document.createElement('div');
    group.classList.add('row', 'g-3', 'mt-2');
    group.innerHTML = `
            <div class="col-md-6">
                <input type="url" name="link_kk[]" class="form-control" placeholder="Masukkan link (opsional)">
            </div>
            <div class="col-md-6">
                <input type="text" name="nama_tombol[]" class="form-control" placeholder="Masukkan nama tombol">
            </div>
        `;
    document.getElementById('dynamicLinkGroup').appendChild(group);
});
</script>