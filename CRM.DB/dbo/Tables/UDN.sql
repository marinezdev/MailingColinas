CREATE TABLE [dbo].[UDN] (
    [Id]          INT            IDENTITY (1, 1) NOT NULL,
    [Nombre]      NVARCHAR (50)  NULL,
    [Descripcion] NVARCHAR (150) NULL,
    [Activo]      BIT            CONSTRAINT [DF_UDN_Activo] DEFAULT ((1)) NULL
);



