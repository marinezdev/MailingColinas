CREATE TABLE [dbo].[Metricas] (
    [Id]            INT            IDENTITY (1, 1) NOT NULL,
    [Metrica]       NVARCHAR (MAX) NULL,
    [Comprador]     NVARCHAR (MAX) NULL,
    [Criterios]     NVARCHAR (MAX) NULL,
    [Proceso]       NVARCHAR (MAX) NULL,
    [Necesidad]     NVARCHAR (MAX) NULL,
    [Campeon]       NVARCHAR (MAX) NULL,
    [Fulcro]        NVARCHAR (MAX) NULL,
    [Otros]         NVARCHAR (MAX) NULL,
    [IdOportunidad] INT            NULL
);

