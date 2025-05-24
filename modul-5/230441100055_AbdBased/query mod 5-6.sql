USE manajemen_gym;

-- soal 1 menampilkan lama members bergabung
DELIMITER //
CREATE OR REPLACE PROCEDURE TampilkanLamaMemberBergabung(IN hari_terakhir INT)
BEGIN
    SELECT
        id_members,
        nama,
        tanggal_bergabung,
        DATEDIFF(CURDATE(), tanggal_bergabung) AS lama_hari_terdaftar
    FROM Members
    WHERE tanggal_bergabung >= CURDATE() - INTERVAL hari_terakhir DAY;
END //
DELIMITER ;

CALL TampilkanLamaMemberBergabung(30);


-- soal 2 menghapus transaki yang lebih dari 1 tahun dengan catatan lunas/valid
DELIMITER //
CREATE PROCEDURE HapusTransaksiLama()
BEGIN
    DELETE FROM pembayaran_member
    WHERE tanggal_pembayaran < CURDATE() - INTERVAL 1 YEAR AND status_pembayaran = 'Lunas';
END //
DELIMITER ;

-- untuk menegecek data mana yang akan dihapus sebelum call stored procedure
SELECT * FROM Pembayaran_Member
WHERE tanggal_pembayaran < CURDATE() - INTERVAL 1 YEAR AND status_pembayaran = 'Lunas';

CALL HapusTransaksiLama();

-- soal 3
DELIMITER //
CREATE PROCEDURE UbahStatusPendaftaran()
BEGIN
    UPDATE pendaftaran_kelas
    SET status_pendaftaran = 'Terverifikasi'
    WHERE status_pendaftaran = 'Menunggu Pembayaran'
    ORDER BY tanggal_pendaftaran ASC
    LIMIT 7;
END //
DELIMITER ;

-- untuk menegecek sebelum call procedure
SELECT * FROM pendaftaran_kelas WHERE status_pendaftaran = 'Menunggu Pembayaran';

CALL UbahStatusPendaftaran();

-- untuk mengecek sesudah call procedure
SELECT id_pendaftaran, status_pendaftaran
FROM pendaftaran_kelas WHERE id_pendaftaran IN (64, 66, 68, 71, 73, 76, 78);


-- soal 4
DELIMITER //
CREATE OR REPLACE PROCEDURE EditMemberTanpaTransaksi(
    IN p_id_members INT,
    IN p_nama_baru VARCHAR(100)
)
BEGIN
    UPDATE members a
    LEFT JOIN pembayaran_member p ON a.id_members = p.id_members
    SET a.nama = p_nama_baru
    WHERE a.id_members = p_id_members
    AND p.id_members IS NULL;
END //
DELIMITER ;

-- nama bisa di update karena tidak ada transksi
CALL EditMemberTanpaTransaksi(20, 'Abas Ganteng');
SELECT * FROM members WHERE id_members = 20;

-- nama tidak bisa di update karena ada transaksi
CALL EditMemberTanpaTransaksi(1, 'Ridho Raja Iblis');
SELECT * FROM members WHERE id_members = 1;


-- soal 5
DELIMITER //
CREATE OR REPLACE PROCEDURE UpdateStatusTransaksi1Bulan()
BEGIN
    DECLARE jumlah_min DECIMAL(10,2);
    DECLARE jumlah_max DECIMAL(10,2);

    SELECT MIN(jumlah_pembayaran), MAX(jumlah_pembayaran)
    INTO jumlah_min, jumlah_max
    FROM Pembayaran_Member
    WHERE tanggal_pembayaran >= CURDATE() - INTERVAL 1 MONTH;

    UPDATE Pembayaran_Member
    SET status_pembayaran = 'Belum Lunas'
    WHERE tanggal_pembayaran >= CURDATE() - INTERVAL 1 MONTH
      AND jumlah_pembayaran = jumlah_min;

    UPDATE Pembayaran_Member
    SET status_pembayaran = 'Lunas'
    WHERE tanggal_pembayaran >= CURDATE() - INTERVAL 1 MONTH
      AND jumlah_pembayaran = jumlah_max;

    UPDATE Pembayaran_Member
    SET status_pembayaran = 'Menunggu'
    WHERE tanggal_pembayaran >= CURDATE() - INTERVAL 1 MONTH
      AND jumlah_pembayaran > jumlah_min
      AND jumlah_pembayaran < jumlah_max;
END //
DELIMITER ;

CALL UpdateStatusTransaksi1Bulan();

-- untuk mengecek setelah call procedure
SELECT * FROM Pembayaran_Member
WHERE tanggal_pembayaran >= CURDATE() - INTERVAL 1 MONTH
ORDER BY jumlah_pembayaran ASC;

-- soal 6
DELIMITER //
CREATE OR REPLACE PROCEDURE HitungTransaksiLunas1Bulan()
BEGIN
    DECLARE jumlah INT DEFAULT 0;
    DECLARE total_data INT DEFAULT 0;
    DECLARE index_loop INT DEFAULT 0;

    SELECT COUNT(*) INTO total_data
    FROM pembayaran_member
    WHERE status_pembayaran = 'Lunas'
      AND tanggal_pembayaran >= CURDATE() - INTERVAL 1 MONTH;

    loop_transaksi: LOOP
        IF index_loop >= total_data THEN
            LEAVE loop_transaksi;
        END IF;

        SET jumlah = jumlah + 1;
        SET index_loop = index_loop + 1;
    END LOOP loop_transaksi;

    SELECT jumlah AS jumlah_pembayaran_lunas;
END //
DELIMITER ;

CALL HitungTransaksiLunas1Bulan();

-- untuk cek hasilnya sesuai atau tidak
SELECT * FROM pembayaran_member 
WHERE status_pembayaran = 'Lunas'
AND tanggal_pembayaran >= CURDATE() - INTERVAL 1 MONTH;


-- jika ada transaksi baru masuk dia akan otomatis 
-- bisa muncul saat menjalankan stored procedure

