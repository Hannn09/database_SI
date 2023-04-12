-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 12 Apr 2023 pada 08.38
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `spk_beasiswa`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `username` varchar(10) NOT NULL,
  `password` varchar(10) NOT NULL,
  `id_level` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_alternatif_mahasiswa`
--

CREATE TABLE `tb_alternatif_mahasiswa` (
  `nim` varchar(8) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `no_hp` varchar(15) NOT NULL,
  `program_studi` varchar(25) NOT NULL,
  `gender` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_berkas`
--

CREATE TABLE `tb_berkas` (
  `id_berkas` int(11) NOT NULL,
  `nim` varchar(8) NOT NULL,
  `file_kk` varchar(200) NOT NULL,
  `file_ktp` varchar(200) NOT NULL,
  `file_kip` varchar(200) NOT NULL,
  `file_foto` varchar(200) NOT NULL,
  `file_khs` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_kriteria`
--

CREATE TABLE `tb_kriteria` (
  `id_kriteria` int(11) NOT NULL,
  `nama_kriteria` varchar(50) NOT NULL,
  `bobot` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_kriteria_pendapatan_ortu`
--

CREATE TABLE `tb_kriteria_pendapatan_ortu` (
  `id_kriteria_pendapatan_ortu` int(11) NOT NULL,
  `id_kriteria` int(11) NOT NULL,
  `keterangan_pendapatan` varchar(20) NOT NULL,
  `nilai_pendapatan_ortu` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_kriteria_pendidikan_ortu`
--

CREATE TABLE `tb_kriteria_pendidikan_ortu` (
  `id_kriteria_pendidikan_ortu` int(11) NOT NULL,
  `id_kriteria` int(11) NOT NULL,
  `keterangan_pendidikan` varchar(20) NOT NULL,
  `nilai_pendidikan_ortu` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_kriteria_tanggungan_ortu`
--

CREATE TABLE `tb_kriteria_tanggungan_ortu` (
  `id_kriteria_tanggungan_ortu` int(11) NOT NULL,
  `id_kriteria` int(11) NOT NULL,
  `keterangan_pendapatan` varchar(20) NOT NULL,
  `nilai_tanggungan` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_level`
--

CREATE TABLE `tb_level` (
  `id_level` int(11) NOT NULL,
  `nama_level` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_ortu`
--

CREATE TABLE `tb_ortu` (
  `id_ortu` int(11) NOT NULL,
  `nim` varchar(8) NOT NULL,
  `nama_ayah` varchar(20) NOT NULL,
  `nama_ibu` varchar(20) NOT NULL,
  `pekerjaan_ayah` varchar(50) NOT NULL,
  `pekerjaan_ibu` varchar(50) NOT NULL,
  `no_hp_ortu` varchar(15) NOT NULL,
  `pendidikan_ayah` varchar(6) NOT NULL,
  `pendidikan_ibu` varchar(6) NOT NULL,
  `gaji_ayah` int(11) NOT NULL,
  `gaji_ibu` int(11) NOT NULL,
  `jumlah_tanggungan` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_penilaian`
--

CREATE TABLE `tb_penilaian` (
  `id_penilaian` int(11) NOT NULL,
  `id_ortu` int(11) NOT NULL,
  `id_berkas` int(11) NOT NULL,
  `id_kriteria` int(11) NOT NULL,
  `nilai_keterangan_berkas` int(11) NOT NULL,
  `nilai_keterangan_pendapatan` int(11) NOT NULL,
  `nilai_keterangan_pendidikan` int(11) NOT NULL,
  `nilai_keterangan_tanggungan` int(11) NOT NULL,
  `total_nilai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nim` varchar(8) NOT NULL,
  `password` varchar(10) NOT NULL,
  `id_level` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`),
  ADD KEY `id_level` (`id_level`);

--
-- Indeks untuk tabel `tb_alternatif_mahasiswa`
--
ALTER TABLE `tb_alternatif_mahasiswa`
  ADD PRIMARY KEY (`nim`);

--
-- Indeks untuk tabel `tb_berkas`
--
ALTER TABLE `tb_berkas`
  ADD PRIMARY KEY (`id_berkas`),
  ADD KEY `nim` (`nim`);

--
-- Indeks untuk tabel `tb_kriteria`
--
ALTER TABLE `tb_kriteria`
  ADD PRIMARY KEY (`id_kriteria`);

--
-- Indeks untuk tabel `tb_kriteria_pendapatan_ortu`
--
ALTER TABLE `tb_kriteria_pendapatan_ortu`
  ADD PRIMARY KEY (`id_kriteria_pendapatan_ortu`),
  ADD KEY `id_kriteria` (`id_kriteria`);

--
-- Indeks untuk tabel `tb_kriteria_pendidikan_ortu`
--
ALTER TABLE `tb_kriteria_pendidikan_ortu`
  ADD PRIMARY KEY (`id_kriteria_pendidikan_ortu`),
  ADD KEY `id_kriteria` (`id_kriteria`);

--
-- Indeks untuk tabel `tb_kriteria_tanggungan_ortu`
--
ALTER TABLE `tb_kriteria_tanggungan_ortu`
  ADD PRIMARY KEY (`id_kriteria_tanggungan_ortu`),
  ADD KEY `id_kriteria` (`id_kriteria`);

--
-- Indeks untuk tabel `tb_level`
--
ALTER TABLE `tb_level`
  ADD PRIMARY KEY (`id_level`);

--
-- Indeks untuk tabel `tb_ortu`
--
ALTER TABLE `tb_ortu`
  ADD PRIMARY KEY (`id_ortu`),
  ADD KEY `nim` (`nim`);

--
-- Indeks untuk tabel `tb_penilaian`
--
ALTER TABLE `tb_penilaian`
  ADD PRIMARY KEY (`id_penilaian`),
  ADD KEY `nim` (`id_ortu`),
  ADD KEY `id_berkas` (`id_berkas`),
  ADD KEY `id_kriteria` (`id_kriteria`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `id_level` (`id_level`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tb_berkas`
--
ALTER TABLE `tb_berkas`
  MODIFY `id_berkas` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tb_kriteria`
--
ALTER TABLE `tb_kriteria`
  MODIFY `id_kriteria` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tb_kriteria_pendapatan_ortu`
--
ALTER TABLE `tb_kriteria_pendapatan_ortu`
  MODIFY `id_kriteria_pendapatan_ortu` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tb_kriteria_pendidikan_ortu`
--
ALTER TABLE `tb_kriteria_pendidikan_ortu`
  MODIFY `id_kriteria_pendidikan_ortu` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tb_kriteria_tanggungan_ortu`
--
ALTER TABLE `tb_kriteria_tanggungan_ortu`
  MODIFY `id_kriteria_tanggungan_ortu` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tb_level`
--
ALTER TABLE `tb_level`
  MODIFY `id_level` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tb_ortu`
--
ALTER TABLE `tb_ortu`
  MODIFY `id_ortu` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tb_penilaian`
--
ALTER TABLE `tb_penilaian`
  MODIFY `id_penilaian` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`id_level`) REFERENCES `tb_level` (`id_level`);

--
-- Ketidakleluasaan untuk tabel `tb_berkas`
--
ALTER TABLE `tb_berkas`
  ADD CONSTRAINT `tb_berkas_ibfk_1` FOREIGN KEY (`nim`) REFERENCES `tb_alternatif_mahasiswa` (`nim`);

--
-- Ketidakleluasaan untuk tabel `tb_kriteria_pendapatan_ortu`
--
ALTER TABLE `tb_kriteria_pendapatan_ortu`
  ADD CONSTRAINT `tb_kriteria_pendapatan_ortu_ibfk_1` FOREIGN KEY (`id_kriteria`) REFERENCES `tb_kriteria` (`id_kriteria`);

--
-- Ketidakleluasaan untuk tabel `tb_kriteria_pendidikan_ortu`
--
ALTER TABLE `tb_kriteria_pendidikan_ortu`
  ADD CONSTRAINT `tb_kriteria_pendidikan_ortu_ibfk_1` FOREIGN KEY (`id_kriteria`) REFERENCES `tb_kriteria` (`id_kriteria`);

--
-- Ketidakleluasaan untuk tabel `tb_kriteria_tanggungan_ortu`
--
ALTER TABLE `tb_kriteria_tanggungan_ortu`
  ADD CONSTRAINT `tb_kriteria_tanggungan_ortu_ibfk_1` FOREIGN KEY (`id_kriteria`) REFERENCES `tb_kriteria` (`id_kriteria`);

--
-- Ketidakleluasaan untuk tabel `tb_ortu`
--
ALTER TABLE `tb_ortu`
  ADD CONSTRAINT `tb_ortu_ibfk_1` FOREIGN KEY (`nim`) REFERENCES `tb_alternatif_mahasiswa` (`nim`);

--
-- Ketidakleluasaan untuk tabel `tb_penilaian`
--
ALTER TABLE `tb_penilaian`
  ADD CONSTRAINT `tb_penilaian_ibfk_1` FOREIGN KEY (`id_ortu`) REFERENCES `tb_ortu` (`id_ortu`),
  ADD CONSTRAINT `tb_penilaian_ibfk_2` FOREIGN KEY (`id_berkas`) REFERENCES `tb_berkas` (`id_berkas`),
  ADD CONSTRAINT `tb_penilaian_ibfk_3` FOREIGN KEY (`id_kriteria`) REFERENCES `tb_kriteria` (`id_kriteria`);

--
-- Ketidakleluasaan untuk tabel `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`id_level`) REFERENCES `tb_level` (`id_level`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
