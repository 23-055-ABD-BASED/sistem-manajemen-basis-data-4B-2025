USE manajemen_gym;
-- soal 1
-- before insert
DELIMITER //
CREATE TRIGGER validasi_usia_member
BEFORE INSERT ON members
FOR EACH ROW
BEGIN
    IF NEW.usia <= 0 OR NEW.usia > 100 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Usia member harus antara 1 sampai 100 tahun';
    END IF;
END //
DELIMITER ;

-- pengecekan
INSERT INTO members (nama, usia, alamat, nomor_telepon, tanggal_bergabung)
VALUES ('Budi', 20, 'Jl. ABC No. 1', '08123456789', '2025-05-14');

SELECT * FROM members;

-- before update
DELIMITER //
CREATE TRIGGER Validasi_status_pembayaran
BEFORE UPDATE ON pembayaran_member
FOR EACH ROW
BEGIN
    IF NEW.status_pembayaran = 'Lunas' AND (NEW.jumlah_pembayaran IS NULL OR NEW.jumlah_pembayaran <= 0) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Tidak bisa mengubah status menjadi Lunas jika jumlah pembayaran kosong atau nol';
    END IF;
END //
DELIMITER ;

-- pengecekan
INSERT INTO pembayaran_member (id_members, tanggal_pembayaran, jumlah_pembayaran, metode_pembayaran, status_pembayaran)
VALUES (21, '2025-05-14', 0, 'Tunai', 'Belum Lunas');

UPDATE pembayaran_member SET status_pembayaran = 'Lunas' WHERE id_pembayaran = 30;


-- before delete
DELIMITER //
CREATE TRIGGER validasi_hapus_pelatih
BEFORE DELETE ON pelatih
FOR EACH ROW
BEGIN
    DECLARE pelatih_dipakai INT;
    
    SELECT COUNT(*) INTO pelatih_dipakai
    FROM pendaftaran_kelas
    WHERE id_pelatih = OLD.id_pelatih;

    IF pelatih_dipakai > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Pelatih tidak bisa dihapus karena masih digunakan dalam pendaftaran kelas';
    END IF;
END //
DELIMITER ;

-- pengecekan
DELETE FROM pelatih WHERE id_pelatih = 1;
SELECT * FROM pendaftaran_kelas WHERE id_pelatih = 1;


-- soal 2
-- after update
DELIMITER //
CREATE TRIGGER ubah_status_pendaftaran
AFTER UPDATE ON pembayaran_member
FOR EACH ROW
BEGIN
    IF NEW.status_pembayaran = 'Lunas' THEN
        UPDATE pendaftaran_kelas
        SET status_pendaftaran = 'Terverifikasi'
        WHERE id_members = NEW.id_members
        AND status_pendaftaran = 'Menunggu Pembayaran';
    END IF;
END //
DELIMITER ;

-- penegecekan
INSERT INTO pendaftaran_kelas (id_members, id_kelas, id_pelatih, tanggal_pendaftaran, metode_pendaftaran, status_pendaftaran)
VALUES (21, 1, 1, '2025-05-14', 'Online', 'Menunggu Pembayaran');

UPDATE pembayaran_member SET status_pembayaran = 'Lunas' WHERE id_members = 21;

SELECT * FROM pendaftaran_kelas WHERE id_members = 21;

-- buat tabel log aktivitas untuk trigger after insert & after delete
CREATE TABLE Log_Aktivitas (
    id_log INT AUTO_INCREMENT PRIMARY KEY,
    deskripsi TEXT NOT NULL,
    waktu DATETIME NOT NULL
);


-- after insert
DELIMITER //
CREATE TRIGGER tambah_log_aktivitas_member
AFTER INSERT ON Members
FOR EACH ROW
BEGIN
  INSERT INTO Log_Aktivitas (deskripsi, waktu)
  VALUES (CONCAT('Member baru ', NEW.nama, ' telah mendaftar.'), NOW());
END //
DELIMITER ;

-- pengecekan
INSERT INTO Members (nama, usia, alamat, nomor_telepon, tanggal_bergabung)
VALUES ('Raja Iblis', 26, 'Jl. Baru No. 21, Jakarta', '08999888777', '2025-05-14');

SELECT * FROM Log_Aktivitas;

-- after delete
DELIMITER //
CREATE TRIGGER delete_log_aktivitas_member
AFTER DELETE ON Members
FOR EACH ROW
BEGIN
  INSERT INTO Log_Aktivitas (deskripsi, waktu)
  VALUES (CONCAT('Member dengan nama ', OLD.nama, ' telah dihapus dari sistem.'), NOW());
END//
DELIMITER ;

-- pengecekan
DELETE FROM Members WHERE id_members = 22;

SELECT * FROM Log_Aktivitas;



