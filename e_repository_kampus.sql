-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 21, 2026 at 04:47 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `e_repository_kampus`
--

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `document_author` varchar(255) NOT NULL,
  `abstract` text,
  `category` varchar(100) NOT NULL,
  `department` varchar(100) NOT NULL,
  `year` int NOT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `external_url` varchar(255) DEFAULT NULL,
  `views` int DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(20) DEFAULT 'Pending',
  `rejection_reason` text,
  `rejection_assets` varchar(255) DEFAULT NULL,
  `external_link` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `documents`
--

INSERT INTO `documents` (`id`, `title`, `document_author`, `abstract`, `category`, `department`, `year`, `file_path`, `external_url`, `views`, `created_at`, `status`, `rejection_reason`, `rejection_assets`, `external_link`) VALUES
(4, 'rtyuioghjkkls', 'Budi Santoso', 'drpoigfhjhgfnbvccvbnm,', 'Jurnal Akademik', 'D3 Teknik Mesin', 2026, 'uploads/1778265470438-371942186.pdf', '', 0, '2026-05-08 17:22:22', 'Ditolak', 'Sejauh ini kita menggarap proyek, ada banyak hal yang aku amati sebagai pengembangan lebih lanjut\r\n1. size file upload sesuai kategori dokumen, untuk meminimalkan ruang penyimpanan \r\n2. tidak bisa tangkap layer saat lihat file document\r\n3. fitur lonceng notif belum aktif, belum menampilkan pesan. Sepertinya sebelumnya kia sudah buat, bantu cek \r\n4. responsive tapi saat pindah tampilan device misalnya ke xr ada bagian menu di navbar yang hilang. Seperti menu pindah mode dan profil login user\r\n5. saat masuk lewat link url frontend yang di terminal, tampilannya langsung menuju ke beranda administrator bukan sebagai tamu. Apakah perlu diperbaiki atau tidak. Dan saat login sebagai administrator, masih ada menu unggah karya. Bukankah sebaiknya tidak ada? Atau diganti menu apa?\r\n6. tambahkan icon view di aksi manajemen dokumen halaman admin\r\n7. di info dokumen (menu manajemen dokumen) sebaiknya judul filenya bisa di klik dan ng link ke detail dokumen (masuk sebagai administrator)\r\n8. karena di admin ada fitur kunci akun untuk user/mahasiswa sebaiknya tambahkan juga fitur penyaringan data mahasiswa sesuai Angkatan di menu manajemen pengguna, sehingga Ketika user/ mahasiswa sudah lulus, admin tidak satu-satu melakukan penguncian akun tapi bisa juga pilih semua mahasiswa sesuai Angkatan. \r\n\r\nBantu aku untuk menyelesaikan semuanya secara bertahap dan runtu. Bisakah kita merealisasikan semuanya? Kita mulai dari mana dulu\r\n', 'uploads/1778265983192-44246209.png', NULL),
(5, 'Rancang Bangun Absensi RFID', 'Rosalia Indah Dwi Putriningsih', 'ttewokdsjdlskiwlkdmgfuiepqoiwepkd', 'Laporan Magang', 'D3 Teknik Informatika', 2026, 'uploads/1779167910323-867339779.pdf', NULL, 1, '2026-05-19 05:18:30', 'Terbit', NULL, NULL, NULL),
(12, 'ghjkdoyetyuilk', 'khasna ', 'itrtyjhsawodksaxkja', 'Makalah', 'D3 Teknik Informatika', 2026, 'uploads/1779213396275-618742258.pdf', NULL, 1, '2026-05-19 17:56:36', 'Pending', NULL, NULL, NULL),
(13, 'rylsksjdiejsdk', 'Ilham Akhsani, M.kom', 'sdhskscdj', 'Jurnal Akademik', 'D3 Teknik Informatika', 2026, 'uploads/1779217354108-934820966.pdf', NULL, 2, '2026-05-19 19:02:34', 'Terbit', NULL, NULL, NULL),
(15, 'jihiiuo', 'Senja Nindya Falechia', 'yuujlkjklkl;', 'Tugas Akhir', 'D3 Teknik Otomotif', 2026, 'uploads/1779281289781-470300851.pdf', NULL, 0, '2026-05-20 12:48:09', 'Terbit', 'rdygoj', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `type` varchar(50) DEFAULT 'system',
  `is_read` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `title`, `description`, `type`, `is_read`, `created_at`) VALUES
