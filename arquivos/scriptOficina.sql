-- criando o banco de dados e as tabelas 
create database oficina;
use oficina;

create table Cliente (
	idCliente int not null auto_increment primary key,
	CPF CHAR (15) not null
	);
    drop table Mecânico;
    create table Mecânico(
	CodMecânico int not null auto_increment primary key,
	Nome varchar(45) not null,
	Endereço varchar (100) not null,
	Especialidade varchar(45) not null
	);

create table Equipe_de_Mecânicos(
	idEquipe int not null auto_increment primary key,
    CodMecânico int not null,
    constraint fk_CodMecânico foreign key (CodMecânico) references Mecânico (CodMecânico) 
	);

create table Veículo(
	idVeículo int not null auto_increment primary key,
	idCliente int not null,
	idEquipe int not null,
	constraint fk_idcliente foreign key (idCliente) references Cliente (idCliente) ,
	constraint fk_idEquipe foreign key (idEquipe) references Equipe_de_Mecânicos (idEquipe) 
	);



create table Mecânicos_Equipe (
	idEquipe int not null, 
	CodMecânico int not null,
	constraint fk_idiEquipe foreign key (idEquipe) references Equipe_de_Mecânicos (idEquipe),
	constraint fk_CodiMecânico foreign key (CodMecânico) references Mecânico (CodMecânico)
	);

create table Ordem_de_Serviço(
	idOS int not null auto_increment primary key,
	Data_de_Emissão date not null,
	ValorOS float not null,
	ValorMãoDeObra float not null,
	idCliente int not null,
	idEquipe int not null,
	constraint fk_iddCliente foreign key (idCliente) references Cliente (idCliente),
	constraint fk_iddEquipe foreign key (idEquipe) references Equipe_de_Mecânicos (idEquipe) 
);

create table Serviço(
	idServiço int not null auto_increment primary key,
	Nome varchar (45)
);

create table Analise_de_Serviço(
	idOS int not null,
	idServiço int not null,
	constraint fk_idOS foreign key (idOS) references Ordem_de_Serviço (idOS),
	constraint fk_idServiço foreign key (idServiço) references Serviço (idServiço)
);

create table Peça(
	idPeça int not null auto_increment primary key,
	ValorPeça float not null,
	Nome varchar(45)
);

create table Peça_OS (
	idOS int not null,
	idPeça int not null,
	constraint fk_iddOS foreign key (idOS) references Ordem_de_Serviço (idOS),
	constraint fk_iddPeça foreign key (idPeça) references Peça (idPeça)
);
