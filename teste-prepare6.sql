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
set @concate = concat('update ' + @@tab + ' set ' + @@col + '= ? where id = ?'); 
PREPARE stm1 FROM @concate;
set @a = @val;
set @b = @idIn;
EXECUTE stm1 using @a, @b;
DEALLOCATE PREPARE stm1;
END $$
DELIMITER ;

Error Code: 1193. Unknown system variable 'tab'