(1, 'Pengguna Baru Mendaftar', 'Mahasiswa baru bergabung: Wulandari (22180043) pada prodi Teknik Otomotif.', 'user', 1, '2026-05-06 15:56:28'),
(2, 'Dokumen Dihapus', 'Dokumen berjudul \"Audit TI Era Digital\" telah dihapus secara permanen dari sistem.', 'alert', 1, '2026-05-07 00:07:20'),
(3, 'Dokumen Dihapus', 'Dokumen berjudul \"Pencatatan Pengunjung Perpustakaan Berbasis RFID\" telah dihapus secara permanen dari sistem.', 'alert', 1, '2026-05-07 00:07:24'),
(4, 'Dokumen Baru Diunggah', 'Budi Santoso baru saja mengunggah dokumen baru: \"Laporan Magang\".', 'doc', 1, '2026-05-07 00:17:27'),
(5, 'Dokumen Diterbitkan 🎉', 'Karya ilmiah \"Laporan Magang\" telah disetujui Admin dan sekarang terbit di repository publik.', 'doc', 1, '2026-05-07 00:47:06'),
(6, 'Dokumen Baru Diunggah', 'Rosalia Indah baru saja mengunggah dokumen baru: \"Cyber Security\".', 'doc', 1, '2026-05-07 07:50:10'),
(7, 'Dokumen Ditolak ❌', 'Karya ilmiah \"Cyber Security\" ditolak oleh Admin. Silakan periksa kembali kelengkapan file.', 'alert', 1, '2026-05-07 07:56:07'),
(8, 'Dokumen Dihapus', 'Dokumen berjudul \"Cyber Security\" telah dihapus secara permanen dari sistem.', 'alert', 1, '2026-05-07 07:56:20'),
(9, 'Dokumen Baru Diunggah', 'Administrator Kampus baru saja mengunggah dokumen baru: \"Ciber Security\".', 'doc', 1, '2026-05-07 07:57:24'),
(10, 'Dokumen Diterbitkan 🎉', 'Karya ilmiah \"Ciber Security\" telah disetujui Admin dan sekarang terbit di repository publik.', 'doc', 1, '2026-05-07 08:01:30'),
(11, 'Dokumen Baru Diunggah', 'Rosalia Indah baru saja mengunggah dokumen baru: \"ventilsai dan pengaturan suhu\".', 'doc', 1, '2026-05-07 08:03:32'),
(12, 'Dokumen Baru Diunggah', 'Budi Santoso baru saja mengunggah dokumen baru: \"keamanan jaringan\".', 'doc', 1, '2026-05-07 08:32:16'),
(13, 'Dokumen Baru Diunggah', 'Budi Santoso baru saja mengunggah dokumen baru: \"Audit TI Era Digital\".', 'doc', 1, '2026-05-07 08:34:23'),
(14, 'Update Status', '\"Audit TI Era Digital\" telah TERBIT!', 'doc', 1, '2026-05-07 14:51:38'),
(15, 'Dokumen Dihapus', '\"Audit TI Era Digital\" dihapus permanen.', 'alert', 1, '2026-05-07 14:53:59'),
(16, 'Dokumen Dihapus', '\"Laporan Magang\" dihapus permanen.', 'alert', 1, '2026-05-07 14:54:34'),
(17, 'Dokumen Dihapus', '\"keamanan jaringan\" dihapus permanen.', 'alert', 1, '2026-05-07 14:54:47'),
(18, 'Dokumen Dihapus', '\"ventilsai dan pengaturan suhu\" dihapus permanen.', 'alert', 1, '2026-05-07 14:54:51'),
(19, 'Dokumen Dihapus', '\"Ciber Security\" dihapus permanen.', 'alert', 1, '2026-05-07 14:54:55'),
(20, 'Dokumen Baru', 'Administrator Kampus mengunggah: \"wertyuiosdghjkl;\"', 'doc', 1, '2026-05-07 14:56:44'),
(21, 'Update Status', '\"wertyuiosdghjkl;\" telah TERBIT!', 'doc', 1, '2026-05-07 14:57:11'),
(22, 'Dokumen Baru', 'Administrator Kampus mengunggah: \"wertyuiopsd\';lkjh\"', 'doc', 1, '2026-05-07 15:04:27'),
(23, 'Update Status', '\"wertyuiopsd\';lkjh\" telah TERBIT!', 'doc', 1, '2026-05-07 15:04:33'),
(24, 'Dokumen Baru', 'Budi Santoso mengunggah: \"jkhotruifgh;hgszx \"', 'doc', 1, '2026-05-08 01:49:00'),
(25, 'Dokumen Baru', 'Administrator Kampus mengunggah: \"ertuopsdfgjkl;zxcvbnm\"', 'doc', 1, '2026-05-08 17:11:20'),
(26, 'Update Status', '\"ertuopsdfgjkl;zxcvbnm\" telah TERBIT!', 'doc', 1, '2026-05-08 17:11:29'),
(27, 'Update Status', '\"jkhotruifgh;hgszx \" DITOLAK Admin.', 'alert', 1, '2026-05-08 17:13:43'),
(28, 'Dokumen Dihapus', '\"jkhotruifgh;hgszx \" dihapus permanen.', 'alert', 1, '2026-05-08 17:13:52'),
(29, 'Dokumen Baru', 'Budi Santoso mengunggah: \"rtyuioghjkkls\"', 'doc', 1, '2026-05-08 17:22:22'),
(30, 'Update Status', '\"rtyuioghjkkls\" DITOLAK Admin.', 'alert', 1, '2026-05-08 17:24:07'),
(31, 'Update Status', '\"rtyuioghjkkls\" perlu REVISI: reyijkjsdfghjkkjg', 'alert', 1, '2026-05-08 17:51:52'),
(32, 'Update Status', '\"rtyuioghjkkls\" perlu REVISI: jhghjklhjkl;lk', 'alert', 1, '2026-05-08 17:55:29'),
(33, 'Update Status', '\"rtyuioghjkkls\" perlu REVISI: Sejauh ini kita menggarap proyek, ada banyak hal yang aku amati sebagai pengembangan lebih lanjut\n1. size file upload sesuai kategori dokumen, untuk meminimalkan ruang penyimpanan \n2. tidak bisa tangkap layer saat lihat file document\n3. fitur lonceng notif belum aktif, belum menampilkan pesan. Sepertinya sebelumnya kia sudah buat, bantu cek \n4. responsive tapi saat pindah tampilan device misalnya ke xr ada bagian menu di navbar yang hilang. Seperti menu pindah mode dan profil login user\n5. saat masuk lewat link url frontend yang di terminal, tampilannya langsung menuju ke beranda administrator bukan sebagai tamu. Apakah perlu diperbaiki atau tidak. Dan saat login sebagai administrator, masih ada menu unggah karya. Bukankah sebaiknya tidak ada? Atau diganti menu apa?\n6. tambahkan icon view di aksi manajemen dokumen halaman admin\n7. di info dokumen (menu manajemen dokumen) sebaiknya judul filenya bisa di klik dan ng link ke detail dokumen (masuk sebagai administrator)\n8. karena di admin ada fitur kunci akun untuk user/mahasiswa sebaiknya tambahkan juga fitur penyaringan data mahasiswa sesuai Angkatan di menu manajemen pengguna, sehingga Ketika user/ mahasiswa sudah lulus, admin tidak satu-satu melakukan penguncian akun tapi bisa juga pilih semua mahasiswa sesuai Angkatan. \n\nBantu aku untuk menyelesaikan semuanya secara bertahap dan runtu. Bisakah kita merealisasikan semuanya? Kita mulai dari mana dulu\n', 'alert', 1, '2026-05-08 18:02:30'),
(34, 'Pengguna Baru Mendaftar', 'Mahasiswa baru bergabung: Ferdita Lusiana (23.1.9.0041) pada prodi Teknik Informatika.', 'user', 1, '2026-05-13 10:04:38'),
(35, 'Pendaftar Baru', 'Mahasiswa baru mendaftar mandiri: Rosalia Indah (23.1.9.0042). Menunggu persetujuan.', 'user', 1, '2026-05-13 11:35:35'),
(36, 'Pendaftar Baru', 'Mahasiswa baru mendaftar mandiri: alfiah (23190009). Menunggu persetujuan.', 'user', 1, '2026-05-13 11:36:16'),
(37, 'Pendaftar Baru', 'Mahasiswa baru mendaftar mandiri: alfiah (23.1.9.0009). Menunggu persetujuan.', 'user', 1, '2026-05-13 11:50:56'),
(38, 'Pendaftar Baru', 'Mahasiswa baru mendaftar mandiri: Nisrina Salwa (23.1.9.0027). Menunggu persetujuan.', 'user', 1, '2026-05-13 12:34:05'),
(39, 'Pendaftar Baru', 'Mahasiswa baru mendaftar mandiri: Alfiah (23.1.9.0009). Menunggu persetujuan.', 'user', 1, '2026-05-14 05:45:53'),
(40, 'Pendaftar Baru', 'Mahasiswa baru mendaftar mandiri: Adelia (23.1.9.0059). Menunggu persetujuan.', 'user', 1, '2026-05-14 06:42:32'),
(41, 'Pendaftar Baru', 'Mahasiswa baru mendaftar mandiri: Adelia (23.1.9.0058). Menunggu persetujuan.', 'user', 1, '2026-05-14 06:43:22'),
(42, 'Pendaftar Baru', 'Mahasiswa baru mendaftar mandiri: Fithrotunnisa (23.1.9.0055). Menunggu persetujuan.', 'user', 1, '2026-05-14 06:53:07'),
(43, 'Pendaftar Baru', 'Mahasiswa baru mendaftar mandiri: Salwa (23.1.9.0001). Menunggu persetujuan.', 'user', 1, '2026-05-14 06:53:49'),
(44, 'Pendaftar Baru', 'Mahasiswa baru mendaftar mandiri: Jihaan (23.1.9.0002). Menunggu persetujuan.', 'user', 1, '2026-05-14 06:54:53'),
(45, 'Pendaftar Baru', 'Mahasiswa baru mendaftar mandiri: Tegar Aries (23.1.9.0004). Menunggu persetujuan.', 'user', 1, '2026-05-14 07:39:38'),
(46, 'Pendaftar Baru', 'Mahasiswa baru mendaftar mandiri: Fadhlan Arrazi (22.1.8.0054). Menunggu persetujuan.', 'user', 1, '2026-05-14 07:41:34'),
(47, 'Pendaftar Baru', 'Mahasiswa baru mendaftar mandiri: Deajeng Salwa (23.1.9.0035). Menunggu persetujuan.', 'user', 1, '2026-05-14 08:37:43'),
(48, 'Pendaftar Baru', 'Mahasiswa baru mendaftar mandiri: Azzah (22.1.8.0056). Menunggu persetujuan.', 'user', 1, '2026-05-14 08:38:48'),
(49, 'Pendaftar Baru', 'Mahasiswa baru mendaftar mandiri: Maulana Ibrahim (23.1.9.0067). Menunggu persetujuan.', 'user', 1, '2026-05-14 09:03:54'),
(50, 'Pendaftar Baru', 'Mahasiswa baru mendaftar mandiri: Senja Nindya (21.1.9.0042). Menunggu persetujuan.', 'user', 1, '2026-05-18 11:06:47'),
(51, 'Pendaftar Baru', 'Mahasiswa baru mendaftar mandiri: Issabella (23.1.9.0038). Menunggu persetujuan.', 'user', 1, '2026-05-19 04:34:36'),
(52, 'Dokumen Baru', 'Rosalia Indah mengunggah: \"Rancang Bangun Absensi RFID\"', 'doc', 1, '2026-05-19 05:18:30'),
(53, 'Dokumen Baru', 'Rosalia Indah mengunggah: \"GSHAFGHJKKJHJK\"', 'doc', 1, '2026-05-19 05:19:02'),
(54, 'Dokumen Baru', 'Rosalia Indah mengunggah: \"KKYDGJ\"', 'doc', 1, '2026-05-19 05:23:43'),
(55, 'Dokumen Baru', 'Rosalia Indah mengunggah: \"sghdjksjhdils\"', 'doc', 1, '2026-05-19 11:43:23'),
(56, 'Dokumen Baru', 'Rosalia Indah mengunggah: \"ajsldsdjd\"', 'doc', 1, '2026-05-19 11:46:23'),
(57, 'Dokumen Baru', 'Ilham Akhsani, M.kom mengunggah: \"iuystyk\"', 'doc', 1, '2026-05-19 12:45:33'),
(58, 'Dokumen Baru', 'Senja Nindya mengunggah: \"rtywedsjkl;ertydkh\"', 'doc', 1, '2026-05-19 17:50:29'),
(59, 'Dokumen Dihapus', '\"KKYDGJ\" dihapus permanen.', 'alert', 1, '2026-05-19 17:51:52'),
(60, 'Dokumen Dihapus', '\"ajsldsdjd\" dihapus permanen.', 'alert', 1, '2026-05-19 17:52:32'),
(61, 'Dokumen Dihapus', '\"GSHAFGHJKKJHJK\" dihapus permanen.', 'alert', 1, '2026-05-19 17:52:37'),
(62, 'Dokumen Dihapus', '\"ertuopsdfgjkl;zxcvbnm\" dihapus permanen.', 'alert', 1, '2026-05-19 17:54:03'),
(63, 'Dokumen Dihapus', '\"wertyuiopsd\';lkjh\" dihapus permanen.', 'alert', 1, '2026-05-19 17:54:07'),
(64, 'Dokumen Baru', 'khasna  mengunggah: \"ghjkdoyetyuilk\"', 'doc', 1, '2026-05-19 17:56:36'),
(65, 'Dokumen Dihapus', '\"iuystyk\" dihapus permanen.', 'alert', 1, '2026-05-19 19:01:39'),
(66, 'Dokumen Baru', 'Ilham Akhsani, M.kom mengunggah: \"rylsksjdiejsdk\"', 'doc', 1, '2026-05-19 19:02:34'),
(67, 'Dokumen Dihapus', '\"rtywedsjkl;ertydkh\" dihapus permanen.', 'alert', 1, '2026-05-19 19:20:27'),
(68, 'Dokumen Baru', 'Senja Nindya Falechia mengunggah: \"rjhfyhjyi\"', 'doc', 1, '2026-05-19 19:21:03'),
(69, 'Dokumen Dihapus', '\"sghdjksjhdils\" dihapus permanen.', 'alert', 1, '2026-05-19 19:25:04'),
(70, 'Pendaftar Baru', 'Mahasiswa baru mendaftar mandiri: Diajeng Salwa (23.1.9.0024). Menunggu persetujuan.', 'user', 1, '2026-05-20 03:27:53'),
(71, 'Status Dokumen', 'Status dokumen \"rjhfyhjyijhj\" diubah menjadi Ditolak', 'doc', 1, '2026-05-20 12:28:10'),
(72, 'Status Dokumen', 'Status dokumen \"rjhfyhjyijhj\" diubah menjadi Ditolak', 'doc', 1, '2026-05-20 12:30:12'),
(73, 'Revisi Dokumen', 'Senja Nindya Falechia baru saja mengirimkan revisi teks: \"rjhfyhjyijhj\"', 'doc', 1, '2026-05-20 12:36:24'),
(74, 'Revisi Dokumen', 'Senja Nindya Falechia baru saja mengirimkan revisi teks: \"rjhfyhjyijhjdf\"', 'doc', 1, '2026-05-20 12:42:16'),
(75, 'Revisi Dokumen', 'Senja Nindya Falechia baru saja mengirimkan revisi teks: \"rjhfyhjyijhjdf\"', 'doc', 1, '2026-05-20 12:43:11'),
(76, 'Revisi Dokumen', 'Senja Nindya Falechia baru saja mengirimkan revisi teks: \"rjhfyhjyijhjdf\"', 'doc', 0, '2026-05-20 12:44:02'),
(77, 'Dokumen Dihapus', '\"rjhfyhjyijhjdf\" dihapus permanen.', 'alert', 0, '2026-05-20 12:47:25'),
(78, 'Dokumen Baru', 'Senja Nindya Falechia mengunggah: \"jihiiuo\"', 'doc', 0, '2026-05-20 12:48:09'),
(79, 'Revisi Dokumen', 'Senja Nindya Falechia baru saja mengirimkan revisi teks: \"jihiiuo\"', 'doc', 0, '2026-05-20 12:49:11');

