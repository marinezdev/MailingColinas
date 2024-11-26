CREATE TABLE [dbo].[DocumentosASAEUsuarios] (
    [Id]              INT      IDENTITY (1, 1) NOT NULL,
    [IdDocumento]     INT      NULL,
    [IdUsuario]       INT      NULL,
    [IdClasificacion] INT      NULL,
    [Fecha]           DATETIME CONSTRAINT [DF_DocumentosASAEUsuarios_Fecha] DEFAULT (getdate()) NULL
);

