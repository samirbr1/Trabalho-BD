create schema escola_tecnica;
use escola_tecnica;

/*
Trabalho de Banco de dados 
Alunos: Fabricio Fogaça da Silva Lemos, Felipe Emanuel Ferreira, Samir Barcelos Murad

*/

/*Criação de tabelas*/
CREATE TABLE Turma
(
    idTurma INT,
    Descricao VARCHAR(100),
    data_inicio DATE, 
    data_termino DATE,
    valor DECIMAL(10, 2),
    idProfessor INT REFERENCES Professor(idProfessor),
    idCurso INT REFERENCES Curso(idProfessor),
    PRIMARY KEY(idTurma)
);

CREATE TABLE diasAulaTurma
(
    idTurma INT REFERENCES Turma(idTurma),
    idDiaAula INT REFERENCES DiadeAula(idDia),
    Horario VARCHAR(50),    /*ex: 9:15 - 10:50*/
    PRIMARY KEY (idTurma, idDiaAula)
);

CREATE TABLE DiadeAula 
(
    idDia INT,
    nomeDia VARCHAR(50), /*segunda-feira, terça-feira, etc*/
    PRIMARY KEY(idDia)
); 

CREATE TABLE turmaEstudante
(
    idTurmaestudante INT,
    idTurma INT REFERENCES Turma(idTurma),
    idEstudante INT REFERENCES Estudante(idEstudante),
    PRIMARY KEY(idTurmaestudante)
);

CREATE TABLE Professor
(
    idProfessor INT,
    Descricao VARCHAR(300),
    Pnome VARCHAR(20),
    Minicial CHAR,
    Unome varchar(20),
    Salario DECIMAL(10,2),
    Cpf CHAR(11) NOT NULL,
    Datanasc DATE,
    Email VARCHAR(50),
    celular VARCHAR(15),
    endereco VARCHAR(100) NOT NULL,
    PRIMARY KEY(idProfessor)
);

CREATE TABLE Estudante
(
    idEstudante INT PRIMARY KEY,
    Cpf CHAR(11),
    datanasc DATE,
    CEP char(9),
    Endereco VARCHAR(100),
    Pnome VARCHAR(20),
    Minicial CHAR,
    Unome VARCHAR(20),
    email VARCHAR(50),
    celular VARCHAR(15),
    PRIMARY KEY(idEstudante)
);

CREATE TABLE Curso
(
    idCurso INT,
    Aulas INT,
    Descricao VARCHAR(300),
    term VARCHAR(100),  /*não sei*/
    PRIMARY KEY(idCurso)
);

CREATE TABLE Pagamento
(
    idPagamento  INT PRIMARY KEY,
    dataPagamento DATETIME,
    Quantia  DECIMAL(10, 2),
    idMetodopagamento INT REFERENCES MetodoPagamento(idMetodopagamento),
    statusPagamento VARCHAR(20),
    idEstudante INT REFERENCES Estudante(idEstudante),
    idTurma INT REFERENCES Turma(idEstudante)
);

CREATE TABLE MetodoPagamento
(
    idMetodopagamento INT,
    metodo VARCHAR(30),
    PRIMARY KEY(idMetodopagamento)
);

CREATE TABLE Funcionario
(
    idFuncionario INT,
    Cpf CHAR(11),
    funcao VARCHAR(120),
    Pnome VARCHAR(50),
    Minicial CHAR,
    Unome VARCHAR(50),
    Datanasc DATE,
    Salario DECIMAL(10,2),
    email VARCHAR(50),
    celular VARCHAR(15),
    PRIMARY KEY(idFuncionario)
);


