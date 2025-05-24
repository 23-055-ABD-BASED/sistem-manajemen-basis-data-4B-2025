USE manajemen_gym;

-- menambahkan data members
INSERT INTO Members (nama, usia, alamat, nomor_telepon, tanggal_bergabung)
VALUES
('Budi Santoso', 25, 'Jl. Raya No. 1, Jakarta', '08123456789', '2025-01-01'),
('Siti Aisyah', 30, 'Jl. Merdeka No. 2, Bandung', '08234567890', '2025-02-15'),
('Ahmad Fauzi', 28, 'Jl. Raya No. 3, Surabaya', '08345678901', '2025-03-01'),
('Putri Saraswati', 35, 'Jl. Sejahtera No. 4, Bali', '08456789012', '2025-01-20'),
('Dimas Pratama', 22, 'Jl. Pelajar No. 5, Medan', '08567890123', '2025-02-10'),
('Linda Sari', 40, 'Jl. Kuning No. 6, Jakarta', '08678901234', '2025-01-05'),
('Robi Prakoso', 29, 'Jl. Harmoni No. 7, Bogor', '08789012345', '2025-02-22'),
('Emilia Kartika', 33, 'Jl. Raya No. 8, Makassar', '08890123456', '2025-03-10'),
('Daniel Adi', 27, 'Jl. Sukarno No. 9, Bandung', '08901234567', '2025-03-18'),
('Sofia Rahmawati', 32, 'Jl. Bunga No. 10, Yogyakarta', '08102345678', '2025-04-05'),
('Joni Wicaksono', 24, 'Jl. Taman No. 11, Surabaya', '08213456789', '2025-04-01'),
('Olivia Wijaya', 31, 'Jl. Merdeka No. 12, Jakarta', '08324567890', '2025-01-25'),
('William Hadi', 26, 'Jl. Raya No. 13, Bali', '08435678901', '2025-03-03'),
('Ava Maharani', 29, 'Jl. Sehat No. 14, Bogor', '08546789012', '2025-02-17'),
('Liam Gunawan', 23, 'Jl. Indah No. 15, Bandung', '08657890123', '2025-04-02'),
('Mia Sari', 34, 'Jl. Hijau No. 16, Surabaya', '08768901234', '2025-03-08'),
('Charlotte Pertiwi', 36, 'Jl. Cantik No. 17, Yogyakarta', '08879012345', '2025-04-07'),
('Alexander Wijaya', 38, 'Jl. Raya No. 18, Jakarta', '08980123456', '2025-01-10'),
('Amelia Putri', 27, 'Jl. Kuning No. 19, Makassar', '08111223344', '2025-02-20'),
('Benjamin Surya', 39, 'Jl. Sejahtera No. 20, Bali', '08222334455', '2025-03-12');

-- menambahkan data pelatih
INSERT INTO Pelatih (nama, spesialisasi, nomor_telepon)
VALUES
('Alfredo Santoso', 'Yoga', '08345678901'),
('Diana Pratama', 'Fitness', '08456789012'),
('Rizki Ramadhan', 'Zumba', '08567890123'),
('Maya Sari', 'Bodybuilding', '08678901234'),
('Siti Nurhasanah', 'Pilates', '08789012345'),
('Faisal Hidayat', 'Yoga', '08912345678'),
('Nina Syafira', 'Fitness', '08923456789');

-- menambahkan data kelas_latihan
INSERT INTO Kelas_Latihan (nama_kelas, tingkat_kesulitan, durasi, harga)
VALUES
('Yoga Dasar', 'Pemula', 60, 300000),
('Fitness Pro', 'Pro', 90, 500000),
('Zumba Fun', 'Pemula', 45, 350000),
('Bodybuilding Advanced', 'Pro', 120, 600000),
('Pilates Untuk Semua', 'Sepuh', 75, 400000);

-- menambahkan data pendaftaran_kelas
INSERT INTO Pendaftaran_Kelas (id_members, id_kelas, id_pelatih, tanggal_pendaftaran, metode_pendaftaran, status_pendaftaran)
VALUES
(1, 1, 1, '2025-04-15', 'Online', 'Menunggu Pembayaran'),
(2, 2, 2, '2025-04-16', 'Offline', 'Terverifikasi'),
(3, 3, 3, '2025-04-17', 'Online', 'Terverifikasi'),
(4, 4, 4, '2025-04-18', 'Offline', 'Menunggu Pembayaran'),
(5, 5, 5, '2025-04-19', 'Online', 'Batal'),
(6, 1, 2, '2025-04-20', 'Offline', 'Menunggu Pembayaran'),
(7, 2, 1, '2025-04-21', 'Online', 'Terverifikasi'),
(8, 3, 3, '2025-04-22', 'Offline', 'Menunggu Pembayaran'),
(9, 4, 4, '2025-04-23', 'Online', 'Batal'),
(10, 5, 5, '2025-04-24', 'Offline', 'Terverifikasi'),
(11, 1, 2, '2025-04-25', 'Online', 'Menunggu Pembayaran'),
(12, 2, 1, '2025-04-26', 'Offline', 'Terverifikasi'),
(13, 3, 3, '2025-04-27', 'Online', 'Menunggu Pembayaran'),
(14, 4, 4, '2025-04-28', 'Offline', 'Terverifikasi'),
(15, 5, 5, '2025-04-29', 'Online', 'Batal'),
(16, 1, 2, '2025-04-30', 'Offline', 'Menunggu Pembayaran'),
(17, 2, 1, '2025-05-01', 'Online', 'Terverifikasi'),
(18, 3, 3, '2025-05-02', 'Offline', 'Menunggu Pembayaran'),
(19, 4, 4, '2025-05-03', 'Online', 'Batal'),
(20, 5, 5, '2025-05-04', 'Offline', 'Terverifikasi');

