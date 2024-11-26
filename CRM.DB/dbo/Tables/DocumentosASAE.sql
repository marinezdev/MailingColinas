CREATE TABLE [dbo].[DocumentosASAE] (
    [Id]               INT            IDENTITY (1, 1) NOT NULL,
    [Nombre]           NVARCHAR (250) NULL,
    [IdUsuario]        INT            NULL,
    [Fecha]            DATETIME       CONSTRAINT [DF_DocumentosASAE_Fecha] DEFAULT (getdate()) NULL,
    [Clasificacion]    INT            NULL,
    [Descripcion]      NVARCHAR (500) NULL,
    [Version]          NVARCHAR (50)  NULL,
    [Vigencia]         BIT            NULL,
    [VersionUsuarios]  NVARCHAR (50)  NULL,
    [FechaOficial]     DATETIME       NULL,
    [SubClasificacion] INT            NULL
);





