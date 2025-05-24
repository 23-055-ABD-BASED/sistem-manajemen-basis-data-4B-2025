USE db_umkm_jabar;

-- Membuat Stored Procedure addUMKM
DELIMITER //
CREATE PROCEDURE addUMKM (
    IN p_nama_usaha VARCHAR(200),
    IN p_jumlah_karyawan INT

)
BEGIN
    INSERT INTO umkm (nama_usaha, jumlah_karyawan)
    VALUES (p_nama_usaha, p_jumlah_karyawan);
END //
DELIMITER;

CALL addUMKM('Kopi Keren', 5);
SELECT nama_usaha, jumlah_karyawan FROM umkm WHERE nama_usaha = 'Kopi Keren';

-- Membuat Stored Procedure UpdateKategoriUMKM
DELIMITER //
CREATE PROCEDURE UpdateKategoriUMKM (
    IN p_id_kategori INT,
    IN p_nama_baru VARCHAR(100)
)
BEGIN
    UPDATE kategori_umkm
    SET nama_kategori = p_nama_baru
    WHERE id_kategori = p_id_kategori;
END //
DELIMITER ;

CALL UpdateKategoriUMKM (12, 'Creative Economy');
SELECT id_kategori, nama_kategori FROM kategori_umkm WHERE id_kategori = 12;

-- Membuat Stored Procedure DeletePemilikUMKM
DELIMITER //
CREATE PROCEDURE DeletePemilikUMKM (
    IN p_id_pemilik INT
 )
 BEGIN
    DELETE FROM pemilik_umkm WHERE id_pemilik = p_id_pemilik;
END //
DELIMITER;

CALL DeletePemilikUMKM (10);
SELECT * FROM pemilik_umkm;
SELECT * FROM umkm;


-- Membuat Stored Procedure addProduk
DELIMITER //
CREATE PROCEDURE AddProduk (
    IN p_id_umkm INT,
    IN p_nama_produk VARCHAR(200),
    IN p_harga INT
)
BEGIN
    INSERT INTO produk_umkm (id_umkm, nama_produk, harga)
    VALUES (p_id_umkm, p_nama_produk, p_harga);
END //
DELIMITER ;

CALL addProduk (7, 'Jasa Las Motor', 125000);
SELECT id_umkm, nama_produk, harga FROM produk_umkm WHERE id_umkm = 7;

-- Membuat Stored Procedure GetUMKMByID
DELIMITER //
CREATE PROCEDURE GetUMKMByID (
    IN p_id_umkm INT,
    OUT p_nama_usaha VARCHAR(200),
    OUT p_jumlah_karyawan INT,
    OUT p_tanggal_registrasi DATE
)
BEGIN
    SELECT nama_usaha, jumlah_karyawan, tanggal_registrasi
    INTO p_nama_usaha, p_jumlah_karyawan, p_tanggal_registrasi
    FROM umkm
    WHERE id_umkm = p_id_umkm;
END //
DELIMITER ;

CALL GetUMKMByID(8, @nama_usaha, @jumlah_karyawan, @tanggal_registrasi);
SELECT @nama_usaha, @jumlah_karyawan, @tanggal_registrasi;