-- --------------------------------------------------------

--
-- Table structure for table `system_logs`
--

CREATE TABLE `system_logs` (
  `id` int NOT NULL,
  `type` varchar(50) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `system_logs`
--

INSERT INTO `system_logs` (`id`, `type`, `user_name`, `description`, `ip_address`, `created_at`) VALUES
(1, 'login_success', 'Administrator Kampus', 'Login Berhasil', '::1', '2026-05-06 07:17:04'),
(2, 'login_success', 'Administrator Kampus', 'Login Berhasil', '::1', '2026-05-06 11:10:29'),
(3, 'login_success', 'Budi Santoso', 'Login Berhasil', '::1', '2026-05-06 11:10:58'),
(4, 'login_failed', 'mhs001', 'Mencoba login saat akun ditangguhkan', '::1', '2026-05-06 11:16:09'),
(5, 'login_success', 'Budi Santoso', 'Login Berhasil', '::1', '2026-05-06 11:18:44'),
(6, 'login_success', 'Administrator Kampus', 'Login Berhasil', '::1', '2026-05-06 11:36:24'),
(7, 'login_success', 'Budi Santoso', 'Login Berhasil', '::1', '2026-05-06 11:41:27'),
(8, 'login_failed', 'Administrator Kampus', 'Gagal Login (Password salah)', '::1', '2026-05-06 11:54:56'),
(9, 'login_success', 'Administrator Kampus', 'Login Berhasil', '::1', '2026-05-06 11:55:10'),
(10, 'login_success', 'Budi Santoso', 'Login Berhasil', '::1', '2026-05-06 12:49:29'),
(11, 'login_success', 'Administrator Kampus', 'Login Berhasil', '::1', '2026-05-06 12:51:41'),
(12, 'login_success', 'Budi Santoso', 'Login Berhasil', '::1', '2026-05-06 13:04:23'),
(13, 'login_failed', 'snsmx, ,', 'Gagal Login (Username tidak terdaftar)', '::1', '2026-05-06 13:07:21'),
(14, 'login_failed', 'Administrator Kampus', 'Gagal Login (Password salah)', '::1', '2026-05-06 13:07:29'),
(15, 'login_failed', 'sjdajsdjj', 'Gagal Login (Username tidak terdaftar)', '::1', '2026-05-06 13:08:01'),
(16, 'login_success', 'Administrator Kampus', 'Login Berhasil', '::1', '2026-05-06 13:10:48'),
(17, 'login_failed', 'Budi Santoso', 'Gagal Login (Password salah)', '::1', '2026-05-06 13:11:35'),
(18, 'login_success', 'Budi Santoso', 'Login Berhasil', '::1', '2026-05-06 13:11:43'),
(19, 'login_success', 'Administrator Kampus', 'Login Berhasil', '::1', '2026-05-06 13:19:41'),
(20, 'login_success', 'Budi Santoso', 'Login Berhasil', '::1', '2026-05-06 14:32:23'),
(21, 'login_failed', 'Administrator Kampus', 'Gagal Login (Password salah)', '::1', '2026-05-06 15:12:06'),
(22, 'login_success', 'Administrator Kampus', 'Login Berhasil', '::1', '2026-05-06 15:12:28'),
(23, 'login_success', 'Budi Santoso', 'Login Berhasil', '::1', '2026-05-06 15:14:54'),
(24, 'login_failed', 'Administrator Kampus', 'Gagal Login (Password salah)', '::1', '2026-05-06 15:19:38'),
(25, 'login_failed', 'Administrator Kampus', 'Gagal Login (Password salah)', '::1', '2026-05-06 15:19:52'),
(26, 'login_success', 'Administrator Kampus', 'Login Berhasil', '::1', '2026-05-06 15:20:10'),
(27, 'login_failed', 'wulandari', 'Gagal Login (Username tidak terdaftar)', '::1', '2026-05-06 15:39:41'),
(28, 'login_success', 'Administrator Kampus', 'Login Berhasil', '::1', '2026-05-06 15:42:16'),
(29, 'register', 'Wulandari', 'Mendaftar akun baru: 22180043', '::1', '2026-05-06 15:56:28'),
(30, 'login_success', 'Budi Santoso', 'Login Berhasil', '::1', '2026-05-07 00:10:16'),
(31, 'login_success', 'Administrator Kampus', 'Login Berhasil', '::1', '2026-05-07 00:46:58'),
(32, 'login_success', 'Rosalia Indah', 'Login Berhasil', '::1', '2026-05-07 07:47:59'),
(33, 'login_success', 'Administrator Kampus', 'Login Berhasil', '::1', '2026-05-07 07:55:29'),
(34, 'login_success', 'Rosalia Indah', 'Login Berhasil', '::1', '2026-05-07 08:02:38'),
(35, 'login_success', 'Administrator Kampus', 'Login Berhasil', '::1', '2026-05-07 08:14:42'),
(36, 'login_success', 'Budi Santoso', 'Login Berhasil', '::1', '2026-05-07 08:30:58'),
(37, 'login_failed', 'Administrator Kampus', 'Gagal Login (Password salah)', '::1', '2026-05-07 08:41:56'),
(38, 'login_success', 'Administrator Kampus', 'Login Berhasil', '::1', '2026-05-07 08:42:09'),
(39, 'login_success', 'Administrator Kampus', 'Login Berhasil', '::1', '2026-05-07 10:03:10'),
(40, 'login_failed', 'Rosalia Indah', 'Gagal Login (Password salah)', '::1', '2026-05-07 10:03:57'),
(41, 'login_failed', 'Rosalia Indah', 'Gagal Login (Password salah)', '::1', '2026-05-07 10:04:21'),
(42, 'login_failed', 'Rosalia Indah', 'Gagal Login (Password salah)', '::1', '2026-05-07 10:08:24'),
(43, 'login_failed', 'Rosalia Indah', 'Gagal Login (Password salah)', '::1', '2026-05-07 10:08:46'),
(44, 'login_failed', 'Rosalia Indah', 'Gagal Login (Password salah)', '::1', '2026-05-07 10:10:41'),
(45, 'login_failed', 'Rosalia Indah', 'Gagal Login (Password salah)', '::1', '2026-05-07 10:11:38'),
(46, 'login_failed', 'Rosalia Indah', 'Gagal Login (Password salah)', '::1', '2026-05-07 10:11:56'),
(47, 'login_success', 'Rosalia Indah', 'Login Berhasil', '::1', '2026-05-07 10:15:39'),
(48, 'login_failed', 'Rosalia Indah', 'Gagal Login (Password salah)', '::1', '2026-05-07 10:26:12'),
(49, 'login_success', 'Rosalia Indah', 'Login Berhasil', '::1', '2026-05-07 10:26:22'),
(50, 'login_success', 'Rosalia Indah', 'Login Berhasil', '::1', '2026-05-07 10:28:14'),
(51, 'change_password', 'Rosalia Indah', 'Pengguna mengubah kata sandinya sendiri', '::1', '2026-05-07 12:56:53'),
(52, 'login_failed', 'mhs123', 'Gagal Login (Username tidak terdaftar)', '::1', '2026-05-07 13:13:08'),
(53, 'login_success', 'Budi Santoso', 'Login Berhasil', '::1', '2026-05-07 13:13:15'),
(54, 'login_success', 'Administrator Kampus', 'Login Berhasil', '::1', '2026-05-07 13:15:15'),
(55, 'login_success', 'Administrator Kampus', 'Login Berhasil', '::1', '2026-05-07 14:24:00'),
(56, 'login_success', 'Budi Santoso', 'Login Berhasil', '::1', '2026-05-07 14:33:25'),
(57, 'login_success', 'Administrator Kampus', 'Login Berhasil', '::1', '2026-05-07 14:38:23'),
(58, 'login_success', 'Budi Santoso', 'Login Berhasil', '::1', '2026-05-07 14:50:09'),
(59, 'login_failed', 'admin123', 'Gagal Login (Username tidak terdaftar)', '::1', '2026-05-07 14:51:15'),
(60, 'login_success', 'Administrator Kampus', 'Login Berhasil', '::1', '2026-05-07 14:51:27'),
(61, 'login_success', 'Administrator Kampus', 'Login Berhasil', '::1', '2026-05-08 00:49:10'),
(62, 'login_success', 'Budi Santoso', 'Login Berhasil', '::1', '2026-05-08 01:41:07'),
(63, 'login_success', 'Budi Santoso', 'Login Berhasil', '::1', '2026-05-08 01:46:43'),
(64, 'login_success', 'Administrator Kampus', 'Login Berhasil', '::1', '2026-05-08 01:53:29'),
(65, 'login_success', 'Budi Santoso', 'Login Berhasil', '::1', '2026-05-08 17:20:12'),
(66, 'login_success', 'Administrator Kampus', 'Login Berhasil', '::1', '2026-05-08 17:23:58'),
(67, 'login_success', 'Budi Santoso', 'Login Berhasil', '::1', '2026-05-08 17:24:28'),
(68, 'login_success', 'Administrator Kampus', 'Login Berhasil', '::1', '2026-05-08 17:44:42'),
(69, 'login_success', 'Budi Santoso', 'Login Berhasil', '::1', '2026-05-08 17:52:53'),
(70, 'login_success', 'Budi Santoso', 'Login Berhasil', '::1', '2026-05-13 03:00:57'),
(71, 'login_failed', 'mhs', 'Gagal Login (Username tidak terdaftar)', '::1', '2026-05-13 03:25:46'),
(72, 'login_failed', 'Budi Santoso', 'Gagal Login (Password salah)', '::1', '2026-05-13 03:26:00'),
(73, 'login_failed', 'Budi Santoso', 'Gagal Login (Password salah)', '::1', '2026-05-13 03:26:23'),
(74, 'login_success', 'Budi Santoso', 'Login Berhasil', '::1', '2026-05-13 03:27:41'),
(75, 'login_success', 'Administrator Kampus', 'Login Berhasil', '::1', '2026-05-13 10:01:25'),
(76, 'login_success', 'Rosalia Indah', 'Login Berhasil', '::1', '2026-05-13 10:03:12'),
(77, 'login_failed', '23.1.9.0042', 'Gagal Login (Username tidak terdaftar)', '::1', '2026-05-13 10:03:45'),
(78, 'register', 'Ferdita Lusiana', 'Mendaftar akun baru: 23.1.9.0041', '::1', '2026-05-13 10:04:38'),
(79, 'register', 'Rosalia Indah', 'Pendaftaran mandiri (Pending): 23.1.9.0042', '::1', '2026-05-13 11:35:35'),
(80, 'register', 'alfiah', 'Pendaftaran mandiri (Pending): 23190009', '::1', '2026-05-13 11:36:16'),
(81, 'register', 'alfiah', 'Pendaftaran mandiri (Pending): 23.1.9.0009', '::1', '2026-05-13 11:50:56'),
(82, 'register', 'Nisrina Salwa', 'Pendaftaran mandiri (Pending): 23.1.9.0027', '::1', '2026-05-13 12:34:05'),
(83, 'login_success', 'Rosalia Indah', 'Login Berhasil', '::1', '2026-05-13 12:45:57'),
(84, 'register', 'Alfiah', 'Pendaftaran mandiri (Pending): 23.1.9.0009', '::1', '2026-05-14 05:45:53'),
(85, 'login_success', 'Alfiah', 'Login Berhasil', '::1', '2026-05-14 05:47:13'),
(86, 'login_success', 'Ilham Akhsani, M.kom', 'Login Berhasil', '::1', '2026-05-14 05:50:53'),
(87, 'login_success', 'Ilham Akhsani, M.kom', 'Login Berhasil', '::1', '2026-05-14 05:55:59'),
(88, 'register', 'Adelia', 'Pendaftaran mandiri (Pending): 23.1.9.0059', '::1', '2026-05-14 06:42:32'),
(89, 'register', 'Adelia', 'Pendaftaran mandiri (Pending): 23.1.9.0058', '::1', '2026-05-14 06:43:23'),
(90, 'register', 'Fithrotunnisa', 'Pendaftaran mandiri (Pending): 23.1.9.0055', '::1', '2026-05-14 06:53:07'),
(91, 'register', 'Salwa', 'Pendaftaran mandiri (Pending): 23.1.9.0001', '::1', '2026-05-14 06:53:49'),
(92, 'register', 'Jihaan', 'Pendaftaran mandiri (Pending): 23.1.9.0002', '::1', '2026-05-14 06:54:53'),
(93, 'register', 'Tegar Aries', 'Pendaftaran mandiri (Pending): 23.1.9.0004', '::1', '2026-05-14 07:39:38'),
(94, 'register', 'Fadhlan Arrazi', 'Pendaftaran mandiri (Pending): 22.1.8.0054', '::1', '2026-05-14 07:41:34'),
(95, 'register', 'Deajeng Salwa', 'Pendaftaran mandiri (Pending): 23.1.9.0035', '::1', '2026-05-14 08:37:43'),
(96, 'register', 'Azzah', 'Pendaftaran mandiri (Pending): 22.1.8.0056', '::1', '2026-05-14 08:38:48'),
(97, 'register', 'Maulana Ibrahim', 'Pendaftaran mandiri (Pending): 23.1.9.0067', '::1', '2026-05-14 09:03:54'),
(98, 'import_excel', 'Administrator', 'Mengimport 8 mahasiswa baru via Excel', '::1', '2026-05-14 09:09:35'),
(99, 'import_excel', 'Administrator', 'Mengimport 1 mahasiswa baru via Excel', '::1', '2026-05-14 09:30:55'),
(100, 'login_success', 'Ilham Akhsani, M.kom', 'Login Berhasil', '::1', '2026-05-14 11:11:03'),
(101, 'login_success', 'Budi Santoso', 'Login Berhasil', '::1', '2026-05-15 13:37:42'),
(102, 'login_success', 'Budi Santoso', 'Login Berhasil', '::1', '2026-05-15 14:03:52'),
(103, 'login_success', 'Teguh Iman', 'Login Berhasil', '::1', '2026-05-15 14:10:08'),
(104, 'register', 'Senja Nindya', 'Pendaftaran mandiri (Pending): 21.1.9.0042', '::1', '2026-05-18 11:06:47'),
(105, 'login_success', 'Administrator Kampus', 'Login Berhasil', '::1', '2026-05-18 11:07:24'),
(106, 'login_success', 'Senja Nindya', 'Login Berhasil', '::1', '2026-05-18 11:08:16'),
(107, 'reset_password', 'Senja Nindya', 'Reset sandi berhasil via Email', '::1', '2026-05-18 11:18:59'),
(108, 'login_success', 'Senja Nindya', 'Login Berhasil', '::1', '2026-05-18 11:21:56'),
(109, 'login_success', 'Administrator Kampus', 'Login Berhasil', '::1', '2026-05-18 12:06:49'),
(110, 'login_success', 'Teguh Iman', 'Login Berhasil', '::1', '2026-05-18 12:13:54'),
(111, 'login_success', 'Administrator Kampus', 'Login Berhasil', '::1', '2026-05-18 13:56:51'),
(112, 'login_success', 'Ferdita Lusiana', 'Login Berhasil', '::1', '2026-05-18 14:08:06'),
(113, 'login_success', 'Ilham Akhsani, M.kom', 'Login Berhasil', '::1', '2026-05-18 14:24:51'),
(114, 'login_success', 'Administrator Kampus', 'Login Berhasil', '::1', '2026-05-18 15:34:12'),
(115, 'login_success', 'Rosalia Indah', 'Login Berhasil', '::1', '2026-05-18 16:51:36'),
(116, 'login_success', 'Ilham Akhsani, M.kom', 'Login Berhasil', '::1', '2026-05-18 17:31:54'),
(117, 'register', 'Issabella', 'Pendaftaran mandiri (Pending): 23.1.9.0038', '::1', '2026-05-19 04:34:36'),
(118, 'login_success', 'Administrator Kampus', 'Login Berhasil', '::1', '2026-05-19 04:34:58'),
(119, 'login_success', 'Rosalia Indah', 'Login Berhasil', '::1', '2026-05-19 05:16:55'),
(120, 'login_success', 'Ilham Akhsani, M.kom', 'Login Berhasil', '::1', '2026-05-19 12:44:40'),
(121, 'login_success', 'Ilham Akhsani, M.kom', 'Login Berhasil', '::1', '2026-05-19 12:57:43'),
(122, 'login_success', 'Ilham Akhsani, M.kom', 'Login Berhasil', '::1', '2026-05-19 12:58:07'),
(123, 'login_success', 'Ilham Akhsani, M.kom', 'Login Berhasil', '::1', '2026-05-19 12:58:37'),
(124, 'login_success', 'Rosalia Indah', 'Login Berhasil', '::1', '2026-05-19 13:05:51'),
(125, 'login_success', 'Rosalia Indah', 'Login Berhasil', '::1', '2026-05-19 16:43:05'),
(126, 'login_success', 'Ilham Akhsani, M.kom', 'Login Berhasil', '::1', '2026-05-19 16:43:50'),
(127, 'login_success', 'Ilham Akhsani, M.kom', 'Login Berhasil', '::1', '2026-05-19 16:45:17'),
(128, 'login_success', 'Rosalia Indah Dwi Putriningsih', 'Login Berhasil', '::1', '2026-05-19 16:54:01'),
(129, 'reset_password', 'Senja Nindya', 'Reset sandi berhasil via Email', '::1', '2026-05-19 17:02:41'),
(130, 'login_success', 'Ilham Akhsani, M.kom', 'Login Berhasil', '::1', '2026-05-19 17:38:41'),
(131, 'login_success', 'Rosalia Indah Dwi Putriningsih', 'Login Berhasil', '::1', '2026-05-19 17:42:12'),
(132, 'login_success', 'Senja Nindya', 'Login Berhasil', '::1', '2026-05-19 17:48:23'),
(133, 'login_success', 'Ilham Akhsani, M.kom', 'Login Berhasil', '::1', '2026-05-19 19:01:02'),
(134, 'login_success', 'Senja Nindya Falechia', 'Login Berhasil', '::1', '2026-05-19 19:16:04'),
(135, 'reset_password', 'Senja Nindya Falechia', 'Reset sandi berhasil via Email', '::1', '2026-05-19 19:58:04'),
(136, 'login_success', 'Senja Nindya Falechia', 'Login Berhasil', '::1', '2026-05-19 19:58:21'),
(137, 'login_success', 'Administrator Kampus', 'Login Berhasil', '::1', '2026-05-19 20:05:01'),
(138, 'login_success', 'Senja Nindya Falechia', 'Login Berhasil', '::1', '2026-05-19 20:05:35'),
(139, 'register', 'Diajeng Salwa', 'Pendaftaran mandiri (Pending): 23.1.9.0024', '::1', '2026-05-20 03:27:53'),
(140, 'login_success', 'Senja Nindya Falechia', 'Login Berhasil', '::1', '2026-05-20 04:13:11'),
(141, 'login_success', 'Administrator Kampus', 'Login Berhasil', '::1', '2026-05-20 12:02:13'),
(142, 'login_success', 'Administrator Kampus', 'Login Berhasil', '::1', '2026-05-20 12:09:58');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'user',
  `full_name` varchar(100) NOT NULL,
  `nim` varchar(50) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `is_locked` tinyint(1) DEFAULT '0',
  `approval_status` enum('pending','approved','rejected') DEFAULT 'approved',
  `reset_token` varchar(255) DEFAULT NULL,
  `reset_expires` datetime DEFAULT NULL,
  `no_wa` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`, `full_name`, `nim`, `email`, `tanggal_lahir`, `department`, `created_at`, `is_locked`, `approval_status`, `reset_token`, `reset_expires`, `no_wa`) VALUES
(1, 'admin1', '$2b$10$0NIy0nuKRjwfj9BswjcrMu7uTbuWRG6hq7MyspieUQX2Jv/QsilIm', 'admin', 'Administrator Kampus', NULL, 'rosaliaindah236@gmail.com', NULL, 'Pusat', '2026-04-30 09:25:38', 0, 'approved', NULL, NULL, NULL),
(2, 'mhs001', '$2b$10$0NIy0nuKRjwfj9BswjcrMu7uTbuWRG6hq7MyspieUQX2Jv/QsilIm', 'user', 'Budi Santoso', 'mhs001', NULL, NULL, 'D3 Teknik Otomotif', '2026-04-30 09:25:38', 0, 'approved', NULL, NULL, NULL),
(4, 'ilhamakhsani@gmail.com', '$2b$10$bE5Ftsww0XRevJIX4m3ZYucgiDk338ZmdfEddrEAPmxW.3cKaDViS', 'dosen', 'Ilham Akhsani, M.kom', 'ilhamakhsani@gmail.com', NULL, NULL, 'D3 Teknik Informatika', '2026-05-04 01:28:16', 0, 'approved', NULL, NULL, NULL),
(6, '23.1.9.0041', '$2b$10$0Ukr2J2ggWHl56VSlHJtIONGQOkVmmxuXtadhOujsYz19WIYfkBrS', 'user', 'Ferdita Lusiana', '23.1.9.0041', 'lusianaferdita@gmail.com', NULL, 'D3 Teknik Informatika', '2026-05-13 10:04:38', 0, 'approved', NULL, NULL, NULL),
(7, '23.1.9.0042', '$2b$10$n8Iz6.Ocfxny/T4z99ADAOdHn80/i85O3Jo3Bl/i8HimUIB189Vzq', 'user', 'Rosalia Indah Dwi Putriningsih', '23.1.9.0042', NULL, NULL, 'D3 Teknik Informatika', '2026-05-13 11:35:35', 0, 'approved', NULL, NULL, NULL),
(10, '23.1.9.0027', '$2b$10$3MUguFh7jErwq/2qz.UuOOL5hHgPq6Wzz2.CLcdGx.ctoqlrzZeLu', 'user', 'Nisrina Salwa', '23.1.9.0027', NULL, NULL, 'D3 Teknik Informatika', '2026-05-13 12:34:05', 0, 'approved', NULL, NULL, NULL),
(11, '23.1.9.0009', '$2b$10$oEB/A4WO/Ry.XSM4fz2fUuLwkoSeyhObjAjm/y1sRHm0jdswWYe3i', 'user', 'Alfiah', '23.1.9.0009', NULL, '2004-01-01', 'D3 Teknik Informatika', '2026-05-14 05:45:53', 0, 'approved', NULL, NULL, NULL),
(42, 'admin2', '$2b$10$lUutM/OC0Mn89cF83U5/COjwTW/qZplvZoWNR241aoFhntW/Mw5Fa', 'admin', 'Teguh Iman', '23.1.9.0060', NULL, '0000-00-00', 'Pusat', '2026-05-14 09:30:55', 0, 'approved', NULL, NULL, NULL),
(43, '21.1.9.0042', '$2b$10$F9/wjSsmrQoZnt13b28hXuDVOs7u2W3pTkunRGE79aQp7jU6hI9Bm', 'user', 'Senja Nindya Falechia', '21.1.9.0042', 'senjanindya5@gmail.com', '2003-01-20', 'D3 Teknik Otomotif', '2026-05-18 11:06:47', 0, 'approved', NULL, NULL, '085640738893'),
(44, '23.1.9.0038', '$2b$10$WY82eRrrO7WQYwhJPrWncu7WkdATG07tHkz16jgbizVGK7zPc3l6K', 'user', 'Issabella', '23.1.9.0038', 'issabella123@gmail.com', '2001-01-01', 'D3 Teknik Elektronika', '2026-05-19 04:34:36', 0, 'approved', NULL, NULL, NULL),
(45, '23.1.9.0024', '$2b$10$hRckvPoNygU4/KGBGoBRku8i/lUjqVjZ7R3XzGVjTPUnx.tgtt632', 'user', 'Diajeng Salwa', '23.1.9.0024', 'dsalwaan@gmail.com', '2006-05-02', 'Teknik Informatika', '2026-05-20 03:27:53', 0, 'approved', '59fa4db4b0f0dece566c58f557e9360c26878e8c15cb668c64d878fb25e8aaa1', '2026-05-20 10:44:33', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_logs`
--
ALTER TABLE `system_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `system_logs`
--
ALTER TABLE `system_logs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=143;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
