CREATE DATABASE Manajemen_Gym;
USE Manajemen_Gym;

-- Membuat tabel Member
CREATE TABLE Members (
    id_members INT(5) AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nama VARCHAR(100) NOT NULL,
    usia INT(2) NOT NULL,
    alamat VARCHAR(255) NOT NULL,
    nomor_telepon VARCHAR(15) NOT NULL,
    tanggal_bergabung DATE NOT NULL
);

-- Membuat tabel Pelatih
CREATE TABLE Pelatih (
    id_pelatih INT(5) AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nama VARCHAR(100) NOT NULL,
    spesialisasi VARCHAR(100) NOT NULL,
    nomor_telepon VARCHAR(15) NOT NULL
);

-- Membuat tabel Kelas_Latihan
CREATE TABLE Kelas_Latihan (
    id_kelas INT(5) AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nama_kelas VARCHAR(100) NOT NULL,
    tingkat_kesulitan ENUM('Pemula', 'Pro', 'Sepuh') NOT NULL,
    durasi INT NOT NULL,
    harga DECIMAL(10,2) NOT NULL
);

-- Membuat tabel Pendaftaran_Kelas
CREATE TABLE Pendaftaran_Kelas (
    id_pendaftaran INT(5) AUTO_INCREMENT PRIMARY KEY NOT NULL,
    id_members INT(5) NOT NULL,
    id_kelas INT(5) NOT NULL,
    id_pelatih INT(5) NOT NULL,
    tanggal_pendaftaran DATE NOT NULL,
    FOREIGN KEY (id_members) REFERENCES Members(id_members),
    FOREIGN KEY (id_kelas) REFERENCES Kelas_Latihan(id_kelas),
    FOREIGN KEY (id_pelatih) REFERENCES Pelatih(id_pelatih)
);

-- Membuat tabel Pembayaran_Member
CREATE TABLE Pembayaran_Member (
    id_pembayaran INT(5) AUTO_INCREMENT PRIMARY KEY NOT NULL,
    id_members INT(5) NOT NULL,
    tanggal_pembayaran DATE NOT NULL,
    jumlah_pembayaran DECIMAL(10,2) NOT NULL,
    metode_pembayaran ENUM('Tunai', 'Kartu Kredit', 'Transfer Bank', 'E-Wallet') NOT NULL,
    FOREIGN KEY (id_members) REFERENCES Members(id_members)
);

USE manajemen_gym;

ALTER TABLE Pendaftaran_Kelas
ADD COLUMN metode_pendaftaran ENUM('Online', 'Offline') NOT NULL;

ALTER TABLE Pendaftaran_Kelas
ADD COLUMN status_pendaftaran ENUM('Menunggu Pembayaran', 'Terverifikasi', 'Batal') NOT NULL DEFAULT 'Menunggu Pembayaran';

ALTER TABLE Pembayaran_Member
ADD COLUMN status_pembayaran ENUM('Lunas', 'Belum Lunas') DEFAULT 'Belum Lunas';