-- meanambahkan data pembayaran_member
INSERT INTO Pembayaran_Member (id_members, tanggal_pembayaran, jumlah_pembayaran, metode_pembayaran)
VALUES
(1, '2025-04-17', 300000, 'Transfer Bank'),
(2, '2025-04-17', 500000, 'Kartu Kredit'),  
(3, '2025-04-18', 350000, 'Tunai'), 
(4, '2025-04-19', 600000, 'E-Wallet'), 
(5, '2025-04-20', 300000, 'Transfer Bank'),
(6, '2025-04-21', 400000, 'Kartu Kredit'),
(7, '2025-04-22', 500000, 'E-Wallet'), 
(8, '2025-04-23', 600000, 'Transfer Bank'), 
(9, '2025-04-24', 350000, 'Tunai'), 
(10, '2025-04-25', 400000, 'Kartu Kredit'),
(1, '2025-04-26', 350000, 'Tunai'), 
(2, '2025-04-27', 600000, 'E-Wallet'),  
(3, '2025-04-28', 400000, 'Transfer Bank'), 
(4, '2025-04-29', 600000, 'Kartu Kredit'), 
(5, '2025-04-30', 400000, 'Tunai'), 
(6, '2025-05-01', 300000, 'E-Wallet'), 
(7, '2025-05-02', 500000, 'Transfer Bank'),
(8, '2025-05-03', 400000, 'Kartu Kredit'),
(9, '2025-05-04', 600000, 'E-Wallet'), 
(10, '2025-05-05', 400000, 'Tunai');

-- membuat view infromasi member yang mendaftar kelas gabungan 2 tabel
CREATE OR REPLACE VIEW view_infromasi_pendaftaran_members AS SELECT 
a.id_pendaftaran,
b.nama,
a.tanggal_pendaftaran,
a.metode_pendaftaran,
a.status_pendaftaran
FROM pendaftaran_kelas a
JOIN members b ON a.id_members = b.id_members;

-- untuk menampilkan viewnya
SELECT * FROM view_infromasi_pendaftaran_members;

-- membuat view detail pendaftaran gabungan 3 tabel
CREATE VIEW view_detail_pendaftaran AS SELECT 
a.id_members,
a.nama,
a.usia,
a.alamat,
b.nama_kelas,
b.tingkat_kesulitan,
c.tanggal_pendaftaran,
c.metode_pendaftaran,
c.status_pendaftaran
FROM members a
JOIN Pendaftaran_kelas c ON a.id_members = c.id_members
JOIN kelas_latihan b ON c.id_kelas = b.id_kelas;

SELECT * FROM view_detail_pendaftaran;

-- membuat view member yang terverifikasi gabungan 2 tabel
CREATE VIEW view_member_terverifikasi AS SELECT 
a.id_members,
a.nama,
a.nomor_telepon,
b.tanggal_pendaftaran,
b.status_pendaftaran
FROM members a
JOIN pendaftaran_kelas b ON a.id_members = b.id_members
WHERE b.status_pendaftaran = 'Terverifikasi';

SELECT * FROM view_member_terverifikasi;

-- membuat view agregasi untuk menegtahui kelas yg paling diminati
CREATE OR REPLACE VIEW view_statistik_kelas AS SELECT 
a.id_kelas,
a.nama_kelas,
a.tingkat_kesulitan,
COUNT(b.id_pendaftaran) AS jumlah_pendaftaran,
AVG(a.durasi) AS rata_rata_durasi,
SUM(a.harga) AS total_potensial_pemasukan
FROM Kelas_Latihan a
LEFT JOIN Pendaftaran_Kelas b ON a.id_kelas = b.id_kelas
GROUP BY a.id_kelas;

SELECT * FROM view_statistik_kelas;

-- membuat view ringkasan pembayaran yang bermanfaat dalam menganalisis data  
CREATE VIEW view_ringkasan_pembayaran AS SELECT 
a.id_members,
a.nama,
COUNT(b.id_pembayaran) AS jumlah_transaksi,
SUM(b.jumlah_pembayaran) AS total_pembayaran,
AVG(b.jumlah_pembayaran) AS rata_rata_pembayaran,
MIN(b.jumlah_pembayaran) AS pembayaran_terkecil,
MAX(b.jumlah_pembayaran) AS pembayaran_terbesar
FROM members a
JOIN pembayaran_member b ON a.id_members = b.id_members
GROUP BY a.id_members, a.nama;

SELECT * FROM view_ringkasan_pembayaran
