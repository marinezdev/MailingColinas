CREATE TABLE [dbo].[Marketing] (
    [Id]            INT            IDENTITY (1, 1) NOT NULL,
    [Nombre]        NVARCHAR (150) NULL,
    [NuevaAnterior] INT            NULL,
    [Inicio]        DATETIME       NULL,
    [Fin]           DATETIME       NULL,
    [Registro]      DATETIME       CONSTRAINT [DF_Marketing_Registro] DEFAULT (getdate()) NULL,
    [Objetivo]      VARCHAR (MAX)  NULL,
    [Medio]         INT            NULL,
    [Estado]        INT            NULL,
    [Usuario]       INT            NULL
);

