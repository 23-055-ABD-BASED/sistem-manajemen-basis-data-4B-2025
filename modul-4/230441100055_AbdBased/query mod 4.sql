USE manajemen_gym

-- soal 1
-- Menambah kolom keterangan
ALTER TABLE pendaftaran_kelas
ADD COLUMN keterangan TEXT DEFAULT NULL;

-- soal 2
-- Gabungan 2 tabel yang memungkinkan dan memiliki fungsi pada penerapannya
SELECT 
    a.id_pendaftaran,
    b.nama,
    b.nomor_telepon,
    a.tanggal_pendaftaran,
    a.metode_pendaftaran,
    a.status_pendaftaran
FROM 
    pendaftaran_kelas a
JOIN 
    members b ON a.id_members = b.id_members;
    
    
-- Soal 3    
-- Mengurutkan pelatih berdasarkan spesialisasi (default)
SELECT * FROM pelatih ORDER BY spesialisasi;

-- Mengurutkan kelas dari durasi terpendek ke terpanjang (ASC)
SELECT * FROM kelas_latihan ORDER BY durasi ASC;

-- Menampilkan pembayaran dengan jumlah terbesar ke terkecil (DESC)
SELECT * FROM pembayaran_member ORDER BY jumlah_pembayaran DESC;

-- saol 4
-- Mengubah tipe data kolom usia pada tabel members dari INT(2) ke TINYINT UNSIGNED 
ALTER TABLE members MODIFY usia TINYINT UNSIGNED NOT NULL;

-- soal 5
-- Left Join
SELECT members.nama, kelas_latihan.nama_kelas
FROM members
LEFT JOIN pendaftaran_kelas ON members.id_members = pendaftaran_kelas.id_members
LEFT JOIN kelas_latihan ON pendaftaran_kelas.id_kelas = kelas_latihan.id_kelas;

-- Right Join
SELECT kelas_latihan.nama_kelas, members.nama
FROM kelas_latihan
RIGHT JOIN pendaftaran_kelas ON kelas_latihan.id_kelas = pendaftaran_kelas.id_kelas
RIGHT JOIN members ON pendaftaran_kelas.id_members = members.id_members;

-- Self Join
SELECT pelatih1.nama AS pelatih1, pelatih2.nama AS pelatih2, kelas_latihan.nama_kelas
FROM pelatih AS Pelatih1
JOIN pelatih AS Pelatih2 ON pelatih1.spesialisasi = pelatih2.spesialisasi
JOIN pendaftaran_kelas ON pelatih1.id_pelatih = pendaftaran_kelas.id_pelatih
JOIN kelas_latihan ON pendaftaran_kelas.id_kelas = kelas_latihan.id_kelas;

-- Soal 6
-- Menampilkan Member yang Usianya Lebih dari 30 Tahun (Operator: >)
SELECT nama, usia FROM members WHERE usia > 30;

-- Menampilkan Kelas dengan Harga kurang Dari 400.000 (Operator: <)
SELECT nama_kelas, harga FROM kelas_latihan WHERE harga < 400000;

-- Menampilkan Member dengan Nama Tertentu (Operator: =)
SELECT nama, usia FROM members WHERE nama = 'Abass';


-- Mencari Member yang Namanya Mengandung Kata “Sari” (Operator: LIKE)
SELECT nama, nomor_telepon FROM members WHERE nama LIKE '%Sari%';

-- Menampilkan Member dengan Usia Antara 25 dan 30 Tahun (Operator: BETWEEN)
SELECT id_members, nama, usia FROM members WHERE usia BETWEEN 25 AND 30;

--  Menampilkan Kelas dengan Tingkat Kesulitan Tertentu (Operator: IN)
SELECT nama_kelas, tingkat_kesulitan FROM kelas_latihan WHERE tingkat_kesulitan IN ('Pemula', 'Pro');
