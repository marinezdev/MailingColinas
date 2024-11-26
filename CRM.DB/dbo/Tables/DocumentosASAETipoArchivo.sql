CREATE TABLE [dbo].[DocumentosASAETipoArchivo] (
    [Id]              INT            IDENTITY (1, 1) NOT NULL,
    [Extensiones]     NVARCHAR (150) NULL,
    [TamMaxPermitido] INT            NULL,
    [Permitir]        BIT            NULL
);

