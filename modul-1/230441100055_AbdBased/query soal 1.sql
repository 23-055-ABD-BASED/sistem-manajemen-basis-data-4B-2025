CREATE DATABASE akademik;
USE akademik;

-- membuat tabel mahasiswa
CREATE TABLE Mahasiswa (
nim INT(12) NOT NULL PRIMARY KEY,
nama VARCHAR(60) NOT NULL,
prodi VARCHAR(50) NOT NULL,
alamat VARCHAR(255) NOT NULL
);

-- membuat tabel dosen
CREATE TABLE dosen (
nip INT(12) NOT NULL PRIMARY KEY,
nama VARCHAR(60) NOT NULL,
alamat VARCHAR(255) NOT NULL
);

-- membuat tabel matakuliah
CREATE TABLE matakuliah (
kode_mk CHAR(5) NOT NULL PRIMARY KEY,
nama_mk VARCHAR(100) NOT NULL,
sks INT(1) NOT NULL
);

-- membuat tabel krs 
CREATE TABLE krs (
id_krs INT(4) NOT NULL PRIMARY KEY,
nim INT(12) NOT NULL,
kode_mk CHAR(5) NOT NULL,
semester INT(2) NOT NULL,
FOREIGN KEY (nim) REFERENCES mahasiswa(nim),
FOREIGN KEY (kode_mk) REFERENCES matakuliah(kode_mk)
);

-- membuat tabel jadwal
CREATE TABLE jadwal (
id_jadwal INT(4) NOT NULL PRIMARY KEY,
nip INT(12) NOT NULL,
kode_mk CHAR(5) NOT NULL,
hari VARCHAR(10) NOT NULL,
jam_mulai TIME NOT NULL,
jam_selesai TIME NOT NULL,
ruang VARCHAR(20) NOT NULL,
FOREIGN KEY (nip) REFERENCES dosen(nip),
FOREIGN KEY (kode_mk) REFERENCES matakuliah(kode_mk)
);

-- mengisi tabel mahasiswa
INSERT INTO mahasiswa (nim, nama, prodi, alamat) VALUES
(1234567890, 'Abd. Based', 'Sistem Informasi', 'Jl. Muragung Utara No. 7'),
(1234567891, 'Aditya', 'Sistem Informasi', 'Jl. Tragah No. 22'),
(1234567892, 'Aliyul Ridho', 'Sistem Informasi', 'Jl. Jl. Sekep No. 5'),
(1234567893, 'Dian Agustina', 'Sistem Informasi', 'Jl. Pahlawan No. 8'),
(1234567894, 'Eka Supriyadi', 'Sistem Informasi','Jl. Manggis No. 10'),
(1234567895, 'Fajar Rahman', 'Sistem Informasi', 'Jl. Anggrek No. 6'),
(1234567896, 'Gita Nurul', 'Sistem Informasi', 'Jl. Melati No. 15'),
(1234567897, 'Hadi Prakoso', 'Sistem Informasi', 'Jl. Kenanga No. 9'),
(1234567898, 'AIntan Rahayu', 'Sistem Informasi', 'Jl. Cendana No. 11'),
(1234567899, 'Joko Santoso', 'Sistem Informasi', 'Jl. Kamboja No. 7');

-- mengisi tabel dosen
INSERT INTO dosen (nip, nama, alamat) VALUES
(1111111110, 'Dr. Asep Mulyana', 'Jl. Raya No. 1'),
(1111111111, 'Prof. Bambang Wijaya', 'Jl. Merdeka No. 4'),
(1111111112, 'Dr. Chandra Sugianto', 'Jl. Pahlawan No. 3'),
(1111111113, 'Prof. Diana Sutrisno', 'Jl. Sudirman No. 2'),
(1111111114, 'Dr. Eka Lestari', 'Jl. Anggrek No. 1'),
(1111111115, 'Prof. Fadil Hasan', 'Jl. Manggis No. 4'),
(1111111116, 'Dr. Guntur Hadi', 'Jl. Melati No. 6'),
(1111111117, 'Prof. Haryadi Prabowo', 'Jl. Cendana No. 8'),
(1111111118, 'Dr. Indah Nuraini', 'Jl. Kamboja No. 5'),
(1111111119, 'Prof. Jaya Perdana', 'Jl. Kenanga No. 10');

-- mengisi tabel matakuliah
INSERT INTO matakuliah (kode_mk, nama_mk, sks) VALUES
('SI101', 'Pember', 4),
('SI102', 'SMBD', 4),
('SI103', 'SPK', 3),
('SI104', 'Mpit', 3),
('SI105', 'PSDP', 3),
('SI106', 'IPPL', 3),
('SI107', 'Data Mining', 3),
('SI108', 'Bahasa Indonesia', 2),
('SI109', 'Pai', 2),
('SI110', 'Pemrograman Web', 4);

-- mengisi tabel jadwal
INSERT INTO jadwal (id_jadwal, nip, kode_mk, hari, jam_mulai, jam_selesai, ruang, kelas) VALUES
(1001, 1111111110, 'SI101', 'Senin', '08:00:00', '10:00:00', 'Ruang 101', 'A'),  
(1002, 1111111111, 'SI102', 'Selasa', '10:00:00', '12:00:00', 'Ruang 102' 'B'), 
(1003, 1111111112, 'SI103', 'Rabu', '08:00:00', '10:00:00', 'Ruang 103', 'C'),    
(1004, 1111111113, 'SI104', 'Kamis', '13:00:00', '15:00:00', 'Ruang 104', 'D'),   
(1005, 1111111114, 'SI105', 'Jumat', '09:00:00', '11:00:00', 'Ruang 105', 'A'),   
(1006, 1111111115, 'SI106', 'Senin', '10:00:00', '12:00:00', 'Ruang 106', 'B'),   
(1007, 1111111116, 'SI107', 'Selasa', '08:00:00', '10:00:00', 'Ruang 107', 'C'),  
(1008, 1111111117, 'SI108', 'Rabu', '10:00:00', '12:00:00', 'Ruang 108', 'D'),    
(1009, 1111111118, 'SI109', 'Kamis', '08:00:00', '10:00:00', 'Ruang 109', 'A'),   
(1010, 1111111119, 'SI110', 'Jumat', '11:00:00', '13:00:00', 'Ruang 110', 'B'); 

-- menampilkan isi tabel mahasiswa
SELECT *FROM mahasiswa;

-- menampilkan isi tabel dosen
SELECT * FROM dosen;

-- menampilkan isi tabel matakuliah
SELECT * FROM matakuliah;

-- menampilkan isi tabel jadwal
SELECT * FROM jadwal;

-- menambahkan 5 isi tabel krs
INSERT INTO krs (id_krs, nim, kode_mk, semester) VALUES
(1101, 1234567890, 'SI102', 4),
(1102, 1234567891, 'SI101', 3),
(1103, 1234567892, 'SI101', 2),
(1104, 1234567897, 'SI106', 1),
(1105, 1234567895, 'SI108', 4);

-- menampilkan isi tabel krs
SELECT * FROM krs;

-- melakukan perubahan nama pada salah satu tabel
RENAME TABLE mhs TO mahasiswa;

-- menghapus databasenya
DROP DATABASE akademik;
