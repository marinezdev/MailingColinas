CREATE TABLE [dbo].[MarketingSeguimiento] (
    [Id]          INT            IDENTITY (1, 1) NOT NULL,
    [IdCampaña]   INT            NULL,
    [Fecha]       DATETIME       CONSTRAINT [DF_MarketingSeguimiento_Fecha] DEFAULT (getdate()) NULL,
    [Seguimiento] NVARCHAR (MAX) NULL
);

