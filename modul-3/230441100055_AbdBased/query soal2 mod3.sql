USE manajemen_gym;

-- Membuat Stired Procedure UpdateDataMaster
DELIMITER //
CREATE PROCEDURE UpdateDataMaster (
    IN p_id INT,              
    IN p_nilai_baru VARCHAR(100), 
    OUT p_status_update VARCHAR(50)    
)
BEGIN
    UPDATE Members
    SET nama = p_nilai_baru
    WHERE id_members = p_id;

    -- Memeriksa apakah ada baris yang terpengaruh setelah diperbarui
    IF ROW_COUNT() > 0 THEN
        SET p_status_update = 'Update berhasil';
    ELSE
        SET p_status_update = 'Update gagal, ID tidak ditemukan';
    END IF;
END //
DELIMITER ;

CALL UpdateDataMaster(1, 'Abass', @status_update);
SELECT @status_update;

SELECT * FROM members;

-- Membuat Stored Procedure CountTransaksi
DELIMITER //
CREATE PROCEDURE CountTransaksi (
    OUT p_jumlah_total_entri INT
)
BEGIN
    SELECT ( 
        (SELECT COUNT(*) FROM Pendaftaran_Kelas) +
        (SELECT COUNT(*) FROM Pembayaran_Member)
    ) INTO p_jumlah_total_entri;
END //
DELIMITER ;

CALL CountTransaksi(@p_jumlah_total_entri);
SELECT @p_jumlah_total_entri;


-- Membuat Stored Procedure GetDataMasterByID 
DELIMITER //
CREATE PROCEDURE GetDataMasterByID (
    IN p_id INT,
    OUT p_nama_kelas VARCHAR(100),
    OUT p_harga DECIMAL(10, 2)
)
BEGIN
    SELECT nama_kelas, harga
    INTO p_nama_kelas, p_harga
    FROM Kelas_Latihan WHERE id_kelas = p_id;
END //
DELIMITER ;

CALL GetDataMasterByID(1, @nama_kelas, @harga);
SELECT @nama_kelas, @harga;

-- Membuat Stored Procedure UpdateFieldTransaksi
DELIMITER //
CREATE PROCEDURE UpdateFieldTransaksi (
    IN p_id INT,
    INOUT p_metode_pendaftaran ENUM('Online', 'Offline'),
    INOUT p_status_pendaftaran ENUM('Menunggu Pembayaran', 'Terverifikasi', 'Batal')
)
BEGIN
    DECLARE a_metode_pendaftaran ENUM('Online', 'Offline');
    DECLARE a_status_pendaftaran ENUM('Menunggu Pembayaran', 'Terverifikasi', 'Batal');

    SELECT metode_pendaftaran, status_pendaftaran
    INTO a_metode_pendaftaran, a_status_pendaftaran
    FROM pendaftaran_kelas
    WHERE id_pendaftaran = p_id;

    IF p_metode_pendaftaran = '' THEN
        SET p_metode_pendaftaran = a_metode_pendaftaran;
    END IF;

    IF p_status_pendaftaran = '' THEN
        SET p_status_pendaftaran = a_status_pendaftaran;
    END IF;

    -- Lakukan update
    UPDATE pendaftaran_kelas
    SET metode_pendaftaran = p_metode_pendaftaran,
        status_pendaftaran = p_status_pendaftaran
    WHERE id_pendaftaran = p_id;
END //
DELIMITER ;

SET @id = 61;
SET @metode_pendaftaran = '';
SET @status_pendaftaran = 'Terverifikasi';

CALL UpdateFieldTransaksi(@id, @metode_pendaftaran, @status_pendaftaran);
SELECT * FROM pendaftaran_kelas;

-- Membuat Stored Procedure DeleteEntriesByIDMaster
DELIMITER //
CREATE PROCEDURE DeleteEntriesByIDMaster (
    IN p_id INT
)
BEGIN
    DELETE FROM Kelas_Latihan
    WHERE id_kelas = p_id;
END //
DELIMITER ;

CALL DeleteEntriesByIDMaster(3);
SELECT * FROM kelas_latihan;

