
/*  Triggers  */ 
create database Recurso_Humano;

use Recurso_Humano; 


drop database Recurso_Humano;

create table funcionario
	(codigo_func int primary key not null, 
	nomefunc   varchar (30) not null,
	emailfunc varchar (40) not null,
	telefunc numeric(9) not null);
	
go 


create table funcionariokackupinsert
	(codigo_func	int primary key not null,
	nomefunc   varchar (30) not null,
	emailfunc varchar (40) not null,
	telefunc numeric(9) not null);
go


create table funcionariokackupdelete
	(codigo_func	int primary key not null,
	nomefunc   varchar (30) not null,
	emailfunc varchar (40) not null,
	telefunc numeric(9) not null);
go





	select * from funcionario 
	select * from funcionariokackupinsert
	select * from funcionariokackupdelete
			go 



			/* fazendo a trigger para o insert */



			create trigger trg_insertfuncionario on funcionario 
			after insert 
			as begin 
			insert into funcionariobackupinsert 
			select * from inserted
			end 
			go 


			/* fazendo a trigger para delete */

			
			create trigger trg_deletefuncionario on funcionario 
			after insert 
			as begin 
			insert into funcionariobackupdelete 
			select * from deleted
			end 
			go 



	 insert into funcionario (codigo_func, nomefunc, emailfunc, telefunc)
	 values(5, 'Edson Dioniso','edson.dionisio@gmail.com', 997402801),
			(8, 'Maitê silva', 'maite.silva@gmail.com', 997402801),
			(12, 'Marilia Késsia', 'testekessia@gmail.com', 997402801);
			go

			/* verificando o conteudo das tabelas */

			

	select * from funcionario 
	select * from funcionariokackupinsert
	select * from funcionariokackupdelete
			go 



			/* fazendo delete de dados da tabela funcionario */

			delete from funcionario
			where codigo_func = 8;
			go 


			/* verificando o conteudo das tabelas */

			
	select * from funcionario 
	select * from funcionariokackupinsert
	select * from funcionariokackupdelete
			go 



			select  * from sysobjects where type = 'TR';



