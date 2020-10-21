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
set @tab = tabela;
set @col = coluna;
set @val = valor;
set @idIn = idInput;
set @concate = concat('update' + @tab + 'set' + @col + '=' + @val + 'where id =' + @idIn);  
PREPARE stm1 FROM @concate;
EXECUTE stm1;
DEALLOCATE PREPARE stm1;
END $$
DELIMITER ;
Error Code: 1064. You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '171' at line 1
