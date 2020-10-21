
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
SET @atualiza = 'update ? set ? = 1 where id = 170';
PREPARE stm1 FROM @atualiza;
set @a = tabela;
set @b = coluna;
EXECUTE stm1 using @a, @b;
DEALLOCATE PREPARE stm1;
END $$
DELIMITER ;

Error Code: 1064. You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '? set ? = 1 where id = 170' at line 1
