CREATE TABLE [dbo].[DocumentosASAEHistorico] (
    [Id]                INT            IDENTITY (1, 1) NOT NULL,
    [IdDocumento]       INT            NULL,
    [Nombre]            NVARCHAR (150) NULL,
    [Version]           INT            NULL,
    [Fecha]             DATETIME       CONSTRAINT [DF_DocumentosASAEHistorico_Fecha] DEFAULT (getdate()) NULL,
    [IdUsuario]         INT            NULL,
    [IdUsuarioPosicion] INT            NULL,
    [Comentarios]       NVARCHAR (350) NULL
);

