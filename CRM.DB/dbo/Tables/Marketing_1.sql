CREATE TABLE [dbo].[Marketing] (
    [Id]            INT            IDENTITY (1, 1) NOT NULL,
    [Consecutivo]   NVARCHAR (50)  NULL,
    [Nombre]        NVARCHAR (150) NULL,
    [NuevaAnterior] INT            NULL,
    [Inicio]        DATETIME       NULL,
    [Fin]           DATETIME       NULL,
    [Registro]      DATETIME       CONSTRAINT [DF_Marketing_Registro] DEFAULT (getdate()) NULL,
    [Objetivo]      VARCHAR (MAX)  NULL,
    [Medio]         INT            NULL,
    [Estado]        INT            NULL,
    [Usuario]       INT            NULL,
    [Correo]        INT            NULL,
    [Facebook]      INT            NULL,
    [Linkedin]      INT            NULL,
    [Llamada]       INT            NULL,
    [PaginaASAE]    INT            NULL,
    [Envios]        DATETIME       NULL,
    [InicioEvento]  DATE           NULL,
    [FinEvento]     DATE           NULL,
    [HoraInicio]    NVARCHAR (8)   NULL,
    [HoraFin]       NVARCHAR (8)   NULL,
    [Ubicacion]     NVARCHAR (50)  NULL,
    [Descripcion]   NVARCHAR (150) NULL
);



