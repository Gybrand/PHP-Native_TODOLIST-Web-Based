<?php
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require 'vendor/autoload.php';

function kirimEmailDeadlineHariIni($dataTugas) {
    if (empty($dataTugas)) return false;

    $mail = new PHPMailer(true);
    try {
        // Konfigurasi SMTP Gmail
        $mail->isSMTP();
        $mail->Host       = 'smtp.gmail.com';
        $mail->SMTPAuth   = true;

        // Ganti dengan email dan App Password kamu
        $mail->Username   = 'etemporary888@gmail.com'; 
        $mail->Password   = '1ddad12123123123'; // App Password

        $mail->SMTPSecure = 'tls';
        $mail->Port       = 587;

        // Email pengirim dan penerima
        $mail->setFrom('etemporary888@gmail.com', 'Notifikasi Tugas');
        $mail->addAddress('xxx@gmail.com', 'NAMA');

        // Subject & Body
        $mail->isHTML(true);
        $mail->Subject = 'Notifikasi: Tugas Deadline Hari Ini - ' . date('d-m-Y');

        $body = "<p>Berikut adalah tugas dengan deadline <strong>hari ini (" . date('d-m-Y') . ")</strong>:</p><ul>";
        foreach ($dataTugas as $tugas) {
            $nama = htmlspecialchars($tugas['nama']);
            $deskripsi = htmlspecialchars($tugas['deskripsi']);
            $status = htmlspecialchars($tugas['status']);
            $body .= "<li><strong>{$nama}</strong>: {$deskripsi} (Status: {$status})</li>";
        }
        $body .= "</ul><p>Harap segera ditindaklanjuti.</p>";

        $mail->Body = $body;

        $mail->send();
        return true; // ✅ berhasil
    } catch (Exception $e) {
        error_log("❌ Gagal kirim email. Error: {$mail->ErrorInfo}");
        return false;
    }
}
