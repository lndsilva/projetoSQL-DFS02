-- apagando bd se existir
drop database dbLojaDF02;

-- criando bd
create database dbLojaDF02;

-- acessando bd
use dbLojaDF02;

-- visualizando banco de dados
show databases;

-- criando as tabelas no bd
create table tbFuncionarios(
codFunc int not null auto_increment,
nome varchar(100) not null,
email varchar(100),
cpf char(14) not null unique,
telCel char(10),
logradouro varchar(100),
numero char(10),
cep char(9),
bairro varchar(100),
cidade varchar(100),
estado char(2),
primary key(codFunc)
);

create table tbFornecedores(
codForn int not null auto_increment,
nome varchar(100),
email varchar(100),
cnpj char(16) not null unique,
primary key(codForn)
);

create table tbClientes(
codCli int not null auto_increment,
nome varchar(100),
email varchar(100),
cpf char(14) not null unique,
primary key(codCli)
);

create table tbUsuarios(
codUsu int auto_increment,
nome varchar(50) not null,
senha varchar(20) not null,
codFunc int not null,
primary key(codUsu),
foreign key(codFunc) references tbFuncionarios(codFunc)
);

create table tbProdutos(
codProd int not null auto_increment,
descricao varchar(100),
valor decimal(9,2),
quantidade int,
dataEntr date,
horaEntr time,
codForn int not null,
primary key(codProd),
foreign key(codForn) references tbFornecedores(codForn));

create table tbVendas(
codVend int not null auto_increment,
valor decimal(9,2),
data date,
hora time,
quantidade int,
codUsu int not null,
codProd int not null,
codCli int not null,
primary key(codVend),
foreign key(codUsu) references tbUsuarios(codUsu),
foreign key(codProd) references tbProdutos(codProd),
foreign key(codCli) references tbClientes(codCli)
);

-- visualizando as tabelas criadas
show tables;

-- visualizando as estruturas das tabelas

desc tbFuncionarios;
desc tbFornecedores;
desc tbClientes;
desc tbUsuarios;
desc tbProdutos;
desc tbVendas;



-- inserindo registros nas tabelas
insert into tbFuncionarios(nome,email,cpf,telCel,logradouro,
	numero,cep,bairro,cidade,estado)
	values('Maria Gagrielly Bejamim',
		'maria.gbenjamim@hotmail.com','478.856.875-85',
		'98523-8547','Rua Dr. Antônio Bento','355',
		'04750-000','Santo Amaro','São Paulo','SP');
insert into tbFuncionarios(nome,email,cpf,telCel,logradouro,
	numero,cep,bairro,cidade,estado)
	values('Ana Frios Delgado Matarazzo',
		'ana.fdMatarazzo@hotmail.com','278.857.764-74',
		'92384-4785','Rua da Alegria','135',
		'04751-000','Santo Amaro','São Paulo','SP');

insert into tbUsuarios(nome,senha,codFunc)
	values('maria.gabrielly','deximbranco',1);
insert into tbUsuarios(nome,senha,codFunc)
	values('ana.fdmatarazzo','123456',2);

-- visualizando os registros nos campos das tabelas

select * from tbFuncionarios;
select * from tbUsuarios;





