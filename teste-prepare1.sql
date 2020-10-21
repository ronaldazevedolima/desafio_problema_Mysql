drop procedure if exists atualizar;
CALL atualizar (170, 'LIVROS', 'tenho', 1);
select * from LIVROS where id = 170;



DELIMITER $$
CREATE PROCEDURE atualizar(
in idInput SMALLINT,
in tabela VARCHAR(20),
in coluna VARCHAR(20),
in valor varchar(100)
)
BEGIN
SET @atualiza = 'update LIVROS set tenho = ? where id = ?';
PREPARE stm1 FROM @atualiza;
set @a = valor;
set @b = idInput;
EXECUTE stm1 using @a, @b;
DEALLOCATE PREPARE stm1;
END $$

