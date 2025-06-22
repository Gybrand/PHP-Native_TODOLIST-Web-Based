<?php 
include 'config.php'; // Menggunakan config.php untuk koneksi database

// Ambil semua nipp dan nama dari tabel userdata
$queryNipp = "SELECT DISTINCT nipp, nama FROM userdata";
$resultNipp = $conn->query($queryNipp);

// Membuka row container Bootstrap
echo '<div class="container-fluid">';
echo '<div class="row justify-content-start gx-0">'; // gx-0 menghapus gap antar kolom

// Untuk setiap nipp, buat chart
while ($rowNipp = $resultNipp->fetch_assoc()) {
    $nipp = $rowNipp['nipp'];
    $nama = $rowNipp['nama']; // Ambil nama berdasarkan nipp
    
    // Query untuk mendapatkan data jumlah pekerjaan berdasarkan status
    $query = "
        SELECT 
            status, 
            COUNT(*) AS jumlah 
        FROM pekerjaan 
        WHERE nipp = ? 
        GROUP BY status
    ";

    $stmt = $conn->prepare($query);
    $stmt->bind_param("s", $nipp);
    $stmt->execute();
    $result = $stmt->get_result();

    // Memproses data untuk Chart.js
    $data = [
        "done" => 0,
        "on progress" => 0,
        "belum dimulai" => 0,
        "pending" => 0
    ];

    while ($row = $result->fetch_assoc()) {
        $status = strtolower($row['status']); // Pastikan lowercase untuk key
        if (array_key_exists($status, $data)) {
            $data[$status] = $row['jumlah'];
        }
    }

    $stmt->close();
    ?>
    <!-- Chart dalam kolom -->
    <div class="col-md-6 col-lg-3 mb-2 px-1"> <!-- Mengurangi margin bawah dan padding -->
        <div class="border p-3">
            <h5 class="text-center mb-3"><?php echo htmlspecialchars($nama); ?></h5> <!-- Menampilkan nama pengguna -->
            <div style="width: 100%; margin: auto;">
                <canvas id="doughnutChart<?php echo $nipp; ?>"></canvas>
            </div>
        </div>
    </div>

    <script>
        // Data untuk Chart.js
        const data<?php echo $nipp; ?> = {
            labels: ['Done', 'On Progress', 'Belum Mulai', 'Pending'],
            datasets: [{
                data: [
                    <?php echo $data['done']; ?>,
                    <?php echo $data['on progress']; ?>,
                    <?php echo $data['belum dimulai']; ?>,
                    <?php echo $data['pending']; ?>
                ],
                backgroundColor: [
                    'rgba(75, 192, 192, 0.6)', // Hijau untuk Done
                    'rgba(255, 206, 86, 0.6)', // Kuning untuk On Progress
                    'rgba(255, 99, 132, 0.6)', // Merah untuk Belum Mulai
                    'rgba(54, 162, 235, 0.6)'  // Biru untuk Pending
                ],
                borderColor: [
                    'rgba(75, 192, 192, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(255, 99, 132, 1)',
                    'rgba(54, 162, 235, 1)'
                ],
                borderWidth: 1
            }]
        };

        // Konfigurasi Chart.js
        const config<?php echo $nipp; ?> = {
            type: 'pie',
            data: data<?php echo $nipp; ?>,
            options: {
                responsive: true,
                plugins: {
                    legend: {
                        position: 'top',
                    }
                }
            }
        };

        // Render Doughnut Chart untuk masing-masing NIPP
        const ctx<?php echo $nipp; ?> = document.getElementById('doughnutChart<?php echo $nipp; ?>').getContext('2d');
        new Chart(ctx<?php echo $nipp; ?>, config<?php echo $nipp; ?>);
    </script>
    <?php
}

// Menutup row container Bootstrap
echo '</div>'; // Tutup row
echo '</div>'; // Tutup container
?>
