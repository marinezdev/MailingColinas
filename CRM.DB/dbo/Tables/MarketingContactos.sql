CREATE TABLE [dbo].[MarketingContactos] (
    [Id]          INT            IDENTITY (1, 1) NOT NULL,
    [IdContacto]  INT            NULL,
    [IdCampaña]   INT            NULL,
    [Seguimiento] NVARCHAR (500) NULL
);

