create database VETERINARIO_AGORAVAI
GO

use VETERINARIO_AGORAVAI
GO
CREATE TABLE Cliente(
	ID_CLIENTE INT PRIMARY KEY IDENTITY,
	NOME VARCHAR(40) NOT NULL,
	CEP CHAR(8) NOT NULL,
	UF CHAR(2) NOT NULL,
	CIDADE VARCHAR(20) NOT NULL,
	TELEFONE VARCHAR(11) NOT NULL
)
GO

CREATE TABLE Pet(
	ID_PET INT PRIMARY KEY IDENTITY,
	NOME VARCHAR(10) NOT NULL,
	DATA_NASC DATE NOT NULL,
	RACA VARCHAR(20) NOT NULL,
	idCliente INT NOT NULL
GO

CREATE TABLE Exame(
	ID_EXAME INT NOT NULL,
	ID_MEDICO INT NOT NULL,
	DATA_EXAME DATE NOT NULL,
	idAssistente INT NOT NULL,
	idDiagnostico INT NOT NULL,
	idPet INT NOT NULL,
	idCirurgia INT NOT NULL,
	idTratamento INT NOT NULL
)
GO
INSERT INTO Exame VALUES(1,2,'2012-03-08',1,2,3,4,1)
go

CREATE TABLE MedVeterinario(
	ID_MEDICO INT PRIMARY KEY IDENTITY,
	NOME VARCHAR(40) NOT NULL,
	IDADE INT NOT NULL,
	CRMV INT NOT NULL
)
GO

CREATE TABLE Assistente(
	ID_ASSIST INT PRIMARY KEY IDENTITY,
	NOME VARCHAR(40) NOT NULL,
	IDADE INT NOT NULL,
	REG_ASSIST INT NOT NULL
)
GO

CREATE TABLE Remedio(
    ID_REMEDIO INT PRIMARY KEY IDENTITY,
    NOME VARCHAR(20) NOT NULL,
    VALIDADE DATE NOT NULL,
    FABRICANTE VARCHAR(30) NOT NULL,
	idTratamento INT NOT NULL
)
GO

CREATE TABLE Tratamento(
    ID_TRATAMENTO INT PRIMARY KEY IDENTITY,
    TIPO VARCHAR(20) NOT NULL
)
GO

CREATE TABLE Diagnostico(
    ID_DIAGNOSTICO INT PRIMARY KEY IDENTITY,
    TIPO VARCHAR(20) NOT NULL
)
GO

CREATE TABLE Cirurgia(
    ID_CIRURGIA INT PRIMARY KEY IDENTITY,
    DATA_CIRURGIA DATE NOT NULL
)
GO

CREATE TABLE Gastro(
    ID_CIRURGIA INT PRIMARY KEY IDENTITY,
    REGIAO_INTESTINAL VARCHAR(40) NOT NULL
)
GO

CREATE TABLE Cardiologia(
    ID_CIRURGIA INT PRIMARY KEY IDENTITY,
    REGIAO_DO_CORACAO VARCHAR(40) NOT NULL
)
GO

CREATE TABLE Ortopedia(
    ID_CIRURGIA INT PRIMARY KEY IDENTITY,
    REGIAO_OSSEA VARCHAR(40) NOT NULL
)
GO

ALTER TABLE Pet ADD CONSTRAINT FK_Pet_Cliente
FOREIGN KEY(idCliente) REFERENCES CLIENTE(ID_CLIENTE)
GO

ALTER TABLE Exame ADD CONSTRAINT PK_MedVeterinarioXExame
PRIMARY KEY(ID_MEDICO, ID_EXAME)
GO

ALTER TABLE Exame ADD CONSTRAINT FK_Exame_Assistente
FOREIGN KEY(idAssistente) REFERENCES Assistente(ID_ASSIST)
GO

ALTER TABLE Exame ADD CONSTRAINT FK_Exame_Pet
FOREIGN KEY(idPet) REFERENCES Pet(ID_PET)
GO

ALTER TABLE Exame ADD CONSTRAINT FK_Exame_Diagnostico
FOREIGN KEY(idDiagnostico) REFERENCES Diagnostico(ID_DIAGNOSTICO)
GO

ALTER TABLE Exame ADD CONSTRAINT FK_Exame_Cirurgia
FOREIGN KEY(idCirurgia) REFERENCES Cirurgia(ID_CIRURGIA)
GO

ALTER TABLE Exame ADD CONSTRAINT FK_Exame_Tratamento
FOREIGN KEY(idTratamento) REFERENCES Tratamento(ID_Tratamento)
GO

ALTER TABLE Remedio ADD CONSTRAINT FK_Remedio_Tratamento
FOREIGN KEY(idTratamento) REFERENCES Tratamento(ID_TRATAMENTO)
GO

/*CLIENTE*/
INSERT INTO CLIENTE VALUES('CARLOS', '12345678', 'SP', 'CAMPINAS', '12345678910')
INSERT INTO CLIENTE VALUES('CARLOS', '12869678', 'SP', 'CAPIVARI', '65432445610')
INSERT INTO CLIENTE VALUES('CARLOS', '11234678', 'MG', 'ALFENAS', '12343453430')
INSERT INTO CLIENTE VALUES('CELIA', '12345634', 'RJ', 'RIO', '67845678910')
INSERT INTO CLIENTE VALUES('HEITOR', '12335678', 'RJ', 'RIO', '78575678910')
INSERT INTO CLIENTE VALUES('HEITOR', '12347899', 'SC', 'FLORIANOPOLIS', '12342342310')
INSERT INTO CLIENTE VALUES('ELAINE', '12345677', 'SP', 'CAMPINAS', '12234234322')
GO

/*PET*/

INSERT INTO PET VALUES('BIBI', '2010-09-07', 'DOBERMAN', 1)
GO
INSERT INTO PET VALUES('BOBI', '2011-09-07', 'DOBERMAN', 2)
INSERT INTO PET VALUES('BIBI', '2002-08-07', 'DOBERMAN', 3)
INSERT INTO PET VALUES('ROB', '2010-09-03', 'DOBERMAN', 4)
INSERT INTO PET VALUES('BETO', '2015-01-01', 'DOBERMAN', 5)
INSERT INTO PET VALUES('BARTO', '2014-02-07', 'DOBERMAN', 6)
INSERT INTO PET VALUES('ACA', '2017-08-09', 'DOBERMAN', 7)
GO
INSERT INTO PET VALUES('ACA', '2017-08-09', 'pastor', 7)
INSERT INTO PET VALUES('ACA', '2017-08-09', 'pastor', 7)
INSERT INTO PET VALUES('ACA', '2017-08-09', 'bulldog', 7)
INSERT INTO PET VALUES('ACA', '2017-08-09', 'salsicha', 7)
INSERT INTO PET VALUES('ACA', '2017-08-09', 'salsicha', 7)
INSERT INTO PET VALUES('ACA', '2017-08-09', 'chow', 7)
go
/*MEDICO*/
INSERT INTO MedVeterinario VALUES('ROBERTO', 43, 1234)
INSERT INTO MedVeterinario VALUES('HEITOR', 34, 53467)
INSERT INTO MedVeterinario VALUES('LETICIA', 65, 8567)
INSERT INTO MedVeterinario VALUES('CINTIA', 24, 23467)
GO
INSERT INTO MedVeterinario VALUES('FABIO', 56, 15267)
INSERT INTO MedVeterinario VALUES('CAIO', 32, 23467)
INSERT INTO MedVeterinario VALUES('LUCAS', 35, 46723)
INSERT INTO MedVeterinario VALUES('HENRIQUE', 31, 12367)
GO

/*ASSISTENTE*/
INSERT INTO ASSISTENTE VALUES('Lara da Silva Sousa', 23, 1111)
INSERT INTO ASSISTENTE VALUES('Joao da Silva', 24, 1121)
INSERT INTO ASSISTENTE VALUES('Carla Santana', 33, 1113)
INSERT INTO ASSISTENTE VALUES('George dos Santos', 13, 2412)
INSERT INTO ASSISTENTE VALUES('Alisson Sousa', 43, 2401)
INSERT INTO ASSISTENTE VALUES('Guilherme Akashi Sousa', 53, 1523)
GO
INSERT INTO ASSISTENTE VALUES('MATEUS', 56, 21231)
INSERT INTO ASSISTENTE VALUES('CAIO', 41, 32123)
INSERT INTO ASSISTENTE VALUES('LUANA', 42, 35621)
INSERT INTO ASSISTENTE VALUES('SILVIA', 59, 40123)
INSERT INTO ASSISTENTE VALUES('JORGE', 34, 30192)
GO

/*TRATAMENTO*/
INSERT INTO TRATAMENTO VALUES('A')
INSERT INTO TRATAMENTO VALUES('B')
INSERT INTO TRATAMENTO VALUES('C')
GO

/*DIAGNOSTICO*/
INSERT INTO DIAGNOSTICO VALUES('E')
INSERT INTO DIAGNOSTICO VALUES('F')
INSERT INTO DIAGNOSTICO VALUES('G')
INSERT INTO DIAGNOSTICO VALUES('H')
INSERT INTO DIAGNOSTICO VALUES('I')
go

INSERT INTO CIRURGIA VALUES('2011-02-09')
INSERT INTO CIRURGIA VALUES('2012-03-03')
INSERT INTO CIRURGIA VALUES('2013-04-04')
INSERT INTO CIRURGIA VALUES('2014-05-02')
INSERT INTO CIRURGIA VALUES('2014-08-01')
INSERT INTO CIRURGIA VALUES('2017-02-06')
INSERT INTO CIRURGIA VALUES('2012-12-21')
INSERT INTO CIRURGIA VALUES('2011-03-02')
GO

INSERT INTO Ortopedia VALUES('A')
INSERT INTO Ortopedia VALUES('B')
INSERT INTO Ortopedia VALUES('C')
INSERT INTO Ortopedia VALUES('D')
INSERT INTO Ortopedia VALUES('E')
INSERT INTO Ortopedia VALUES('F')
INSERT INTO Ortopedia VALUES('G')

INSERT INTO Gastro VALUES('A')
INSERT INTO Gastro VALUES('B')
INSERT INTO Gastro VALUES('C')
INSERT INTO Gastro VALUES('D')
INSERT INTO Gastro VALUES('E')
INSERT INTO Gastro VALUES('F')
INSERT INTO Gastro VALUES('G')

INSERT INTO Cardiologia VALUES('A')
INSERT INTO Cardiologia VALUES('B')
INSERT INTO Cardiologia VALUES('C')
INSERT INTO Cardiologia VALUES('D')
INSERT INTO Cardiologia VALUES('E')
INSERT INTO Cardiologia VALUES('F')
INSERT INTO Cardiologia VALUES('G')
GO

INSERT INTO Exame VALUES(1, 2, '2012-02-02', 1, 5, 2, 1, 1)
go
INSERT INTO Exame VALUES(2, 1, '2012-02-02', 2, 2, 1, 2, 2)
INSERT INTO Exame VALUES(3, 2, '2012-02-02', 5, 3, 4, 3, 3)

INSERT INTO Exame VALUES(4, 2, '2013-03-02', 3, 3, 4, 3, 3)

INSERT INTO Exame VALUES(5, 2, '2014-04-02', 4, 1, 6, 6, 1)
INSERT INTO Exame VALUES(6, 2, '2021-01-02', 6, 4, 5, 4, 2)

INSERT INTO Exame VALUES(7, 2, '2018-06-02', 5, 5, 3, 5, 3)
GO


select p.nome,c.nome,c.telefone, c.ID_cliente, p.id_pet
from pet p
inner join cliente c
on p.idCliente = c.ID_CLIENTE
where p.RACA = 'doberman'
go

select e.id_exame, m.nome
from exame e
inner join MedVeterinario m
on e.ID_MEDICO = m.ID_MEDICO
where e.data_exame = '2012-02-02'
go

select count(p.RACA) as 'numero de caes', p.raca
from pet p
group by RACA
go

select count(m.nome) as 'Qtde de veterinarios que trabalharam no dia',e.data_exame  
from MedVeterinario m
inner join exame e
on m.ID_MEDICO = e.ID_MEDICO
group by DATA_EXAME
go


/*criar uma trigger que ao fazer um update da data de um exame, seja adicionado em outra tabela uma tupla
  com a data mudada para ficar no historico
  Para isso fazer uma tabela de historico de exame
  */



/* PRIMEIRA TRIGGER PRONTA */

create table hist_exame(
	id_exame int not null,
	id_medico int not null,
	data_exame_antigo date not null,
	data_exame_novo date not null
)
go



create trigger tg_nova_data_exame
on dbo.Exame
after update as
if update(data_exame)

	declare
		@dataNova date

	select @dataNova = i.data_exame
	from inserted i

	if(@dataNova >= getdate())
	begin
		insert into hist_exame
		(id_exame, id_medico, data_exame_antigo, data_exame_novo)
		select d.id_exame, d.id_medico, d.data_exame, i.data_exame
		from deleted d, inserted i
		where d.id_exame = i.id_exame and d.id_medico = i.id_medico
	end

	if(@dataNova < getdate())
	begin
		raiserror('Data não pode ser anterior a data atual', 16,1)
		rollback transaction
	end
go

update exame set data_exame = '2022-08-13'
where id_exame = 2 and id_medico = 1
go



select * from exame
select * from hist_exame


/* SEGUNDA TRIGGER */

/* Fazer uma trigger que antes de adicionar um novo remedio, verifique se o remédio
   está vencido, se sim, emite uma mensagem e manda para outra tabela de remedios a serem devolvidos ao fabricante*/

create table remedio_vencido(
	id_remedio_vencido int,
	nome varchar(30),
	validade date,
	fabricante varchar(30)
)

/* trigger 2 protna
*/

create trigger data_remedio
on dbo.remedio
for insert as

	declare @data date

	select @data = i.validade
	from inserted i
	
	if(@data < getdate())
	begin
		raiserror('Remédio vencido contate o fabricante', 16,1)
		
		insert into remedio_vencido
		(id_remedio_vencido, nome, validade, fabricante)
		select i.id_remedio, i.nome, i.validade, i.fabricante
		from inserted i
		where id_remedio = i.id_remedio
	end
go

insert into remedio values('remedio ultra', '2012-03-12', 'JJ', 1)

insert into remedio values('Blast', '2022-01-14', 'Pax company', 3)

select * from remedio_vencido

select * from remedio



/* criar uma view que mostre somente Nome do cliente, nome do pet e o nome do medico */

create view cliente_pet_medico
as
select
	c.ID_CLIENTE as 'Identificação',
	c.nome as 'Nome Cliente', 
	p.nome as 'Nome Pet',
	m.nome as 'Nome Médico'
from cliente c
inner join pet p
on c.ID_CLIENTE = p.idCliente
inner join exame e
on p.ID_PET = e.idpet
inner join MedVeterinario m
on m.ID_MEDICO = e.ID_MEDICO
go