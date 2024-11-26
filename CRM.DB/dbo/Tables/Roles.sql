CREATE TABLE [dbo].[Roles] (
    [Id]            INT            IDENTITY (1, 1) NOT NULL,
    [Nombre]        NVARCHAR (50)  NULL,
    [Observaciones] NVARCHAR (MAX) NULL,
    [Activo]        BIT            NULL,
    [PaginaInicio]  NVARCHAR (150) NULL,
    CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED ([Id] ASC)
);



