-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 09, 2025 at 01:52 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kerjaanasettetap`
--

-- --------------------------------------------------------

--
-- Table structure for table `kerjaan_baru`
--

CREATE TABLE `kerjaan_baru` (
  `id` int(11) NOT NULL,
  `nama_kerjaan` text NOT NULL,
  `deadline` text NOT NULL,
  `nipp` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pekerjaan`
--

CREATE TABLE `pekerjaan` (
  `no` int(11) NOT NULL,
  `sub_nomor` varchar(50) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `deadline` date DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `catatan` text DEFAULT NULL,
  `output` text DEFAULT NULL,
  `link_kk` text DEFAULT NULL,
  `nipp` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pekerjaan`
--

INSERT INTO `pekerjaan` (`no`, `sub_nomor`, `deskripsi`, `deadline`, `status`, `catatan`, `output`, `link_kk`, `nipp`) VALUES
(1, '', 'Settlement Aset KK AUC Berumur Lama', NULL, 'Done', NULL, 'SES update per tgl 24 april 2024', NULL, '0394053606'),
(1, '', 'Nota Dinas Pengajuan Diklat PSAK aset tetap 21 Feb 2024', NULL, 'Done', NULL, '', NULL, '19971201720'),
(1, '', 'Selisih DAT vs Neraca', NULL, 'On Progress', NULL, 'KK done, Monitoring ke Aset Tetap HO', NULL, '19991202752'),
(1, 'a', 'Breakdown GR/IR > 2022', NULL, 'On Progress', NULL, 'sudah dilakukan identifikasi, akan dilakukan koordinasi dengan tim akuntansi untuk eksekusi jurnal', NULL, '19991202752'),
(1, 'e', 'Reklasifikasi pencatatan interior pelindo place', NULL, 'Done', NULL, 'Menunggu konfirmasi KAP', NULL, '19991202752'),
(1, 'f', 'Balik Jurnal CAJE', NULL, 'Done', NULL, 'KK done, Monitoring ke Aset Tetap HO', NULL, '19991202752'),
(2, '', 'Settlement Aset KK Investasi', NULL, 'Done', NULL, 'SES update per tgl 24 april 2024', NULL, '0394053606'),
(2, '', 'Nota Dinas ke Pak Hendiek terkait Inventarisasi Aset IT yang akan direlokasi dari CC Regional 3 ke CC HO', NULL, 'Done', NULL, '', NULL, '19971201720'),
(2, '', 'Penyesuaian Aset Konsesi Jasa di Teluk Lamong Base On BA dengan KSOP dan Internal Pelindo dan all aset konsesi/KSP di Labuan Bajo/Bima/Badas/Waingapu', NULL, 'On Progress', NULL, 'Kurang peyesuaian aset class TTL dan Badas', NULL, '19991202752'),
(3, '', 'Inventarisasi Alat Faspel dan Kapal untuk RKM Inventarisasi dan Inbreng', NULL, 'Done', NULL, 'KK INBRENG FIX\r\nKK INBRENG PENJELASAN CANCEL', NULL, '0394053606'),
(3, '', 'BA Rapat tgl 05/02/24 terkait Pelaksanaan Penghapusbukuan Aset Tetap di Wilayah Sub Regional Bali Nusra PT Pelabuhan Indonesia (Persero) Regional 3 periode Tahun 2024', NULL, 'Done', NULL, '', NULL, '19971201720'),
(3, '', 'Penyesuaian Aset Class Gilimas (Pembelian tanah/lahan dan pematangan lahan)', NULL, 'Pending', NULL, 'Menunggu sertifikasi lahan Gilimas Tahap 2 (bulan Agustus 2024)', NULL, '19991202752'),
(4, '', 'Perbaikan data Aset', NULL, 'Done', NULL, 'Done, tinggal nunggu konfirmasi data dari subreg', NULL, '0394053606'),
(4, '', 'BA Pembatalan Penghapusbukuan secara Penjualan/Pelelangan (approver Subreg, Regional3, menyetujui Pak RH)', NULL, 'Done', NULL, 'Konfirmasi apakah cukup BA atau Merevisi Surat Ketetapan RH karena pagar BRC masuk metode penjualan/pelelangan', NULL, '19971201720'),
(4, '', 'Monitoring penyelesaian Perbaikan Data Aset Part 1, Part 2, Part 3 yang dilakukan oleh HO', NULL, 'Done', NULL, '- Retirement penghapusan aset lama\r\n- Reklasifikasi Aset Konsesi dan KSP', NULL, '19991202752'),
(4, 'a', 'KK Perbaikan data Aset dari subreg ke HO', NULL, 'Done', NULL, 'Done, sudah otomatis update jika KK subreg update', NULL, '0394053606'),
(4, 'b', 'Monitoring atas perbaikan data aset yang telah dikirimkan ke HO', NULL, 'Done', NULL, 'nunggu download DAT bulan mei 2024', NULL, '0394053606'),
(5, '', 'Dasbor penyelesaian pekerjaan Aset tetap Regional 3 ', NULL, 'Done', NULL, '100%', NULL, '0394053606'),
(5, '', 'ND Pelaksanaan ke Subreg terkait Hapus Administrasi', NULL, 'Done', NULL, '', NULL, '19971201720'),
(5, '', 'Monitoring retirement aset atas penghapusan 2017-2023', NULL, 'Done', NULL, 'KK done, Monitoring ke Aset Tetap HO', NULL, '19991202752'),
(6, '', 'Kertas Kerja Usulan Penghapusan Barang Inventaris, Barang Bekas, Sisa Material Konstruksi Tahun 2024 (Subreg dan Regional)', NULL, 'Done', NULL, 'nunggu konfirmasi dengan subreg', NULL, '0394053606'),
(6, '', 'Followup Jaskon KJPP GEAR &amp; ITS Tekno', NULL, 'Done', NULL, '', NULL, '19971201720'),
(6, '', 'Penyelesaian Klarifikasi ND AUC Berumur Lama', NULL, 'Done', NULL, 'Penyusunan BA', NULL, '19991202752'),
(7, '', 'Verifikasi aset BASO all subholding', NULL, 'Done', NULL, '', NULL, '0394053606'),
(7, '', 'Undangan Rapat dengan Divisi Komersial', NULL, 'Done', NULL, '', NULL, '19971201720'),
(7, '', 'Penyelesaian Selisih antara DAT (FA Register) dengan TB SAP atas GRIR, CAJE, dll', NULL, 'Done', NULL, 'Selisih HP Goodwill, AUC BMTH', NULL, '19991202752'),
(7, 'a', 'Inventarisasi Pembebanan Biaya yang double dilakukan tahun 2022 dan 2023 + Buat Jurnal Penyesuaiannya', NULL, 'Done', NULL, '', NULL, '19991202752'),
(7, 'b', 'Perbaikan Aset Class Properti Investasi - Jalan dan Bangunan atas Pelindo Place', NULL, 'Done', NULL, '', NULL, '19991202752'),
(7, 'c', 'Perbaikan double catat aset pelindo place sebesar 30M', NULL, 'Done', NULL, 'Konsul ke mba Diana,', NULL, '19991202752'),
(8, '', 'Penyusunan Panduan Teknis terkait RKM Inventaris Aset (Aplikasi SIAP)', NULL, 'Done', NULL, 'KK done, nunggu pengisian dari subreg', NULL, '0394053606'),
(8, '', 'Pengisian risk monitoring di PRIMA tahun 2024', NULL, 'Done', NULL, 'Koordinasi dengan Laila terkait reset RCSA monitoring', NULL, '19971201720'),
(8, '', 'KK Perbandingan Progress Investasi vs Nilai AUC Khusus Pekerjaan Pengerukan &amp; Identifikasi Jurnal Manual', NULL, 'Done', NULL, '', NULL, '19991202752'),
(9, '', 'Surat Keluar ke PT Airindo terkait Wheel Loader JCB 436ZX', NULL, 'Done', NULL, 'Koordinasi dengan Afri terkait PIC dari Askrindo yg dimasukan ke surat keluar pelindo', NULL, '19971201720'),
(9, '', 'KK Konfirmasi Penghapusbukuan 2017-2023', NULL, 'Done', NULL, '- Kalimantan Telah Mengirimkan Notadinas\r\n- Jawa Telah mengirimkan Notadinas', NULL, '19991202752'),
(9, 'a', 'Konfirmasi Ke Dept.Aset Tetap HO terkait Aset yang belum masuk pada aplikasi SIAP', NULL, 'Done', NULL, '', NULL, '0394053606'),
(10, '', 'Kertas Kerja Perbaikan Aset Part 2 (Perbaikan tanggal, perbaikan aset Class, dll)', NULL, 'Done', NULL, 'KK sudah done', NULL, '0394053606'),
(10, '', 'ND ke All Subreg terkait Konfirmasi Aset Inbreng', NULL, 'Done', NULL, 'KK di Maul', NULL, '19971201720'),
(10, '', 'Breakdown aset konjas kemenhub (TTL, APBS, Bajo, Badas, Bima)', NULL, 'Done', NULL, 'KK done, Monitoring ke Aset Tetap HO', NULL, '19991202752'),
(11, '', 'Verifikasi Kertas Kerja Rumah dinas VS DAT Rumah Dinas', NULL, 'Done', NULL, '', NULL, '0394053606'),
(11, '', 'Entry data perencanaan umum pengadaan di P-Eproc', NULL, 'Done', NULL, 'Koordinasi PBJ terkait pekiraan PDN dan Dept Aset Tetap', NULL, '19971201720'),
(11, '', 'Grouping / ungrouping Aset keperluan penghapusan dan perbaikan data aset', NULL, 'Done', NULL, 'belum terproses karena nilai buku tidak ikut pada saat nilai transfer', NULL, '19991202752'),
(12, '', 'Serah Terima Sertifikat ', NULL, 'Done', NULL, '', NULL, '0394053606'),
(12, '', 'ND jawaban ke DH komersial terkait ganti rugi lahan TPS', NULL, 'Done', NULL, '', NULL, '19971201720'),
(12, '', 'KK Ke HO untuk menghidupkan Aset telah dihapuskan tetapi tidak mempunyai nomor aset SAP (No. Aset SIUK)', NULL, 'Done', NULL, '', NULL, '19991202752'),
(13, '', 'KK Pembiayaan atas AUC', NULL, 'Done', NULL, '', NULL, '0394053606'),
(13, '', 'ND permintaan fasilitas laptop utk staf baru di aset', NULL, 'Done', NULL, '', NULL, '19971201720'),
(13, '', 'Pembebanan Biaya atas AUC yang tidak dapat menjadi Aset', NULL, 'Done', NULL, '', NULL, '19991202752'),
(14, '', 'Kertas kerja Settlement AUC ke Aset Part 12 (terbaru)', NULL, 'Done', NULL, '', NULL, '0394053606'),
(14, '', 'Undangan final draft ke ITS Tekno &amp; PPI, properti subreg, reg3', NULL, 'Done', NULL, '', NULL, '19971201720'),
(14, '', 'Kertas Kerja Usulan Penghapusan Aset 2023-2024 (Subreg dan Regional) + ND ke HO', NULL, 'Done', NULL, '1. Kalimantan Telah Mengirimkan Usulan Penghapusan 2024\r\n2.Jawa Telah Mengirimkan Usulan Penghapusan 2023 dan 2024', NULL, '19991202752'),
(15, '', 'Kertas kerja perbaikan data aset dari seluruh Sub Regional (untuk RKM 2025)', NULL, 'Belum Dimulai', NULL, 'gabung dari KK perbaikan data dari subreg', NULL, '0394053606'),
(15, '', 'BA Rapat koordinasi klaim per Januari 2024', NULL, 'Done', NULL, '', NULL, '19971201720'),
(15, '', 'Audit KAP 2023', NULL, 'Done', NULL, '', NULL, '19991202752'),
(15, 'a', 'Provisi Konsesi (Audit KAP)', NULL, 'Done', NULL, '', NULL, '19991202752'),
(15, 'b', 'AUC Transaksi afiliasi', NULL, 'Done', NULL, '', NULL, '19991202752'),
(16, '', 'Kertas Kerja Penyelesaian RKM inventarisasi Aset di Aplikasi SIAP', NULL, 'Done', NULL, '', NULL, '0394053606'),
(16, '', 'SP risk assessment asuransi + Surat keluar ke Subholding', NULL, 'Done', NULL, 'SP dari HO &amp; sudah setor nama ke mba irma', NULL, '19971201720'),
(16, '', 'Breakdown Aset Konsesi TTL sesuai Baso Pelindo - SPTP - TTL ', NULL, 'Done', NULL, 'Koordinasi dengan komersial R3 dan TTL terkait KK verifikasi Aset', NULL, '19991202752'),
(17, '', 'Pencatatan Aset Ruko di Tanjung Emas Semarang', '2024-09-13', 'Done', NULL, 'KK pencatatan aset sinohydro', NULL, '0394053606'),
(17, '', 'ND Pencatatan Aset Mooring Buoy Lembar', NULL, 'Done', NULL, '', NULL, '19971201720'),
(17, '', 'Settlement AUC Khusus TTL', NULL, 'Done', NULL, '', NULL, '19991202752'),
(18, '', 'Kertas Kerja Mapping AUC dengan Kertas Kerja Progress Fisik Investasi Per Bulan', NULL, 'Done', NULL, '', NULL, '0394053606'),
(18, '', 'ND ke Pak Hendiek Penyesuaian aplikasi my invent utk pencatatan barang bekas &amp; sisa material konstruksi', NULL, 'Done', NULL, '', NULL, '19971201720'),
(18, '', 'Breakdown Aset KSP Bajo', NULL, 'Done', NULL, 'bandingkan antara nilai pekerjaan dan nilai aset apakah sudah sesuai apa belum', NULL, '19991202752'),
(19, '', 'Pencatatan Aset SBNP di APBS', '2024-09-13', 'Done', NULL, 'Mbak Diana tinggal naikkan jadi aset, dengan sisa umur ekonomis 0', NULL, '0394053606'),
(19, '', 'Laporan risk assesment tahun 2023 ke HO', NULL, 'Done', NULL, '', NULL, '19971201720'),
(19, '', 'Pencatatan Aset mooring Buoy Lembar', NULL, 'Done', NULL, 'Sudah dikirim ke HO, Perlu Cek apakah sudah tersettle atau belum', NULL, '19991202752'),
(20, '', 'KK Breakdown penyusutan aset dan inbreng ke subholding', NULL, 'Done', NULL, '', NULL, '0394053606'),
(20, '', 'Undangan terkait Pembahasan Aset Konsesi dan Aset KSP ke Divhead Teknik &amp; Komersial', NULL, 'Done', NULL, 'Tgl 4 Maret 2024', NULL, '19971201720'),
(20, '', 'KK Aset Class Insatalasi dan Peralatan Yang Umur &lt; Tahun 2000 yang Nilai Bukunya dibawah Rp. 1000.000 untuk dikonfirmasi untuk hapus administrasi', NULL, 'Done', NULL, '', NULL, '19991202752'),
(21, '', 'Update KK Verifikasi aset SIAP berdasarkan pengisian terbaru', NULL, 'Done', NULL, 'update per 23/7/24', NULL, '0394053606'),
(21, '', 'Buat surat ke BM Tg Wangi terkait risk assessment di Tg Wangi', NULL, 'Done', NULL, 'Lampiran dari mba irma HO', NULL, '19971201720'),
(21, '', 'KK Usulan Penghapusbukuan Tahun 2023 &amp; 2024 Ke Group MNAT HO', NULL, 'Done', NULL, '', NULL, '19991202752'),
(22, '', 'Inventarisasi aset teluk lamong', NULL, 'Done', NULL, '', NULL, '0394053606'),
(22, '', 'ND ke GH Akuntansi HO terkait perbaikan data aset', NULL, 'Done', NULL, 'KK di mas tri', NULL, '19971201720'),
(22, '', 'KK Settlement ASET Labuan Bajo', NULL, 'Done', NULL, '', NULL, '19991202752'),
(23, '', 'KK Laporan hasil RKM inventarisasi Aset Ke GH Akuntansi HO', NULL, 'Done', NULL, '', NULL, '0394053606'),
(23, '', 'ND ke All SRH terkait perbaikan data aset', NULL, 'Done', NULL, 'KK di mas tri', NULL, '19971201720'),
(23, '', 'ND + KK Endorsement tambah / Kurang', NULL, 'Done', NULL, '', NULL, '19991202752'),
(24, '', 'KK Inventarisasi aset kantor reg3 (aset dep umum &amp; dep TI)', NULL, 'Done', NULL, '', NULL, '0394053606'),
(24, '', 'ND ke All SRH terkait konfirmasi penghapusan aset 2017 s.d 2023', NULL, 'Done', NULL, 'KK di Maul', NULL, '19971201720'),
(24, '', 'Perbaikan perubahan cost centre untuk penghapusan', NULL, 'Done', NULL, '', NULL, '19991202752'),
(25, '', 'KK SELISIH DAT VS TB DARI BOGOR', NULL, 'Done', NULL, '', NULL, '0394053606'),
(25, '', 'ND Pencatatan Aset Mooring Buoy Lembar', NULL, 'Done', NULL, 'menunggu arahan pak suroso', NULL, '19971201720'),
(25, '', 'Surat Undangan Konfirmasi Penghapusan Aset/Non Aset ke Sub Regional Jawa', NULL, 'Done', NULL, '', NULL, '19991202752'),
(26, '', 'Settlement Part 14', '2024-09-13', 'Done', NULL, '', NULL, '0394053606'),
(26, '', 'ND ke Subreg terkait usulan Penghapusan barang sisa material dan barang bekas', NULL, 'Done', NULL, 'memastikan template BA pemeriksaan fisik dan tdk ditemukan ke pic HO', NULL, '19971201720'),
(26, '', 'Penyelesaian selisih antara DAT vs TB SAP atas jurnal manual aset tetap HO', NULL, 'Done', NULL, 'KK done, Monitoring ke Aset Tetap HO', NULL, '19991202752'),
(27, '', 'Mapping aset tanah dan properti investasi tanah', '2024-10-04', 'On Progress', NULL, '', NULL, '0394053606'),
(27, '', 'ND Usulan Penghapusan barang sisa material dan barang bekas Ke Group MNAT HO', NULL, 'Done', NULL, 'menunggu usulan dari Subreg ', NULL, '19971201720'),
(27, '', 'Relokasi Aset IT dari R3 ke HO', NULL, 'Done', NULL, '1. Undangan ke SM IT untuk pembahasan detil aset IT yang akan di relokasi (done)\r\n2. BA Hasil identifikasi aset IT yang akan direlokasi (Done)\r\n3. ND ke Group Head Akuntansi tembusan ke GH IT untuk usulan relokasi aset IT(Submit PEO)', NULL, '19991202752'),
(28, '', 'Struktur Aplikasi Integrated Asset Management System', NULL, 'Done', NULL, '', NULL, '0394053606'),
(28, '', 'ND Laporan Hasil Penghapusbukuan Aset Tetap tahun 2024 ke Group MNAT HO', NULL, 'Done', NULL, 'menunggu BA hapus administrasi dari Balnus', NULL, '19971201720'),
(28, '', 'Monitoring Penyelesaian eksekusi Selisih DAT vs Neraca, BA Cleansing AUC Berumur lama dan KK Settlement Part 15, yang masih error', NULL, 'On Progress', NULL, 'KK part 14, KK Part 15, KK Reklas Aset TTL', NULL, '19991202752'),
(29, '', 'Eksekusi Grouping aset dengan nama aset berupa kata kerja (peninggian, overlay, perbaikan, dll) ke aset induknya', '2024-09-30', 'On Progress', '', '1. Kertas Kerja Finalisasi ke Seluruh Cabang', NULL, '0394053606'),
(29, '', 'ND Endorsement Penambahan aset Shore connection di Tanjung Emas', NULL, 'Done', NULL, '', NULL, '19971201720'),
(29, '', 'Rekap Pendapatan DLU dan Biaya DLU atas eksekusi GR/IR AUC Berumur lama, selisih DAT vs SAP', NULL, 'Done', NULL, '1. Cleansing AUC\r\n2. Perbaikan Selisih DAT vs Neraca\r\n3. GR/IR', NULL, '19991202752'),
(30, '', 'Perbaikan Nama Aset sesuai dengan lokasi ', '2024-09-30', 'On Progress', NULL, '1. Kertas Kerja Finalisasi ke Seluruh Cabang', NULL, '0394053606'),
(30, '', 'Surat Keluar Ke Fresnel atas TLO yang memerlukan penghapusbukuan sebelum dilakukan eksekusi / pengambilan dari Asuransi', NULL, 'Done', NULL, '', NULL, '19971201720'),
(30, '', 'Kertas Kerja Usulan Penghapusan Aset/Non Aset atas Salvage Asuransi', NULL, 'On Progress', NULL, '1. Nota Dinas ke SRH untuk pengisian data penghapusan aset salvage\r\n2. Kertas Kerja Penghapusan Aset Salvage\r\n3. ND ke GH MNAT usulan penghapusan aset salvage\r\n4. Agendakan Rapat dengan fresnel minggu ini untuk membahas detail aset salvage', NULL, '19991202752'),
(31, '', 'Field-field aplikasi SIAP', NULL, 'On Progress', NULL, '', NULL, '0394053606'),
(31, '', 'ND Undangan rapat ke PMS dan Departemen Peralatan Regional 3 terkait verifikasi aset inbreng dan usulan penghapusan kapal tahun 2024', NULL, 'Done', NULL, 'online zoom tgl 6 maret pukul 09.30', NULL, '19971201720'),
(31, '', 'Penghapusan Aset CCTV TPKS dan Forklift Patria Banjarmasin', NULL, 'Done', NULL, '1. SK ED 3 terkait nilai jual minimum\r\n2. ND ke SRH Jawa dan Kalimantan terkait eksekusi penghapusan aset\r\n3. ND ke GH MNAT terkait laporan penghapusan aset CCTV dan Forklift', NULL, '19991202752'),
(32, '', 'Monitoring transfer cost center biaya penyusutan aset IT ke HO (Dilaksanakan Januari 2025)', '2025-01-31', 'Belum Dimulai', NULL, 'Mulai monitoring tgl 1 januari 2025', NULL, '0394053606'),
(32, '', 'ND Usulan ke GH MNAT atas usulan penghapusan tahun 2023/2024', NULL, 'Done', NULL, '', NULL, '19971201720'),
(32, '', 'Pengasetan Aset BOT PT SMC', NULL, 'On Progress', NULL, '1. Nota Dinas ke Div Pengelolaan Keuangan dan Perpajakan terkait aspek perpajakan atas BOT Tersebut\r\n2. Undangan Rapat ke SRH Jawa untuk pembahasan awal dan cek fisik (done)\r\n3. ND ke GH Akuntansi terkait pencatatan aset BOT', NULL, '19991202752'),
(33, '', 'Penyusutan All Subholding (BASO + Inbreng)', '2024-10-23', 'Done', NULL, '', NULL, '0394053606'),
(33, '', 'ND Usulan Penghapusan aset Tetap tahun 2024 Khusus Aset Kantor Regional 3', NULL, 'Done', NULL, 'KK di Maul', NULL, '19971201720'),
(33, '', 'Penyesuaian Profit Center atas relokasi Aset Tanjung Intan ', NULL, 'Done', NULL, 'Menunggu BAST', NULL, '19991202752'),
(34, '', 'Pencatatan 2 aset tanjung Emas Ex Bank Jateng dan Ex PT Portek', NULL, 'Pending', '', 'yang akan di asetkan Ruko 18/III dan 16/IV, BAST sudah ada, nunggu revisi hasil KJPP yang masih salah, disebutkan hasil appraisal 18/III dan 16/II', NULL, '0394053606'),
(34, '', 'BA Rapat Reg 3 &amp; PMS terkait verifikasi Inbreng', NULL, 'Done', NULL, '', NULL, '19971201720'),
(34, '', 'Pengecekan hasil grouping aset', '2024-10-04', 'Done', NULL, '', NULL, '19991202752'),
(35, '', 'Review Kesesuaian AUC dengan Laporan Progress Teknik terkait SES', NULL, 'On Progress', NULL, '', NULL, '0394053606'),
(35, '', 'BA Rapat Koordinasi klaim per Februari 2024', NULL, 'Done', NULL, '', NULL, '19971201720'),
(35, '', 'Eksekusi Grouping aset dengan nama aset berupa kata kerja (peninggian, overlay, perbaikan, dll) ke aset induknya', '2024-10-07', 'Done', NULL, '1. Kertas Kerja Finalisasi ke Seluruh Cabang', NULL, '19991202752'),
(36, '', 'Review Aplikasi Aset Tetap Fikli dan Safana', NULL, 'On Progress', NULL, '', NULL, '0394053606'),
(36, '', 'ND KMAP ke Bu Juju ', NULL, 'Done', NULL, '', NULL, '19971201720'),
(36, '', 'Perbaikan Nama Aset sesuai dengan lokasi ', '2024-09-30', 'Done', NULL, '1. Kertas Kerja Finalisasi ke Seluruh Cabang', NULL, '19991202752'),
(37, '', 'PPT Penghapusan Inventaris ', NULL, 'Done', NULL, '', NULL, '0394053606'),
(37, '', 'Penyelesaian draft surat pesanan &amp; Syarat ketentuan Kjpp Gear', NULL, 'Done', NULL, '', NULL, '19971201720'),
(37, '', 'Verifikasi aset BASO all subholding', '2024-10-14', 'Done', NULL, '1. KK verifikasi nilai aset yg terbaru di list aset BASO\r\n2. KK verifikasi kesesuaian cost center antara CC eksisting vs CC berdasarkan BASO\r\n3. Nota Dinas ke Div Head Komersial tembusan ED\r\n\r\nhasil identifikasi ada :\r\n1. diperjanjian baso ada AUC\r\n2. diperjanjian baso ada aset yang sudah terhapus\r\n3. diperjanjian baso ada aset cost center yang tidak sesuai\r\n4. terdapat penambahan aset baru yang tidak terdapat di BASO\r\n5. diperjanjian BASO nilai perolehan tidak update', NULL, '19991202752'),
(38, '', 'Pembuatan Task list &amp; project charter RKM Aset 2024', NULL, 'Done', NULL, 'tasklist &amp; project charter sudah terupload di apk P-Rkm', NULL, '19971201720'),
(38, '', 'Kertas kerja BOQ Asuransi', NULL, 'Done', NULL, 'KK perbaikan aset yang diasuransikan dibandingan dengan KK RKAP asuransi (aset inbreng)', NULL, '19991202752'),
(39, '', 'ND ke SRH Jawa dan Kalimantan terkait pengisian mapping aset class PI Tanah dan Tanah', '2024-11-15', 'Done', NULL, 'Deadline tgl 15 Nov 2024', NULL, '0394053606'),
(39, '', 'ND Pengajuan settlement aset ke HO Part 9', NULL, 'Done', NULL, 'KK di maul', NULL, '19971201720'),
(39, '', 'Aset Tersedia dijual', '2024-09-30', 'On Progress', NULL, 'Nodin ke Cabang konfirmasi penghapusan aset rumah dinas dll\r\n (Done)\r\nKK Justifikasi aset tersedia utk dijual (propose jurnal) (Done)\r\nMonitoring Perubahan Pencatatan di SAP dan DAT', NULL, '19991202752'),
(40, '', 'BA hasil pemetaan tanah dan PI - tanah subreg Bali Nusra', NULL, 'Belum Dimulai', NULL, '', NULL, '0394053606'),
(40, '', 'ND ke TTL terkait kelanjutan ND dari Teknik atas kerusakan unit CTT 108 dan 116 yg dioperasikan di TTL', NULL, 'Done', NULL, 'dasar surat dari Div Teknik', NULL, '19971201720'),
(40, '', 'Kertas Kerja Ungrouping Aset Pipa LNG Benoa', NULL, 'Pending', NULL, '1. Ungrouping Aset Jalur Pipa Dermaga Selatan ke AP 2 dan Jalur AP2 ke PLTG Pesanggaran\r\n2.ND Ungrouping ke HO\r\n3. BA Rapat', NULL, '19991202752'),
(41, '', 'KK klarifikasi kategori penghapusan non aset all subreg', '2024-11-23', 'On Progress', '', '', NULL, '0394053606'),
(41, '', 'ND Ke HO Perbaikan Pencatatan Aset Part II', NULL, 'Done', NULL, 'KK di maul &amp; tri', NULL, '19971201720'),
(41, '', 'Kertas Kerja Ungrouping Aset Pelindo Place', NULL, 'On Progress', NULL, '1. Properti Investasi (done)\r\n2. Ungrouping Aset Interior SPTP (done)\r\n3. Ungrouping Aset Interior  (done)\r\n4. Nota Dinas Ungrouping ke GH Akuntansi (done)\r\n5. ND Persetujuan Prinsip dan usulan penghapusan Non Reguler atas aset interior\r\n6. ND Persetujuan prinsip ke SRH Jawa terkait penggantian aset interior', NULL, '19991202752'),
(42, '', '', NULL, 'On Progress', '', '', NULL, '0394053606'),
(42, '', 'Undangan ke Subreg terkait verifikasi penghapus bukuan aset, barang inventaris, perbaikan data aset atas penghapus bukuan, dan RKM inventarisasi siap', NULL, 'Done', NULL, 'Kamis/Jumat antara 18/19 April', NULL, '19971201720'),
(42, '', 'PIC penyediaan data KAP', NULL, 'On Progress', NULL, '', NULL, '19991202752'),
(43, '', 'Agendakan rapat oustanding klaim &amp; buat BA rapat ', NULL, 'Done', NULL, 'Jumat tgl 19 jam 09.00', NULL, '19971201720'),
(43, '', 'Nota Dinas ke SM Hukum terkait legalitas pembayaran 21 M', NULL, 'Done', NULL, 'Nota Dinas ke SM Hukum terkait legalitas pembayaran 21 M ', NULL, '19991202752'),
(44, '', 'ND ke Bu Ning terkait pencatatan aset BOT Synohydro ', NULL, 'Done', NULL, '', NULL, '19971201720'),
(44, '', 'ND Pengasetan AUC 21 M', NULL, 'Done', NULL, 'Kertas Kerja Settlement Aset', NULL, '19991202752'),
(45, '', 'ND Ke HO usulan lelang mandiri Subreg Jawa Aset CCTV', NULL, 'Done', NULL, '', NULL, '19971201720'),
(45, '', 'Verifikasi okupansi dan pendapatan gedung pelindo place untuk keperluan KAP (impairment)', NULL, 'Done', NULL, '', NULL, '19991202752'),
(46, '', 'ND ke ED3 terkait permohonan penerbitan PR pembayaran premi asuransi termin 1', NULL, 'Done', NULL, '', NULL, '19971201720'),
(46, '', 'Nota Dinas ke GH Akuntansi terakit Ungrouping Aset Jembatan Timbang Tegal', NULL, 'Done', NULL, 'Nota Dinas ke GH Akuntansi', NULL, '19991202752'),
(47, '', 'Undangan rapat dengan Teknik &amp; Umum terkait pengembangan aplikasi My Invent', NULL, 'Done', NULL, '', NULL, '19971201720'),
(47, '', 'KK Laporan Penghapusan Aset ke GH MNAT tembusan GH Akuntansi', NULL, 'Done', NULL, 'Kertas Kerja Penghapusan CCTV TPKS', NULL, '19991202752'),
(48, '', 'BA Rapat dengan Komersial terkait Konfirmasi Aset Konsesi Jasa yang berada di PT TTL dan PT APBS', NULL, 'Done', NULL, '', NULL, '19971201720'),
(48, '', 'Review Disposisi SM Aset terkait pekerjaan di Dep Aset Tetap', NULL, 'On Progress', NULL, '', NULL, '19991202752'),
(49, '', 'Pencocokan data outstanding klaim kapal PMS antara laporan liability HO dengan laporan BA PMS', NULL, 'Done', NULL, '', NULL, '19971201720'),
(49, '', 'Pelaksanaan  Inventarisasi  dan  Assesment  Sarana  Penunjang  Kegiatan  Pemanduan di PT Pelabuhan Indonesia (Persero) Regional 3 Sub Regional Jawa', NULL, 'Belum Dimulai', NULL, 'Koordinasi dg Operasi/Komersial, utk aset yg BELUM masuk ke Serah Terima Operasi (BASO) tapi digunakan oleh Sub holding agar dilakukan review dan perubahan BA STO, sehingga biaya pemeliharaan ringan-sedang mjd pengelolaan sub holding', NULL, '19991202752'),
(50, '', 'Berita acara Kick off pengembangan aplikasi My Invent untuk pencatatan barang bekas dan sisa material investasi', NULL, 'Done', NULL, '', NULL, '19971201720'),
(50, '', 'Change Request untuk Settlement Aset dan Penghapusan Aset', NULL, 'On Progress', NULL, 'Nota Dinas ke GH IT tembusan ke GH Akuntansi\r\n- Jelaskan kondisi eksisting settlement aset\r\n- Jelaskan usulan perubahan settlement aset melalui SAP', NULL, '19991202752'),
(51, '', 'Rapat Penghapusan Aset Kapal antara PMS dengan Masing-masing Sub Regional', NULL, 'Done', NULL, '', NULL, '19971201720'),
(51, '', 'Pengecekan hasil grouping aset', NULL, 'On Progress', NULL, 'Pengecekan hasil grouping aset', NULL, '19991202752'),
(52, '', 'ND ke Sub Regional terkait Pelaksanaan Cek Fisik Penghapusan Aset, Penghapusan Non Aset Pengambilan Sertifikat balik nama, dll', NULL, 'Done', NULL, '', NULL, '19971201720'),
(52, '', 'Kertas kerja pengecekan progres fisik BMTH (laporan pimpro BMTH) vs AUC / ASET', NULL, 'On Progress', NULL, 'Laporan Pekerjaan vs AUC', NULL, '19991202752'),
(53, '', 'ND Ke ED3 terkait SPPD Pak Suroso', NULL, 'Done', NULL, '', NULL, '19971201720'),
(53, '', 'Cek Reklasifikasi Aset Konsesi TTL dan Badas', NULL, 'On Progress', NULL, 'Kurang 10 aset TTL yang masih aset class Konsesi', NULL, '19991202752'),
(54, '', 'ND Ke BU Juju Penundaan acara Effective Leadership', NULL, 'Done', NULL, '', NULL, '19971201720'),
(54, '', 'Update KK Selisih DAT vs Neraca per Profit Center', NULL, 'On Progress', NULL, 'Selisih -605.051.774, dan internal antar cabang', NULL, '19991202752'),
(55, '', 'BA sosialisasi RKM Inventarisasi Aset', NULL, 'Done', NULL, '', NULL, '19971201720'),
(55, '', 'Kertas Kerja Pengasetan Sample Cek Fisik Aset Tanjung Emas', NULL, 'Done', NULL, '- Keperluan Cek Fisik Aset Tetap di Tanjung Emas tanggal 20-21 November 2024\r\n- Koordinasi dengan Arno terkait Undangan Pelaksanaan Cek Fisik Aset (done)\r\n- Nota Dinas Permohonan VA untuk pendampingan cek fisik KAP', NULL, '19991202752'),
(56, '', 'SP RKM Inventarisasi Aset', NULL, 'Done', NULL, '', NULL, '19971201720'),
(56, '', 'Perbaikan Dasboard Penjelasan Kenaikan/Penurunan Biaya penyusutan', NULL, 'On Progress', NULL, '', NULL, '19991202752'),
(57, '', 'Surat Keluar TPKS terkait cek fisik penghapusbukuan aset &amp; non aset', NULL, 'Done', NULL, '', NULL, '19971201720'),
(57, '', 'Perbaikan Dashboard penjelasan selisih DAT vs TB SAP sampai level profit Center', NULL, 'On Progress', NULL, '', NULL, '19991202752'),
(58, '', 'ND Sppd SM aset ke Pak Suroso', NULL, 'Done', NULL, '', NULL, '19971201720'),
(58, '', 'Izin Prinsip Penyampaian Polis Asuransi ke KSOP', NULL, 'Done', NULL, '', NULL, '19991202752'),
(59, '', 'Penandatangan BAST Pekerjaan Perbaikan dermaga Maumere dengan PT Meratus dan Kontraktor', NULL, 'Done', NULL, '', NULL, '19971201720'),
(59, '', 'masukan Aset Celukan Bawang ke BOQ 2025', NULL, 'Done', NULL, 'Nota Dinas ke GH MAT', NULL, '19991202752'),
(60, '', 'Dokumen yang menunjukan data aset Kantor Kuala Kapuas untuk asuransi', NULL, 'Done', NULL, '', NULL, '19971201720'),
(60, '', 'Klarifikasi Penghapusan Non Aset yang beririsan dengan surat SPTP', NULL, 'On Progress', NULL, 'Surat Keluar klarifikasi penghapusan non aset yang beririsan dan meminta SPTP untuk mengusulkan penghapusan non aset yang tidak beririsan (usulan baru)', NULL, '19991202752'),
(61, '', 'Surat Undangan ke SPTP terkait Konfirmasi nilai penggantian Asuransi Klaim banjir semarang', NULL, 'Done', NULL, '', NULL, '19971201720'),
(61, '', 'Penghpausan Non Aset Periode 2', NULL, 'Belum Dimulai', NULL, '- Nota Dinas Usulan Penghapusan Non Aset periode 2 ke masing-masing Sub Reg\r\n- Kertas Kerja Penghapusan Non Aset', NULL, '19991202752'),
(62, '', 'Surat Ke askrindo terkait Reinstatement Badai Seroja', NULL, 'Done', NULL, '', NULL, '19971201720'),
(62, '', 'Permohonan Arahan terkait double asuransi aset TPS', NULL, 'Belum Dimulai', NULL, '', NULL, '19991202752'),
(63, '', 'ND Ke HO terkait Laporan RKM Portofilo Aset', NULL, 'Done', NULL, '', NULL, '19971201720'),
(63, '', 'Pemanfaatan  Rail  Container  Crane  Tipe  CR73  Makassar  New  Port  (MNP)  untuk  Pelabuhan Kupang', NULL, 'Belum Dimulai', NULL, '', NULL, '19991202752'),
(64, '', 'ND Ke HO terkait Penerbitan LOD badai seroja kupang', NULL, 'Done', NULL, '', NULL, '19971201720'),
(65, '', 'BA dan LOD ke Askrindo terkait Klaim asuransi Banjir Semarang', NULL, 'Done', NULL, '', NULL, '19971201720'),
(66, '', 'Surat Undangan Ke All Sub Regional untuk evaluasi pengisian data terkait RKM Inventarisasi Aset', NULL, 'Done', NULL, 'Agenda rapat tgl 17 Mei', NULL, '19971201720'),
(67, '', 'ND Ke Legal R3 terkait Surat Tuntutan ke Meratus atas kerusakan moording dolphin Ippi tertabrak Kapal meratus Cilegon', NULL, 'Done', NULL, '', NULL, '19971201720'),
(68, '', 'Berita acara rapat terkait Penyelesaian perbaikan fender di maumere dengan Kontraktor dan Meratus', NULL, 'Done', NULL, '', NULL, '19971201720'),
(69, '', 'ND ke Group Akuntansi HO terkait pencatatan aset SBNP di APBS (Dasar Kontrak Perjanjian)', NULL, 'Done', NULL, '', NULL, '19971201720'),
(70, '', 'ND ke Pak Hendiek terkait tindak lanjut perbaikan dermaga Ende dan Mooring Dolpin Ippi (dasar Surat Bupati Ende, ND Liability dari MNAT HO dan Email dari Meratus minta RAB_', NULL, 'Done', NULL, '', NULL, '19971201720'),
(71, '', 'ND Laporan penyimpanan sertifikat Ke Group Akuntansi HO', NULL, 'Done', NULL, '', NULL, '19971201720'),
(72, '', 'Undangan ke Subreg terkait verifikasi penghapus bukuan aset, barang inventaris, perbaikan data aset atas penghapus bukuan, dan RKM inventarisasi siap (jumat tgl 7 Juni 2024)', NULL, 'Done', NULL, '', NULL, '19971201720'),
(73, '', 'ND Ke Group Akuntansi HO terkait review pencatatan aset (dasar ND konfirmasi dari Group Peralatan HO)', NULL, 'Done', NULL, '', NULL, '19971201720'),
(74, '', 'Undangan ke Divhead Komersial, Divhead Teknik, PMO Teluk Lamong Pak Andrianto, Dirut APBS utk agenda coklit konjas dengan KSOP tgl 25 Juni 2024 di lt 4 Reg3', NULL, 'Done', NULL, '', NULL, '19971201720'),
(75, '', 'Undangan ke KSOP terkait agenda coklit konjas 25 Juni 2024', NULL, 'Done', NULL, '', NULL, '19971201720'),
(76, '', 'ND ke ED3 persetujuan prinsip rapat coklit di Batu tgl 4-6 Juli 2024 dgn KSOP', NULL, 'Done', NULL, '', NULL, '19971201720'),
(77, '', 'Reimbursement tagihan klaim asuransi TPKS Sptp ', NULL, 'Done', NULL, '', NULL, '19971201720'),
(78, '', 'ND Laporan hasil RKM inventarisasi Aset Ke GH Akuntansi HO', NULL, 'Done', NULL, '', NULL, '19971201720'),
(79, '', 'ND ke SRH Jawa terkait Kunjungan ke Semarang', NULL, 'Done', NULL, '', NULL, '19971201720'),
(80, '', 'Surat Keluar ke TPKS terkait kunjungan ke Semarang', NULL, 'Done', NULL, '', NULL, '19971201720'),
(81, '', 'ND ke ED3 terkait SPPD pak suroso ke Semarang tgl 5-6 Agt', NULL, 'Done', NULL, '', NULL, '19971201720'),
(82, '', 'ND ke Pak suroso terkait SPPD pak rony &amp; tri ke semarang tgl 5-6 Agt', NULL, 'Done', NULL, '', NULL, '19971201720'),
(83, '', 'ND ke Pak Suroso terkait SPPD Pak rony ke Medan tgl 14-16 Agt', NULL, 'Done', NULL, '', NULL, '19971201720'),
(84, '', 'ND ke ED3 terkait SPPD pak suroso ke Medan tgl 14-16 Agt', NULL, 'Done', NULL, '', NULL, '19971201720'),
(85, '', 'BA Inventarisasi aset kantor reg3 (aset dep umum &amp; dep TI)', NULL, 'Done', NULL, '', NULL, '19971201720'),
(86, '', 'Undangan ke Fresnel terkait pendampingan Sppd ke medan tgl 15-16', NULL, 'Done', NULL, '', NULL, '19971201720'),
(87, '', 'ND Jawaban Ke Div.Head Komersial terkait Reclass Jasa Konsultan ke AUC', NULL, 'Done', NULL, '', NULL, '19971201720'),
(88, '', 'Surat keluar ke PT Bima terkait undangan pembahasan klaim asuransi 15-16 Agt via zoom', NULL, 'Done', NULL, '', NULL, '19971201720'),
(89, '', 'ND ke Subreg Jawa terkait appraisal ulang aset CCTV di TPKS', NULL, 'Done', NULL, '', NULL, '19971201720'),
(90, '', 'ND ke all SRH terkait pengisian data keberadaan aset salvage', NULL, 'Done', NULL, '1. Memastikan keberadaan aset salvage yg berada di lingkungan reg3\r\n2. Menyatukan aset-aset salvage tsb menjadi 1 lokasi penyimpanan\r\n3. Melakukan pengisian data aset salvage pada link gdrive', NULL, '19971201720'),
(91, '', 'ND ke GH Akuntansi terkait usulan penghapusan pencatatan aset di SAP atas aset yg telah laku terjual namun masih terdaftar di DAT', NULL, 'Done', NULL, '', NULL, '19971201720'),
(92, '', 'ND ke Bu Juju terkait usulan pelatihan visualisasi data', NULL, 'Done', NULL, '', NULL, '19971201720'),
(93, '', 'ND ke GH MNAT persetujuan penghapusan aset forklift patria di Banjarmasin', NULL, 'Done', NULL, '', NULL, '19971201720'),
(94, '', 'ND Ke GH MNAT Terkait usulan penghapusan Aset / Non Aset Salvage Asuransi', NULL, 'Belum Dimulai', NULL, '', NULL, '19971201720'),
(95, '', 'ND dari SM Aset tetap Ke Div.Head AAP terkait Pelatihan Akuntansi Aset', NULL, 'Done', NULL, '', NULL, '19971201720'),
(96, '', 'ND ke Bu juju terkait usulan Pelatihan Bidang Akuntansi Aset Tetap dan Pelatihan Aplikasi SAP untuk Modul Aset Tetap', NULL, 'Done', NULL, 'Estimasi pelaksanaan awal bulan oktober 2024', NULL, '19971201720'),
(97, '', 'BA Rapat outstanding klaim asuransi per 31 Agustus 2024', NULL, 'Done', NULL, '', NULL, '19971201720'),
(98, '', 'LOD 24.00233R3JTG_CPM DOL 16 Februari 2024 Kerusakan Mobil Tangga Telescopic', NULL, 'Done', NULL, '', NULL, '19971201720'),
(99, '', 'Penyelesaian Surat Keputusan ED3 terkait penghapusan jual/lelang aset forklift patria ', NULL, 'Done', NULL, '', NULL, '19971201720'),
(100, '', 'Penyelesaian Surat Keputusan ED3 terkait penghapusan jual/lelang aset CCTV TPKS', NULL, 'Done', NULL, '1. Konfirmasi ke Subreg Jawa laporan KJPP CCTV dan Permintaan lelang mandiri atas CCTV\r\n2. ND ke GH MNAT terkait izin lelang mandiri CCTV\r\n3. ND ke SRH terkait SK ED3 dan persetujuan lelang mandiri CCTV', NULL, '19971201720'),
(101, '', 'ND Ke GH MNAT terkait laporan penhapusan aset CCTV dan Forklift Patria', NULL, 'Belum Dimulai', NULL, '', NULL, '19971201720'),
(102, '', 'Pencatatan aset Sinohydro di Tanjung Emas Semarang', NULL, 'On Progress', NULL, 'ND ke GH Akuntansi untuk mencatat aset synohydro menjadi non aset dengan justifikasi pajak yang harus dibayarkan dan aset tersebut tidak digunakan untuk keperluan operasional', NULL, '19971201720'),
(103, '', 'BA Rapat terkait Pembahasan Pencatatan Aset Build Operate Transfer (BOT) PT Suraya Megah Cemerlang pada PT Pelabuhan Indonesia (Persero) Regional 3 wilayah Sub Regional Jawa', NULL, 'Done', NULL, '', NULL, '19971201720'),
(104, '', 'ND ke GH Akuntansi terkait Konfirmasi Alokasi Endorsement Penambahan Premi Asuransi atas Aset di Wilayah Regional 3 periode Tahun 2024', NULL, 'Done', NULL, 'Masih menunggu no PR dari mas Fadhil umum', NULL, '19971201720'),
(105, '', 'BA Rapat terkait Tindak Lanjut atas Permintaan Penggunaan Polis PTOL milik PT Pelabuhan Indonesia (Persero) Regional 3 oleh PT Terminal Teluk Lamong (TTL)', NULL, 'Done', NULL, '', NULL, '19971201720'),
(106, '', 'ND ke all SRH terkait petunjuk teknis pelaksanaan Penghapusan Non Aset', NULL, 'Done', NULL, '', NULL, '19971201720'),
(107, '', 'Proses administrasi dan pendampingan kegiatan sosialisasi SIAP HO dgn Anper hari Jumat tgl 11 Oktober 2024', NULL, 'Done', NULL, '', NULL, '19971201720'),
(108, '', 'Monitoring ND tanggapan dari HO terkait persetujuan lelang mandiri asset CCTV di TPKS dan asset Forklift di TPKB', NULL, 'Done', NULL, '', NULL, '19971201720'),
(109, '', 'Penyelesaian Surat Keputusan ED3 setelah review dari tim Legal', NULL, 'Done', NULL, '', NULL, '19971201720'),
(110, '', 'KK penyelesaian klaim asuransi SPTP dan SPMT', NULL, 'Done', NULL, '', NULL, '19971201720'),
(111, '', 'Agenda rapat monitoring outstanding klaim SPTP dan SPMT di minggu ke-3 bulan Oktober, undangan offline utk SPTP', NULL, 'Done', NULL, '', NULL, '19971201720'),
(112, '', 'Rekonsiliasi bulanan outstanding klaim per 30 September 2024', NULL, 'Done', NULL, 'tgl 21 oktober jam 13.30', NULL, '19971201720'),
(113, '', 'Pengisian KPI triwulan 3', NULL, 'Done', NULL, '', NULL, '19971201720'),
(114, '', 'Sosialisasi penghapusbukuan non asset', NULL, 'Done', NULL, '', NULL, '19971201720'),
(115, '', 'Undangan Rapat ke Fresnel ', NULL, 'Done', NULL, 'antara tgl 4,5,6 Nov 2024', NULL, '19971201720'),
(116, '', 'ND ke SRH Jawa terkait Konfirmasi Tindak Lanjut BA Synohydro', NULL, 'Done', NULL, 'Kajian penggunaan aset BOT synohydro', NULL, '19971201720'),
(117, '', 'ND ke RDH Sdm terkait Permohonan surat tuntutan ke meratus atas kejadian klaim Ende-Ippi', NULL, 'Done', NULL, 'Lampiran BA kejadian, RAB, dll', NULL, '19971201720'),
(118, '', 'Undangan Rapat ke Meratus &amp; Tim Operasi dan Komersial', NULL, 'Done', NULL, '', NULL, '19971201720'),
(119, '', 'ND ke Subreg Jawa terkait jawaban pengasetan Ruko di Jalan Usman Janatin Kav 18/VI ex PT Pelayaran Laut Baru', NULL, 'Belum Dimulai', NULL, '', NULL, '19971201720'),
(120, '', 'Undangan Rapat ke Subreg &amp; Kantor Reg 3 terkait Sosialisasi Penghapusan Non Aset', NULL, 'Belum Dimulai', NULL, 'minggu ke 3 bulan Nov 2024', NULL, '19971201720'),
(121, '', 'Undangan Rapat ke SPTP terkait Outstanding Klaim Asuransi', NULL, 'Belum Dimulai', NULL, 'minggu ke 3 bulan Nov 2024', NULL, '19971201720'),
(122, '', 'ND ke HO hasil laporan pelaksanaan penghapusbukuan aset CCTV tg emas ', NULL, 'Done', NULL, '', NULL, '19971201720'),
(123, '', 'Review Disposisi SM Aset terkait pekerjaan di Dep Aset Tetap', NULL, 'Belum Dimulai', NULL, '', NULL, '19971201720');

-- --------------------------------------------------------

--
-- Table structure for table `penyelesaian_rutin`
--

CREATE TABLE `penyelesaian_rutin` (
  `id` int(11) NOT NULL,
  `nipp` varchar(20) NOT NULL,
  `bulan` tinyint(4) NOT NULL,
  `tahun` int(11) NOT NULL,
  `status_selesai` tinyint(4) NOT NULL DEFAULT 0,
  `gambar` varchar(255) DEFAULT NULL,
  `link` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `penyelesaian_rutin`
--

INSERT INTO `penyelesaian_rutin` (`id`, `nipp`, `bulan`, `tahun`, `status_selesai`, `gambar`, `link`) VALUES
(1, '19991202752', 12, 2024, 1, 'uploads/Containerterminal_Altenwerder_(Hamburg-Altenwerder).Iris_Bolten.4.phb.ajb.jpg', ''),
(2, '19991202752', 11, 2024, 1, 'uploads/Containerterminal_Altenwerder_(Hamburg-Altenwerder).Iris_Bolten.4.phb.ajb.jpg', ''),
(2, '19991202752', 12, 2024, 1, 'uploads/111.jpg', ''),
(6, '0394053606', 12, 2024, 1, 'uploads/64b4c19bbde1f.jpg', 'https://www.youtube.com/'),
(9, '19971201720', 12, 2024, 1, NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `rutin`
--

CREATE TABLE `rutin` (
  `id` int(11) NOT NULL,
  `nama_tugas` varchar(255) DEFAULT NULL,
  `hari` varchar(10) DEFAULT NULL,
  `bulan` int(11) DEFAULT NULL,
  `tahun` int(11) DEFAULT NULL,
  `nipp` varchar(20) NOT NULL,
  `periode` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rutin`
--

INSERT INTO `rutin` (`id`, `nama_tugas`, `hari`, `bulan`, `tahun`, `nipp`, `periode`) VALUES
(1, 'Penyampaian bukti settlement DAT untuk bukti KPI', '1', 11, 2024, '19991202752', 1),
(2, 'Mutasi aset dan penjelasan selisih aset', '1', 11, 2024, '19991202752', 1),
(3, 'Evaluasi naik turunnya Biaya Penyusutan', '30', 11, 2024, '19991202752', 1),
(4, 'Evaluasi selisih DAT vs SAP', '30', 11, 2024, '19991202752', 1),
(5, 'Settlement AUC', '30', 12, 2024, '0394053606', 1),
(6, 'Monitoring Progress Investasi dengan nilai AUC', '10', 11, 2024, '0394053606', 1),
(7, 'Pengisian Update Progress KPI', '20', 1, 2025, '19971201720', 3),
(8, 'Pengisian Update Progress RKM', '30', 11, 2024, '19971201720', 1),
(9, 'Pengisian Update Progress Risiko (Aplikasi Prima)', '7', 1, 2025, '19971201720', 1),
(10, 'Penyuusunan BA pemenuhan klaim asuransi', '7', 12, 2024, '19971201720', 1),
(11, 'Cleansing UTIP atas uang masuk dari klaim asuransi', '30', 11, 2024, '19971201720', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tombol_data`
--

CREATE TABLE `tombol_data` (
  `id` int(11) NOT NULL,
  `no` int(11) NOT NULL,
  `sub_nomor` varchar(50) NOT NULL,
  `nipp` varchar(50) NOT NULL,
  `link` text DEFAULT NULL,
  `nama_tombol` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tombol_data`
--

INSERT INTO `tombol_data` (`id`, `no`, `sub_nomor`, `nipp`, `link`, `nama_tombol`) VALUES
(145, 26, '', '0394053606', 'https://docs.google.com/spreadsheets/d/1pXiW219I-ZvJYzDaX4nyoTC_Wchaofb_PlQ-OUjYUF4/edit?gid=1513676521#gid=1513676521', 'Part 14'),
(160, 3, '', '0394053606', 'https://drive.google.com/drive/folders/19EqP0koLS-eEjE545EIcViKlxUp-AI5I?usp=sharing', 'Verifikasi DAT atas Inbreng ABM dan APU'),
(161, 3, '', '0394053606', 'https://docs.google.com/spreadsheets/d/1VAqcksnbO6-UMobz6yqxEc6jAYFMUSlM/edit#gid=2000315571', 'Inbreng Kapal'),
(162, 3, '', '0394053606', 'https://docs.google.com/spreadsheets/d/1QbOqEEMyq51HTm-umxpuKC7Qf4RFCYmBMsuCuzLiAmA/edit#gid=0', 'Inbreng Alat Faspel'),
(163, 15, '', '0394053606', 'https://docs.google.com/spreadsheets/d/1LCLjD3Qcgqsy8BSs2piPLBGyoJXc_Qqz93biAWHbpgc/edit?gid=2067861210#gid=2067861210', 'Kertas Kerja Perbaikan Data Aset'),
(164, 4, '', '0394053606', 'https://docs.google.com/spreadsheets/d/1ztxncH2109qT5ByObJr5fao9o_Kasla6LyMyUbROwvg/edit#gid=1895736166', 'Perbaikan Data Aset Tetap All Subreg'),
(165, 4, '', '0394053606', 'https://drive.google.com/drive/folders/122-wwicd_2QTWtKzaR4N-p5hiac0VLDO?hl=id', 'Perbaikan Data Aset Tetap'),
(166, 4, '', '0394053606', 'https://docs.google.com/spreadsheets/d/18bjpiC6lu107FQgiUrAJRM48JmdCycK6BIcMSSHMuE0/edit#gid=2142615962', 'Kirim ke HO - Perbaikan DAT'),
(167, 4, '', '0394053606', 'https://docs.google.com/spreadsheets/d/1oDoaxc_oRw01g41QxfkAYJIqH_uVgzWahHGwiBG2vHI/edit#gid=689674068', '5. Perbaikan Data Aset Part II'),
(168, 4, '', '0394053606', 'https://docs.google.com/spreadsheets/d/1a_07D0vlt12B25IHfLz6JTwEpRk7Mj831IkPXv9Sf4k/edit#gid=0', 'Kirim ke HO - Perbaikan DAT - 2'),
(169, 4, '', '0394053606', 'https://docs.google.com/spreadsheets/d/1WZ4E5qMnFn0fv2MgWl-p5iajSUzXyhVxDdAEQ1iOT18/edit#gid=676997302', 'Perbaikan DAT part 3'),
(170, 4, '', '0394053606', 'https://docs.google.com/spreadsheets/d/14rqA_fgBKi3lyPC3pQF7JhKmsqQ_BdYMt3W4qfK3QS4/edit?gid=0#gid=0', 'Perbaikan DAT PART 4'),
(171, 4, 'a', '0394053606', 'https://docs.google.com/spreadsheets/d/15ivrb4ob--bBK1hsB5CtMJ5dC3ZHjRbXWs9n1CXtL8U/edit#gid=2122967714', 'Regional 3 - Perbaikan DAT'),
(172, 4, 'a', '0394053606', 'https://docs.google.com/spreadsheets/d/1gQBC2qFG8PKPyk0t_hDDv7bfhM988nkHQupDA-9HeRs/edit#gid=0', 'Subreg Jawa - Perbaikan DAT'),
(173, 4, 'a', '0394053606', 'https://docs.google.com/spreadsheets/d/1YIgNvJ1_OBgiDoNQKJX_sJ4uhQJym69oDL5Q-pZHniA/edit#gid=413654115', 'Subreg Kalimantan - Perbaikan DAT'),
(174, 4, 'a', '0394053606', 'https://docs.google.com/spreadsheets/d/1YtslBghRqTXfKPfK0QQstP-qt_Afk411d-jmQ_ZfQdc/edit#gid=0', 'Subreg Bali Nusra - Perbaikan DAT'),
(175, 4, 'b', '0394053606', 'https://docs.google.com/spreadsheets/d/1ver0BXIoIE7HBHV-PBnNHIPE-XN2Ghx3/edit#gid=1194606411', '2_DAT_Februari 2024'),
(176, 5, '', '0394053606', 'https://docs.google.com/spreadsheets/d/1rSlyTu3PaKlJFH-XQFvz6MhAs3d3-kaun1SPS-vgNhc/edit#gid=1320516771', 'Kerjaan Aset Tetap (Baru)'),
(177, 6, '', '0394053606', 'https://drive.google.com/drive/folders/157ownPJFh51tcko_DZ1WTF9Vq1vwFAS_', 'Regional 3'),
(178, 6, '', '0394053606', 'https://docs.google.com/spreadsheets/d/1Ih3MlIc9n4ofHG7Lbkl7q9H6vZFjUviZSq2AlGGysgg/edit#gid=0', 'CheckList Data'),
(179, 7, '', '0394053606', 'https://drive.google.com/drive/folders/1aRNUTL7bO0YeGDqTEXw--uI9XdmnOvKD', 'Perjanjian dan BASO Serah Operasi ke Subholding'),
(180, 7, '', '0394053606', 'https://docs.google.com/spreadsheets/d/1_-3p68y1nhBMCiM97Rh651vUC0mTZ_pk/edit#gid=1810332336', 'Rekap Aset BASO'),
(181, 8, '', '0394053606', 'https://drive.google.com/drive/u/0/folders/1ks73fqUx0pljVZ9CpY0Wjv9Gh61fCE1z', '6. Rapat Pembahasan Penghapusan Aset dan NonAset, dll'),
(182, 8, '', '0394053606', 'https://docs.google.com/spreadsheets/d/1WBWDs_O6Q4vl9_2E3gLlGpgQXS83aW8gGVKrZ1OPHQc/edit#gid=2018406146', 'Posisi data Inventarisasi pada Aplikasi SIAP'),
(184, 10, '', '0394053606', 'https://docs.google.com/spreadsheets/d/1oDoaxc_oRw01g41QxfkAYJIqH_uVgzWahHGwiBG2vHI/edit#gid=689674068', '5. Perbaikan Data Aset terkait Penghapusbukuan Aset'),
(185, 11, '', '0394053606', 'https://docs.google.com/spreadsheets/d/1LWQlyCF099GIz1A5d1-zz0OXe7n1_ujZVTxBPWzWE-w/edit#gid=1515932480', 'Breakdown DAT vs Rumah Dinas'),
(186, 11, '', '0394053606', 'https://docs.google.com/spreadsheets/d/1k89DYta5L__xtD97wTeJXhjPwO_vQFzAfBFSiH_edZ0/edit#gid=1114709534', 'Data Aset Rumah Dinas TW I Tahun 2024'),
(187, 12, '', '0394053606', 'https://docs.google.com/spreadsheets/d/18tFoZ3MDi6EG7vbrJDAPFpH1k6IFgT9W1cBNzRFyhLQ/edit#gid=0', 'List Sertifikat All Subreg R3'),
(188, 12, '', '0394053606', 'https://drive.google.com/drive/folders/1jeZaz3ApyapOpeejg9W7YUNvcdENZ30E', 'Inventarisasi Sertifikat di Brangkas Aset Reg3'),
(189, 12, '', '0394053606', 'https://docs.google.com/spreadsheets/d/1lORFTYToiV5__hxyV24a-z3baAyLZs6_/edit#gid=2120531833', 'Inventarisasi dan Serah Terima Sertifikat Asli atas nama PT Pelabuhan Indonesia (Persero) Regional 3'),
(190, 13, '', '0394053606', 'https://docs.google.com/spreadsheets/d/1OW-M5kwG5hua5WXg4F_Xv4_19-f6nI7nhLqhSMIHKE0/edit?gid=0#gid=0', 'PEMBIAYAAN ATAS AUC 2024'),
(191, 14, '', '0394053606', 'https://docs.google.com/spreadsheets/d/1LNxm-QoDTSbhttlVEPrSOzJoCbYEJtooRnU2K19oLnA/edit?gid=10092527#gid=10092527', 'Part 12'),
(192, 16, '', '0394053606', 'https://docs.google.com/spreadsheets/d/1cjOUn1kyt706kp02PwE6TURvwmvjSvtdpokGHXVnTYw/edit?gid=1286285531#gid=1286285531', 'Verifikasi Aplikasi SIAP'),
(193, 18, '', '0394053606', 'https://docs.google.com/spreadsheets/d/1j1mYDsrAyoXZ1xGnc9-KdG-mZ-ELVVCnavaRyOo8Ms8/edit?gid=499009571#gid=499009571', 'COKLIT AUC'),
(194, 20, '', '0394053606', 'https://docs.google.com/spreadsheets/d/1DvINKarCXnOLP4Pb4YF-IU70VcrvlvRJQW6EquoYI8g/edit?gid=1348053980#gid=1348053980&amp;amp;fvid=1213780804', 'Penyusutan Detil Inbreng'),
(195, 20, '', '0394053606', 'https://docs.google.com/spreadsheets/d/1Fqn5zwWYCS3dOAP_T4DBh00aW0RzAoSkWdIbwjZeQqE/edit?gid=1393469290#gid=1393469290&amp;amp;fvid=812692258', 'Beban Penyusutan'),
(196, 20, '', '0394053606', 'https://docs.google.com/spreadsheets/d/15wjwtiLC7dzzld-NE1D0jY0EoyZJuxu_hvy_drVadRc/edit?gid=1427325257#gid=1427325257', 'SALINAN'),
(197, 20, '', '0394053606', 'https://docs.google.com/spreadsheets/d/1G6wvy7SJqFim_pc7qj3YJZttuKsub43YSS3U1k-LZOg/edit?gid=1427325257#gid=1427325257&amp;amp;fvid=523450184', 'SALINAN FIX'),
(198, 21, '', '0394053606', 'https://docs.google.com/spreadsheets/d/1cjOUn1kyt706kp02PwE6TURvwmvjSvtdpokGHXVnTYw/edit?gid=1286285531#gid=1286285531&amp;amp;fvid=1185481296', 'Verifikasi Aplikasi SIAP'),
(202, 25, '', '0394053606', 'https://docs.google.com/spreadsheets/d/1X0PZgs1PloheXwD00VCF_OGMWKPHBq6pf4U83D0xM2k/edit?gid=1105231901#gid=1105231901', 'DAT vs TB (All)'),
(203, 25, '', '0394053606', 'https://docs.google.com/spreadsheets/d/1FN5P0rgwk8A-dDkNxHkSR53vaYUKW5pYZ7wEXUXhyAw/edit?gid=350129041#gid=350129041', 'Proposed Jurnal Perubahan Profit Center'),
(204, 25, '', '0394053606', 'https://docs.google.com/spreadsheets/d/1BeMhOXgmW_FYpkc-4sBngaFcRRu3rWgnPTfeTqVkbUs/edit?gid=1488380994#gid=1488380994', 'KK R3 Aset Closing Juli 2024'),
(205, 25, '', '0394053606', 'https://drive.google.com/drive/folders/16hQr9XkF0DkFSHyYvaDnXMF4nfpGh5Yd', 'Forum Aset Bogor'),
(206, 25, '', '0394053606', 'https://docs.google.com/spreadsheets/d/1yz_GUnaRj3KrohclgLCA0_qP0c1cUFoYtegQsPdIceY/edit?gid=1764666760#gid=1764666760', 'KK Selisih'),
(212, 27, '', '0394053606', 'https://drive.google.com/drive/folders/1HW4PsjtRATpvG5lGFXQbgxitAWEwa8Qr', '2. REKONSILIASI ASET TANAH &amp;amp; SERTIFIKAT TANAH'),
(213, 27, '', '0394053606', 'https://docs.google.com/spreadsheets/d/1Zt1uJq_1byWSRu-qqCA1YLpL5aPM3zbV/edit?gid=1114718936#gid=1114718936', 'Kertas Kerja Data Aset Lahan Regional TW III Tahun 2024 '),
(214, 27, '', '0394053606', 'https://docs.google.com/spreadsheets/d/162VPyou_sfeBKLenRsDTf4pjAkDcm7UH-nFn94QfwZA/edit?gid=1683142601#gid=1683142601', 'Database Aset Tanah Reg3'),
(215, 27, '', '0394053606', 'https://docs.google.com/spreadsheets/d/1YgoFq0PEBfKbpLYuXNFlWLpTB7ty3H6ct0sFJsBX-CA/edit?gid=0#gid=0', 'Data Aset Tanah ALL'),
(216, 27, '', '0394053606', 'https://drive.google.com/drive/folders/1dNXYLj_PSq98g-IvXA-8xxfUw8VfW4zK', '11. Perbaikan data Aset dan Mapping Aset Tanah'),
(217, 28, '', '0394053606', 'https://docs.google.com/spreadsheets/d/1sC5c1f0g1R9Xs2JOpvIfZF9C6vLGrt1p2yK8MWcyK3E/edit?gid=0#gid=0', 'Kerangka / Struktur Sistem'),
(218, 28, '', '0394053606', 'https://drive.google.com/drive/folders/1YHzDQpC1McUAozjQcLHYcVGZhN5xRA_-?usp=drive_link', 'Pelindo Inovasi 2024'),
(219, 28, '', '0394053606', 'https://www.canva.com/design/DAGSOaQFqJ0/nmc6SnVsNOT3XRD7XPftVA/edit', 'Canva'),
(220, 28, '', '0394053606', 'https://docs.google.com/spreadsheets/d/1OZMNB0zEb2ikE58JUL6GBTgCA131DJl-poQoYP8OVtM/edit?gid=1577911717#gid=1577911717', 'Sistem IAMS'),
(227, 30, '', '0394053606', 'https://docs.google.com/spreadsheets/d/1QNuo_aEsKlAhU_5fZhC4S44y9bkN_4CD8wIqF08bxsw/edit?usp=drive_link', 'Jawa'),
(228, 30, '', '0394053606', 'https://docs.google.com/spreadsheets/d/1wQPYCst9rQhgVU5t6hcP4-5YtgDMLPQv_i8e0Hm-PVY/edit?usp=drive_link', 'Kalimantan'),
(229, 30, '', '0394053606', 'https://docs.google.com/spreadsheets/d/1Xsl2DdsQd54iDntTApgO4wR2-i7duP_3ZZou8Uv-BKk/edit?usp=drive_link', 'Bali Nusra'),
(231, 31, '', '0394053606', 'https://docs.google.com/spreadsheets/d/1SWFHvWwlQiQuPurMH_eUjZp-yTtbEcpPVr794jgyU0I/edit?gid=0#gid=0', 'Kredensial field-field aplikasi SIAP'),
(232, 32, '', '0394053606', 'https://docs.google.com/spreadsheets/d/1uv7hdNRUzd86xRPa7Lg4N0MRlmPMHQakQWBJJMWlK6I/edit?gid=787848355#gid=787848355', 'KK Perubahan Cost Center Aset IT ke HO'),
(233, 33, '', '0394053606', 'https://docs.google.com/spreadsheets/d/17uK406Gj82D6w73qHGgkiYNwf1YpRTAcsIsb8ZA5g84/edit?gid=1074416392#gid=1074416392&amp;fvid=1877314252', 'Penyusutan dan Asuransi Subholding Sesuai BASO'),
(235, 35, '', '0394053606', 'https://docs.google.com/spreadsheets/d/1Tqjj1oxUIdIznCRKRWYKsCwP73zopoP3PSe9NZoKj34/edit?gid=451504661#gid=451504661', 'Monitoring Laporan Beban Investasi'),
(236, 36, '', '0394053606', 'https://docs.google.com/spreadsheets/d/1p-m14OVtbS62rPSez-VxM3UW8lsfOBst9WlIchcqHvE/edit?gid=74964080#gid=74964080&amp;fvid=1078453343', 'Dashboard Monitoring Aset'),
(237, 37, '', '0394053606', 'https://www.canva.com/design/DAGUk4rH2Yc/dkknmboPRNYx7fxVsCrVSQ/edit', 'Canva'),
(245, 1, '', '0394053606', 'https://drive.google.com/drive/u/0/folders/1u10OrioOx2dhOq0SZ1YxnBe3KDkgvDiT', 'CLEANSING AUC'),
(246, 1, '', '0394053606', 'https://drive.google.com/drive/u/0/folders/17pvNEjmAxodRIjeuAc8QRG5H6-X6PgG9', 'Submit KK Settlement Aset'),
(247, 1, '', '0394053606', 'https://docs.google.com/spreadsheets/d/1Tqjj1oxUIdIznCRKRWYKsCwP73zopoP3PSe9NZoKj34/edit#gid=781318967', 'Monitoring Laporan Beban Investasi'),
(248, 1, '', '19991202752', 'https://docs.google.com/spreadsheets/d/1OiG2bbmpR20wdcFHpVfqzb5ZDSphjeTmZ9XS6_XgAVU/edit?usp=sharing', 'KK SAP vs DAT Juli 2024'),
(250, 1, 'a', '19991202752', 'https://docs.google.com/spreadsheets/d/1dujwsLFjp8tDrI_f5uyzXO0DXlu2glVX/edit?usp=sharing&amp;amp;ouid=108372230147296694677&amp;amp;rtpof=true&amp;amp;sd=true', 'Saldo GRIR s.d. 300624 Inventaris dan Evaluasi Kirim HO'),
(251, 1, 'e', '19991202752', 'https://docs.google.com/spreadsheets/d/1h3nfAAkgmt8nHHMezp_HJjdfhaYcv_ya/edit?usp=sharing&amp;ouid=108372230147296694677&amp;rtpof=true&amp;sd=true', 'KK Pengasetan Gedung Pelindo Office Tower (1)'),
(254, 2, '', '19991202752', '', ''),
(255, 3, '', '19991202752', 'https://docs.google.com/spreadsheets/d/16VlU59GpshHCHnSA1AzoXd-N-j1xzzdo/edit?usp=sharing&amp;ouid=108372230147296694677&amp;rtpof=true&amp;sd=true', 'Gilimas'),
(256, 4, '', '19991202752', 'https://docs.google.com/spreadsheets/d/18bjpiC6lu107FQgiUrAJRM48JmdCycK6BIcMSSHMuE0/edit?usp=sharing', 'Part 1 - Kirim ke HO - Perbaikan DAT'),
(257, 4, '', '19991202752', 'https://docs.google.com/spreadsheets/d/1oDoaxc_oRw01g41QxfkAYJIqH_uVgzWahHGwiBG2vHI/edit?usp=sharing', 'Part 2 - 5. Perbaikan Data Aset Part II'),
(258, 4, '', '19991202752', 'https://docs.google.com/spreadsheets/d/1WZ4E5qMnFn0fv2MgWl-p5iajSUzXyhVxDdAEQ1iOT18/edit?usp=sharing', 'Part 3 - Perbaikan DAT part 3'),
(259, 5, '', '19991202752', 'https://docs.google.com/spreadsheets/d/1sFB-uF448v5x9i8eDTLd5kAv_4MEKmUSSFs7ZSE2vaA/edit?usp=sharing', 'Terdapat No. Aset yang masih Aktif padahal aset sudah dijual/hapus administrasi'),
(260, 6, '', '19991202752', 'https://pelindo2-my.sharepoint.com/:x:/g/personal/fixedasset_ho_pelindo_co_id/Ef5JTGy32YxIths5LK_VSTUBl0Bx9e8NcIUkGhCKdtsRTw?rtime=NqUXDhq13Eg', 'Link HO'),
(261, 6, '', '19991202752', 'https://docs.google.com/spreadsheets/d/1NgvzaBESPoOkiU1vrChknpg1Yi1L6Smk/edit?usp=sharing&amp;ouid=108372230147296694677&amp;rtpof=true&amp;sd=true', 'KK Konfirmasi AUC REG 3'),
(262, 7, '', '19991202752', 'https://docs.google.com/spreadsheets/d/1OiG2bbmpR20wdcFHpVfqzb5ZDSphjeTmZ9XS6_XgAVU/edit?usp=sharing', 'KK SAP vs DAT Juli 2024'),
(263, 7, 'a', '19991202752', 'https://docs.google.com/spreadsheets/d/1hsEbgOrZQCd81ZI7vyQ9DO1BzAalVeJv/edit?usp=sharing&amp;ouid=108372230147296694677&amp;rtpof=true&amp;sd=true', 'Kertas Kerja Jurnal Biaya/Pendapatan Cleansing AUC'),
(264, 7, 'b', '19991202752', 'https://docs.google.com/spreadsheets/d/1h3nfAAkgmt8nHHMezp_HJjdfhaYcv_ya/edit?usp=sharing&amp;ouid=108372230147296694677&amp;rtpof=true&amp;sd=true', 'KK Pengasetan Gedung Pelindo Office Tower (1)'),
(265, 7, 'c', '19991202752', 'https://docs.google.com/spreadsheets/d/1h3nfAAkgmt8nHHMezp_HJjdfhaYcv_ya/edit?usp=sharing&amp;ouid=108372230147296694677&amp;rtpof=true&amp;sd=true', 'KK Pengasetan Gedung Pelindo Office Tower (1)'),
(266, 8, '', '19991202752', '', ''),
(267, 9, '', '19991202752', 'https://docs.google.com/spreadsheets/d/10-BlneegA7qNcrsOHuXo261ArL2J3Cj6FV7j6ZXWGhU/edit?usp=drive_link', 'Verifikasi Perizinan Tahun 2018 - 2023 100%'),
(268, 10, '', '19991202752', 'https://docs.google.com/spreadsheets/d/1ORqLjDydKb5o-VXdxTzRlr8AMjkdmUcON9x9oLM8p_Y/edit?usp=sharing', 'List Aset Konsesi dan KSP'),
(269, 10, '', '19991202752', 'https://docs.google.com/spreadsheets/d/1gVQECl4Cy5h3BRvNrlCDrfLzcaBXMmrX/edit?rtpof=true', 'Breakdown aset konjas kemenhub TTL'),
(270, 11, '', '19991202752', '', ''),
(271, 12, '', '19991202752', 'https://docs.google.com/spreadsheets/d/1WntXVVjBPtp-kKs6RUU-7EM66PgH11gWGkYsC4s-5gE/edit?usp=sharing', 'Aset SIUK yang tidak tercatat di DAT'),
(272, 13, '', '19991202752', 'https://docs.google.com/spreadsheets/d/1hsEbgOrZQCd81ZI7vyQ9DO1BzAalVeJv/edit?usp=sharing&amp;ouid=108372230147296694677&amp;rtpof=true&amp;sd=true', 'Kertas Kerja Jurnal Biaya/Pendapatan Cleansing AUC'),
(273, 14, '', '19991202752', 'https://docs.google.com/spreadsheets/d/166vNmPwcX8kndPsGGYrZVvTKa4-9BSs6KyO2B1TrEDo/edit?usp=drive_link', 'Usulan Penghapusbukuan Aset 2023'),
(274, 14, '', '19991202752', 'https://docs.google.com/spreadsheets/d/1LbrS_QJxt-Yg7ZE1gaiCNC_RxWzcn41L6YymverrCgo/edit?usp=drive_link', 'Usulan Penghapusbukuan 2024'),
(275, 14, '', '19991202752', 'https://docs.google.com/spreadsheets/d/1hkCylWsJo5TP3dWWdVT7W8M31sVHPIVyW8IYejex09E/edit?usp=drive_link', 'Usulan Penghapusbukuan 2024 Kantor Regional 3'),
(276, 15, '', '19991202752', 'https://1drv.ms/x/c/8d5aa1c19db8f8c7/EYtorhJIuFdNnpe6P56p0yEBpX9xZ8j3_wj7icyKx7Fw_w?e=xkSmAb', 'Provisi Konsesi'),
(277, 15, 'a', '19991202752', '', ''),
(278, 15, 'b', '19991202752', '', ''),
(279, 16, '', '19991202752', 'https://docs.google.com/spreadsheets/d/1IgznRxjXNvhyt5pXd2c5ym_j0t91X8fX/edit?usp=drive_link&amp;ouid=108372230147296694677&amp;rtpof=true&amp;sd=true', 'KK Verifikasi Aset TTL'),
(280, 16, '', '19991202752', 'https://docs.google.com/spreadsheets/d/1dJZYzn19NJnkw3HcsoHKOSsWoCQT6xhDsePfB9ZzaLU/edit?usp=sharing', 'KK Verifikasi Aset TTL'),
(281, 16, '', '19991202752', 'https://docs.google.com/spreadsheets/d/1ORqLjDydKb5o-VXdxTzRlr8AMjkdmUcON9x9oLM8p_Y/edit#gid=487542208', 'List Aset Konsesi dan KSP'),
(282, 17, '', '19991202752', 'https://docs.google.com/spreadsheets/d/1V5QCK8HxbxTQsEO-N2PaA_nXzwFJ4cE6CsnWLPzTGcs/edit?usp=sharing', 'Part 9'),
(283, 18, '', '19991202752', 'https://docs.google.com/spreadsheets/d/1XBdqIooO5hz-3xawvDr9Qh5GK1PZzR3w7gs7TxZ928w/edit?usp=sharing', 'KK Pengasetan Labuan Bajo '),
(284, 19, '', '19991202752', 'https://docs.google.com/spreadsheets/d/18g9rOjEDWnyuHjkLkwOi62irhLyixJUU/edit?usp=sharing&amp;ouid=108372230147296694677&amp;rtpof=true&amp;sd=true', 'Kapitalisasi Aset Hibah Pelabuhan lembar'),
(285, 20, '', '19991202752', 'https://drive.google.com/drive/folders/1hvdUaOGm-4MD2-9Z5Up0qNKEUToD5g01?usp=drive_link', 'Usulan Penghapusbukuan 2023-2024'),
(286, 21, '', '19991202752', 'https://drive.google.com/drive/folders/1hvdUaOGm-4MD2-9Z5Up0qNKEUToD5g01?usp=drive_link', 'Usulan Penghapusbukuan 2023-2024'),
(287, 22, '', '19991202752', 'https://docs.google.com/spreadsheets/d/1XBdqIooO5hz-3xawvDr9Qh5GK1PZzR3w7gs7TxZ928w/edit?usp=sharing', 'KK Pengasetan Labuan Bajo '),
(288, 23, '', '19991202752', 'https://docs.google.com/spreadsheets/d/1u7nlACbd-oMWo0iTzM5DNOSIsoXpPXFB/edit?usp=sharing&amp;ouid=108372230147296694677&amp;rtpof=true&amp;sd=true', 'Endorsement Tambah dan Kurang Regional 3 2024 (rev)'),
(289, 24, '', '19991202752', '', ''),
(290, 25, '', '19991202752', '', ''),
(291, 26, '', '19991202752', '', ''),
(292, 27, '', '19991202752', '', ''),
(293, 28, '', '19991202752', '', ''),
(294, 29, '', '19991202752', 'https://docs.google.com/spreadsheets/d/1cXkPCINMoA1WCLOnIf5e0LYjd0BayG88hZn396RoZzk/edit?usp=sharing', 'Rekap Pembebanan Biaya dan Pendapatan 2024'),
(295, 30, '', '19991202752', 'https://docs.google.com/spreadsheets/d/1A-AJifaTqPSan0ZpNd1bZgXBxwC764o6pQiFt_lDQLc/edit?usp=sharing', 'Kerjaan Aset TeUsulan Penghapusan Barang Bekas atas Scraptap (baru)'),
(296, 31, '', '19991202752', '', ''),
(297, 32, '', '19991202752', '', ''),
(298, 33, '', '19991202752', '', ''),
(299, 34, '', '19991202752', 'https://docs.google.com/spreadsheets/d/1EKOOOVjRpL2ANE6Aw81InNfBbc_n2R8r/edit?usp=drive_link&amp;ouid=108372230147296694677&amp;rtpof=true&amp;sd=true', 'Pengelompokan Aset'),
(300, 35, '', '19991202752', 'https://docs.google.com/spreadsheets/d/1QNuo_aEsKlAhU_5fZhC4S44y9bkN_4CD8wIqF08bxsw/edit?usp=drive_link', 'Jawa'),
(301, 35, '', '19991202752', 'https://docs.google.com/spreadsheets/d/1wQPYCst9rQhgVU5t6hcP4-5YtgDMLPQv_i8e0Hm-PVY/edit?usp=drive_link', 'Kalimantan'),
(302, 35, '', '19991202752', 'https://docs.google.com/spreadsheets/d/1Xsl2DdsQd54iDntTApgO4wR2-i7duP_3ZZou8Uv-BKk/edit?usp=drive_link', 'Bali Nusra'),
(303, 36, '', '19991202752', 'https://docs.google.com/spreadsheets/d/1QNuo_aEsKlAhU_5fZhC4S44y9bkN_4CD8wIqF08bxsw/edit?usp=drive_link', 'Jawa'),
(304, 36, '', '19991202752', 'https://docs.google.com/spreadsheets/d/1wQPYCst9rQhgVU5t6hcP4-5YtgDMLPQv_i8e0Hm-PVY/edit?usp=drive_link', 'Kalimantan'),
(305, 36, '', '19991202752', 'https://docs.google.com/spreadsheets/d/1Xsl2DdsQd54iDntTApgO4wR2-i7duP_3ZZou8Uv-BKk/edit?usp=drive_link', 'Bali Nusra'),
(306, 37, '', '19991202752', 'https://drive.google.com/drive/folders/1aRNUTL7bO0YeGDqTEXw--uI9XdmnOvKD', 'Perjanjian dan BASO Serah Operasi ke Subholding'),
(307, 37, '', '19991202752', 'https://docs.google.com/spreadsheets/d/1_-3p68y1nhBMCiM97Rh651vUC0mTZ_pk/edit#gid=1810332336', 'Rekap Aset BASO'),
(308, 38, '', '19991202752', 'https://docs.google.com/spreadsheets/d/1Q9eA5Oc4Jd1yQHS2VvS3tbPyQgezev5w/edit?usp=sharing&amp;ouid=108372230147296694677&amp;rtpof=true&amp;sd=true', 'Copy of ANGGARAN ASURANSI 2025 (BESERTA RINCIAN ASET)'),
(309, 39, '', '19991202752', 'https://docs.google.com/spreadsheets/d/1XU5lRE7uzYYPz4zHDAJowBIg__F7g4ejoS7aY71eGWc/edit?usp=sharing', 'Konfirmasi Aset Tersedia untuk Dijual'),
(310, 40, '', '19991202752', 'https://docs.google.com/spreadsheets/d/1SBdNwFaAQq0SFACCoitpfHAJZe9d1Er-/edit?usp=drive_link&amp;ouid=108372230147296694677&amp;rtpof=true&amp;sd=true', 'Rincian Pipa Gas'),
(311, 41, '', '19991202752', 'https://docs.google.com/spreadsheets/d/1GxWdmwbTEhKTpX4RaG21NrZWKPei8hK-tz24zNEfNic/edit?usp=sharing', 'KK Ungrouping dan PI Pelindo Place'),
(312, 42, '', '19991202752', '', ''),
(313, 43, '', '19991202752', '', ''),
(314, 44, '', '19991202752', '', ''),
(315, 45, '', '19991202752', 'https://docs.google.com/spreadsheets/d/1wRqz09TtYuQrqBE3mdBeOFB8FyWVfj2t/edit?usp=sharing&amp;ouid=108372230147296694677&amp;rtpof=true&amp;sd=true', 'REALISASI FS PELINDO PLACE 24'),
(316, 46, '', '19991202752', '', ''),
(317, 47, '', '19991202752', 'https://docs.google.com/spreadsheets/d/1e5MgB7MLxD20WMe0tRd1SYz0FT-G8dSs0M6Az3B7L7A/edit?usp=sharing', 'Penghapusan CCTV TPKS'),
(318, 48, '', '19991202752', '', ''),
(319, 49, '', '19991202752', '', ''),
(320, 50, '', '19991202752', 'https://docs.google.com/document/d/1xvq9JFzCz2Q4D9apHVLYGaQVY1ayCUSn/edit?usp=drive_link&amp;ouid=108372230147296694677&amp;rtpof=true&amp;sd=true', 'Kerangka Change Request SAP dan SIAP'),
(321, 51, '', '19991202752', 'https://docs.google.com/spreadsheets/d/11yJeH4mjtkdWwC9Z0Z0EGduOuPWFEXWI/edit?usp=drive_link&amp;ouid=108372230147296694677&amp;rtpof=true&amp;sd=true', 'Pengelompokan Aset'),
(322, 52, '', '19991202752', 'https://drive.google.com/drive/folders/1SBT4W73NkuMTOW5DRIu1-636IMYQYqCl?usp=drive_link', 'BMTH per November 2024'),
(323, 53, '', '19991202752', 'https://docs.google.com/spreadsheets/d/1WZ4E5qMnFn0fv2MgWl-p5iajSUzXyhVxDdAEQ1iOT18/edit?gid=1878931831#gid=1878931831', 'Perbaikan DAT part 3'),
(324, 54, '', '19991202752', 'https://docs.google.com/spreadsheets/d/1OAS5228US1fqnmDuBccFRCXOeUn6lRcx2ZNltA0eDwU/edit?gid=560018650#gid=560018650', 'Salinan KK Selisih'),
(325, 55, '', '19991202752', 'https://drive.google.com/drive/folders/1s2KX3o62DiDkjADZNIxJ69jd7xPSYkLM?usp=drive_link', 'Jawa Tengah'),
(326, 56, '', '19991202752', 'https://docs.google.com/spreadsheets/d/1p-m14OVtbS62rPSez-VxM3UW8lsfOBst9WlIchcqHvE/edit?usp=sharing', 'Dasbor Monitoring Aset'),
(327, 57, '', '19991202752', 'https://docs.google.com/spreadsheets/d/1p-m14OVtbS62rPSez-VxM3UW8lsfOBst9WlIchcqHvE/edit?usp=sharing', 'Dasbor Monitoring Aset'),
(328, 58, '', '19991202752', '', ''),
(329, 59, '', '19991202752', '', ''),
(330, 60, '', '19991202752', '', 'Menunggu Konfirmasi dari Tim Jateng dan TPKS'),
(331, 61, '', '19991202752', '', ''),
(332, 62, '', '19991202752', '', ''),
(333, 63, '', '19991202752', '', ''),
(334, 1, '', '19971201720', '', ''),
(335, 2, '', '19971201720', '', ''),
(336, 3, '', '19971201720', '', ''),
(337, 4, '', '19971201720', '', ''),
(338, 5, '', '19971201720', '', ''),
(339, 6, '', '19971201720', '', ''),
(340, 7, '', '19971201720', '', ''),
(341, 8, '', '19971201720', '', ''),
(342, 9, '', '19971201720', '', ''),
(343, 10, '', '19971201720', '', ''),
(344, 11, '', '19971201720', '', ''),
(345, 12, '', '19971201720', '', ''),
(346, 13, '', '19971201720', '', ''),
(347, 14, '', '19971201720', '', ''),
(348, 15, '', '19971201720', '', ''),
(349, 16, '', '19971201720', '', ''),
(350, 17, '', '19971201720', '', ''),
(351, 18, '', '19971201720', '', ''),
(352, 19, '', '19971201720', '', ''),
(353, 20, '', '19971201720', '', ''),
(354, 21, '', '19971201720', '', ''),
(355, 22, '', '19971201720', '', ''),
(356, 23, '', '19971201720', '', ''),
(357, 24, '', '19971201720', '', ''),
(358, 25, '', '19971201720', '', ''),
(359, 26, '', '19971201720', '', ''),
(360, 27, '', '19971201720', '', ''),
(361, 28, '', '19971201720', '', ''),
(362, 29, '', '19971201720', '', ''),
(363, 30, '', '19971201720', '', ''),
(364, 31, '', '19971201720', '', ''),
(365, 32, '', '19971201720', '', ''),
(366, 33, '', '19971201720', '', ''),
(367, 34, '', '19971201720', '', ''),
(368, 35, '', '19971201720', '', ''),
(369, 36, '', '19971201720', '', ''),
(370, 37, '', '19971201720', '', ''),
(371, 38, '', '19971201720', '', ''),
(372, 39, '', '19971201720', '', ''),
(373, 40, '', '19971201720', '', ''),
(374, 41, '', '19971201720', '', ''),
(375, 42, '', '19971201720', '', ''),
(376, 43, '', '19971201720', '', ''),
(377, 44, '', '19971201720', '', ''),
(378, 45, '', '19971201720', '', ''),
(379, 46, '', '19971201720', '', ''),
(380, 47, '', '19971201720', '', ''),
(381, 48, '', '19971201720', '', ''),
(382, 49, '', '19971201720', '', ''),
(383, 50, '', '19971201720', '', ''),
(384, 51, '', '19971201720', '', ''),
(385, 52, '', '19971201720', '', ''),
(386, 53, '', '19971201720', '', ''),
(387, 54, '', '19971201720', '', ''),
(388, 55, '', '19971201720', '', ''),
(389, 56, '', '19971201720', '', ''),
(390, 57, '', '19971201720', '', ''),
(391, 58, '', '19971201720', '', ''),
(392, 59, '', '19971201720', '', ''),
(393, 60, '', '19971201720', '', ''),
(394, 61, '', '19971201720', '', ''),
(395, 62, '', '19971201720', '', ''),
(396, 63, '', '19971201720', '', ''),
(397, 64, '', '19971201720', '', ''),
(398, 65, '', '19971201720', '', ''),
(399, 66, '', '19971201720', '', ''),
(400, 67, '', '19971201720', '', ''),
(401, 68, '', '19971201720', '', ''),
(402, 69, '', '19971201720', '', ''),
(403, 70, '', '19971201720', '', ''),
(404, 71, '', '19971201720', '', ''),
(405, 72, '', '19971201720', '', ''),
(406, 73, '', '19971201720', '', ''),
(407, 74, '', '19971201720', '', ''),
(408, 75, '', '19971201720', '', ''),
(409, 76, '', '19971201720', '', ''),
(410, 77, '', '19971201720', '', ''),
(411, 78, '', '19971201720', '', ''),
(412, 79, '', '19971201720', '', ''),
(413, 80, '', '19971201720', '', ''),
(414, 81, '', '19971201720', '', ''),
(415, 82, '', '19971201720', '', ''),
(416, 83, '', '19971201720', '', ''),
(417, 84, '', '19971201720', '', ''),
(418, 85, '', '19971201720', '', ''),
(419, 86, '', '19971201720', '', ''),
(420, 87, '', '19971201720', '', ''),
(421, 88, '', '19971201720', '', ''),
(422, 89, '', '19971201720', '', ''),
(423, 90, '', '19971201720', '', ''),
(424, 91, '', '19971201720', '', ''),
(425, 92, '', '19971201720', '', ''),
(426, 93, '', '19971201720', '', ''),
(427, 94, '', '19971201720', '', ''),
(428, 95, '', '19971201720', '', ''),
(429, 96, '', '19971201720', '', ''),
(430, 97, '', '19971201720', '', ''),
(431, 98, '', '19971201720', '', ''),
(432, 99, '', '19971201720', '', ''),
(433, 100, '', '19971201720', '', ''),
(434, 101, '', '19971201720', '', ''),
(435, 102, '', '19971201720', '', ''),
(436, 103, '', '19971201720', '', ''),
(438, 104, '', '19971201720', '', ''),
(439, 105, '', '19971201720', '', ''),
(440, 106, '', '19971201720', '', ''),
(441, 107, '', '19971201720', '', ''),
(442, 108, '', '19971201720', '', ''),
(443, 109, '', '19971201720', '', ''),
(444, 110, '', '19971201720', '', ''),
(445, 111, '', '19971201720', '', ''),
(446, 112, '', '19971201720', '', ''),
(447, 113, '', '19971201720', '', ''),
(448, 114, '', '19971201720', '', ''),
(450, 115, '', '19971201720', '', ''),
(451, 116, '', '19971201720', '', ''),
(452, 117, '', '19971201720', '', ''),
(453, 118, '', '19971201720', '', ''),
(454, 119, '', '19971201720', '', ''),
(455, 120, '', '19971201720', '', ''),
(456, 121, '', '19971201720', '', ''),
(457, 122, '', '19971201720', '', ''),
(458, 123, '', '19971201720', '', ''),
(467, 41, '', '0394053606', '', ''),
(471, 29, '', '0394053606', 'https://docs.google.com/spreadsheets/d/1QNuo_aEsKlAhU_5fZhC4S44y9bkN_4CD8wIqF08bxsw/edit?usp=drive_link', 'Jawa'),
(472, 29, '', '0394053606', 'https://docs.google.com/spreadsheets/d/1wQPYCst9rQhgVU5t6hcP4-5YtgDMLPQv_i8e0Hm-PVY/edit?usp=drive_link', 'Kalimantan'),
(473, 29, '', '0394053606', 'https://docs.google.com/spreadsheets/d/1Xsl2DdsQd54iDntTApgO4wR2-i7duP_3ZZou8Uv-BKk/edit?usp=drive_link', 'Bali Nusra'),
(498, 34, '', '0394053606', '', ''),
(499, 42, '', '0394053606', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `useradmin`
--

CREATE TABLE `useradmin` (
  `id` int(11) NOT NULL,
  `nipp` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `useradmin`
--

INSERT INTO `useradmin` (`id`, `nipp`, `password`) VALUES
(1, '2024', '$2y$10$8kQqMjcOzJhd.QgyyusOYuNYA3nQVUx.DJzY39QOCLNIpjce2NBQW');

-- --------------------------------------------------------

--
-- Table structure for table `userdata`
--

CREATE TABLE `userdata` (
  `id` int(11) NOT NULL,
  `nipp` varchar(50) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `userdata`
--

INSERT INTO `userdata` (`id`, `nipp`, `nama`, `created_at`) VALUES
(14, '0394053606', 'Tri Swasono', '2024-11-15 03:18:28'),
(15, '19971201720', 'Nana', '2024-11-15 03:19:04'),
(16, '19991202752', 'Maulana', '2024-11-15 03:19:33');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kerjaan_baru`
--
ALTER TABLE `kerjaan_baru`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pekerjaan`
--
ALTER TABLE `pekerjaan`
  ADD PRIMARY KEY (`no`,`sub_nomor`,`nipp`);

--
-- Indexes for table `penyelesaian_rutin`
--
ALTER TABLE `penyelesaian_rutin`
  ADD PRIMARY KEY (`id`,`nipp`,`bulan`,`tahun`);

--
-- Indexes for table `rutin`
--
ALTER TABLE `rutin`
  ADD PRIMARY KEY (`id`,`nipp`);

--
-- Indexes for table `tombol_data`
--
ALTER TABLE `tombol_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pekerjaan_fk` (`no`,`sub_nomor`,`nipp`);

--
-- Indexes for table `useradmin`
--
ALTER TABLE `useradmin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nipp` (`nipp`);

--
-- Indexes for table `userdata`
--
ALTER TABLE `userdata`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kerjaan_baru`
--
ALTER TABLE `kerjaan_baru`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `rutin`
--
ALTER TABLE `rutin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tombol_data`
--
ALTER TABLE `tombol_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=501;

--
-- AUTO_INCREMENT for table `useradmin`
--
ALTER TABLE `useradmin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `userdata`
--
ALTER TABLE `userdata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tombol_data`
--
ALTER TABLE `tombol_data`
  ADD CONSTRAINT `pekerjaan_fk` FOREIGN KEY (`no`,`sub_nomor`,`nipp`) REFERENCES `pekerjaan` (`no`, `sub_nomor`, `nipp`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
