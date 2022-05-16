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
    idCurso INT,
    idProfessor INT,	
    Descricao VARCHAR(100),
    data_inicio DATE, 
    data_termino DATE,
    idProfessor INT,
    FOREIGN KEY (idProfessor) REFERENCES Professor(idProfessor)
		ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (idCurso) REFERENCES Curso(idCurso)
		ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY(idTurma)
);

CREATE TABLE diasAulaTurma
(
    idTurma INT,
    idDiaAula INT,
    Horario VARCHAR(50),    /*ex: 9:15 - 10:50*/
    FOREIGN KEY (idTurma) REFERENCES Turma(idTurma)
		ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (idDiaAula) REFERENCES DiadeAula(idDia)
		ON DELETE CASCADE ON UPDATE CASCADE,
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
    idEstudante INT REFERENCES,
    FOREIGN KEY (idTurma) REFERENCES Turma(idTurma)
		ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY	 (idEstudante) REFERENCES Estudante(idEstudante)
		ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY(idTurmaestudante)
);

CREATE TABLE Professor
(
    idProfessor INT,
    Curriculo VARCHAR(300),
    PRIMARY KEY(idProfessor)
);

CREATE TABLE Estudante
(
    idEstudante INT,
    Cpf CHAR(11),
    datanasc DATE,
    Endereco VARCHAR(100),
    Pnome VARCHAR(20),
    Minicial CHAR,
    Unome VARCHAR(20),
    Sexo CHAR,
    email VARCHAR(50),
    celular VARCHAR(15),
    PRIMARY KEY(idEstudante, Cpf)
);

CREATE TABLE Curso
(
    idCurso INT,
    Aulas INT,
    Descricao VARCHAR(300),
    periodoEletivo VARCHAR(100),
    PRIMARY KEY(idCurso)
);

CREATE TABLE Pagamento
(
    idPagamento  INT,
    idEstudante INT,
    idTurma INT, 
    idMetodopagamento INT,
    dataPagamento DATETIME,
    Quantia  DECIMAL(10, 2),
    statusPagamento VARCHAR(20),
    
    FOREIGN KEY (idMetodopagamento) REFERENCES MetodoPagamento(idMetodopagamento)	
		ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (idEstudante) REFERENCES Estudante(idEstudante)
		ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (idTurma) REFERENCES Turma(idEstudante)
		ON DELETE CASCADE ON UPDATE CASCADE,
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
    endereco VARCHAR(50),
    PRIMARY KEY(idFuncionario, Cpf)
);


