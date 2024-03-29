-- BASE DE DATOS CREADA 05/07/2019
-- ELABORADA POR: WILL ALEJANDRO LARA
--				  RUDY ROBERTO ROSA
-- CLASE: PROGRAMACION DE NEGOCIOS

USE tempdb
GO

IF EXISTS(SELECT *FROM sys.databases WHERE NAME = 'Estacionamiento')
BEGIN 
	DROP DATABASE Estacionamiento
END
GO


CREATE DATABASE Estacionamiento
GO

USE Estacionamiento
GO

CREATE SCHEMA Parqueo
GO

CREATE TABLE Parqueo.Vehiculo
(
	Num_Placa NVARCHAR(7) NOT NULL
	CONSTRAINT PK_Vehiculo_Num_Placa PRIMARY KEY CLUSTERED,
	Hora_Ingreso TIME DEFAULT GETDATE() NOT NULL,
	IdTipo_Vehiculo INT NOT NULL
)
GO

CREATE TABLE Parqueo.Tipo_Vehiculo
(
	Id INT IDENTITY (1,1) NOT NULL
	CONSTRAINT PK_Tipo_Vehiculo_Id PRIMARY KEY CLUSTERED,
	Tipo NVARCHAR (10) NOT NULL
)
GO

CREATE TABLE Parqueo.Cobro
(
	Id INT IDENTITY (1,1) NOT NULL
	CONSTRAINT PK_Cobro_Id PRIMARY KEY CLUSTERED,
	Hora_Salida TIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	Monto MONEY NOT NULL
)
GO


ALTER TABLE Parqueo.Vehiculo
	ADD CONSTRAINT
		FK_Parqueo_Vehiculo$TieneUn$Parqueo_Tipo_id					
		FOREIGN KEY (IdTipo_Vehiculo) REFERENCES Parqueo.Tipo_Vehiculo(Id)
		ON UPDATE CASCADE
		ON DELETE NO ACTION
GO

INSERT INTO Parqueo.Tipo_Vehiculo(Tipo)
VALUES  ('Liviana'),
		('Pesada'),
		('Particular')
GO

SELECT * FROM Parqueo.Tipo_Vehiculo
GO

INSERT INTO Parqueo.Vehiculo(Num_Placa,IdTipo_Vehiculo)
VALUES ('HND1234',1),
	   ('HON3214',2),
	   ('HNS3215',3)
GO

SELECT * FROM Parqueo.Cobro
GO

/*UPDATE Parqueo.Tipo_Vehiculo 
Set Tipo = 'Especial'
Where id = 3
go*/

INSERT INTO Parqueo.Cobro (Monto)
VALUES (30.50),
	   (36.50),
	   (56.89)	
GO

