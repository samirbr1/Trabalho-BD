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
    idProfessor INT,
    idCurso INT,
	FOREIGN KEY(idProfessor) REFERENCES Professor(idProfessor),
	FOREIGN KEY (idCurso)REFERENCES Curso(idCurso),
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
    idTurma INT,
    idEstudante INT, 
    FOREIGN KEY(idTurma)REFERENCES Turma(idTurma),
    FOREIGN KEY(idEstudante) REFERENCES Estudante(idEstudante),
    PRIMARY KEY(idTurmaestudante)
);

CREATE TABLE Professor
(
    idProfessor INT,
    Descricao VARCHAR(300),
    Pnome VARCHAR(20),
    Minicial CHAR,
    Unome VARCHAR(20),
    Sexo CHAR,
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
    idEstudante INT,
    Cpf CHAR(11),
    datanasc DATE,
    CEP char(9),
    Endereco VARCHAR(100),
    Pnome VARCHAR(20),
    Minicial CHAR,
    Unome VARCHAR(20),
    Sexo CHAR,
    email VARCHAR(50),
    celular VARCHAR(15),
    PRIMARY KEY(idEstudante)
);

CREATE TABLE Curso
(
    idCurso INT,
    Aulas INT,
    Descricao VARCHAR(300),
    termo VARCHAR(100),
    PRIMARY KEY(idCurso)
);

CREATE TABLE Pagamento
(
    idPagamento INT,
    dataPagamento DATETIME,
    Quantia  DECIMAL(10, 2),
    statusPagamento VARCHAR(20),
    idMetodopagamento INT,
    idEstudante INT,
    idTurma INT,
    FOREIGN KEY(idMetodopagamento) REFERENCES MetodoPagamento(idMetodopagamento),
    FOREIGN KEY(idEstudante) REFERENCES Estudante(idEstudante),
    FOREIGN KEY(idTurma) REFERENCES Turma(idTurma),
    PRIMARY KEY(idPagamento)
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
    Sexo CHAR,
    Datanasc DATE,
    Salario DECIMAL(10,2),
    email VARCHAR(50),
    celular VARCHAR(15),
	PRIMARY KEY(idFuncionario)
);


