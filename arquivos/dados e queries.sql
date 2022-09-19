-- inserindo dados na tabelas e fazendo queries

insert into Cliente (CPF) values 
	('539.435.630-06'),
	('140.819.320-50'),
	('693.881.040-05'),
	('753.694.990-12'),
	('166.958.760-61'),
	('368.107.690-13');


insert into Mecânico (Nome, Endereço, Especialidade) values
	('Maria Clara Albuquerque', 'Torre-Recife-PE',' Reparador de sistemas estruturais'),
	('Luiza Alessandra da Silva','Casa Forte-Recife-PE','Reparador de sistemas fluidomecânicos'),
	('Joana Almeida dos Santos','Santo Amaro-Recife-PE','Reparador de carros de Luxo'),
	('João Vitor de Oliveira','Barro-Recife-PE','Reparador de Carros Antigos'),
	('Rennan Carlos de Santana','Dois Irmãos-Recife-PE',' Reparador de sistemas estruturais'),
	('Luiz Rodrigues de Souza','Aflitos-Recife-PE','Reparador de sistemas fluidomecânicos'),
	('Flávio Daniel de Holanda','Várza-Recife-PE','Reparador de carros de Luxo');
    
    select * from Mecânico
    group by Especialidade = Especialidade;
    

insert into Equipe_de_Mecânicos (CodMecânico) values
	('1'),
	('2'),
	('3');
    
    
insert into Veículo (idCliente, idEquipe) values
	('1','2');
    
    
insert into Mecânicos_Equipe (idEquipe, CodMecânico) values
	('1','1'),
	('1','2'),
	('1','3'),
	('1','4');

select * from Mecânico as M
inner join Mecânicos_Equipe as ME;

insert into Ordem_de_Serviço (Data_de_Emissão, ValorOS, ValorMãoDeObra, idCliente, idEquipe) values
	('2022-09-07','130.87','700.00','1','1'),
	('2022-08-08','440.50','600.00','2','2'),
	('2022-09-09','678.90','700.00','3','1'),
	('2022--09-05','1345.98','800.00','4','1');

select*from Ordem_de_Serviço;

select 
avg (ValorOS)as media_valor
 from Ordem_de_Serviço
 group by idOS
 having avg(ValorOS) > 500;

insert into Serviço (Nome) values 
	('Reparo automotivo'),
	('Alinhamento e balanceamento'),
	('Checagem do nível de água no radiador.');

select ValorOS
from Ordem_de_Serviço as ordem
where idCliente = 1;

SELECT CPF
FROM CLIENTE AS C
JOIN Ordem_de_Serviço AS O ON C.idCliente = O.idOS;

insert into Analise_de_Serviço (idOS, idServiço) values
	('1','3'),
	('3','1'),
	('2','2');
    
    select * from Analise_de_Serviço
    group by idOS = idServiço;
    
insert into Peça (ValorPeça, Nome) values 
	('841.25','Eixo virabrequim'),
	('167.80','Amortecedor Dianteiro'),
	('13.90','Vela de ignição'),
	('189.68','Junta de Cabeçote'),
	('165.78','Disco de Freio'),
	('326.00','Radiador de Motor');
    
    select * from Peça where idPeça % 2=0
    order by ValorPeça;

insert into Peça_OS (idOS,idPeça) values
	('1','2'),
	('2','1'),
	('3','3'),
	('3','4');

