CREATE TABLE [dbo].[AsaeWebEventos] (
    [Id]            INT            IDENTITY (1, 1) NOT NULL,
    [Nombre]        VARCHAR (250)  NULL,
    [FechaInicio]   DATETIME       NULL,
    [FechaFin]      DATETIME       NULL,
    [Clave]         VARCHAR (250)  NULL,
    [Password]      VARCHAR (250)  NULL,
    [Descripcion]   VARCHAR (MAX)  NULL,
    [Activo]        BIT            NULL,
    [FechaRegistro] DATETIME       NULL,
    [ClaveEvento]   NVARCHAR (150) NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

