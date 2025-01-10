CREATE DATABASE Musterbank;
GO
USE Musterbank;
-- Einfache Konto-Tabelle erstellen
CREATE TABLE Account (
	AccountID INT IDENTITY(1,1) NOT NULL,
	CustomerName NVARCHAR(200) NOT NULL,
	Currency NCHAR(20) NOT NULL DEFAULT 'CHF',
	AccountBalance MONEY NOT NULL DEFAULT 0,
    PRIMARY KEY (AccountID)
);
GO
-- Paar Beispieldaten einfügen
INSERT INTO Account (CustomerName, AccountBalance) VALUES 
('Max Mustermann', 1200), 
('Jane Doe', 1500);
GO