CREATE TABLE [dbo].[UsuariosDetalle] (
    [Id]             INT            IDENTITY (1, 1) NOT NULL,
    [IdUsuario]      INT            NULL,
    [Telefono]       NVARCHAR (50)  NULL,
    [Celular]        NVARCHAR (50)  NULL,
    [Empresa]        INT            NULL,
    [Direccion]      NVARCHAR (50)  NULL,
    [Ciudad]         NVARCHAR (50)  NULL,
    [Notas]          NVARCHAR (MAX) NULL,
    [FisicaMoral]    INT            CONSTRAINT [DF_UsuariosDetalle_InternoExterno] DEFAULT ((0)) NULL,
    [RFC]            NVARCHAR (18)  NULL,
    [InternoExterno] INT            CONSTRAINT [DF_UsuariosDetalle_InternoExterno_1] DEFAULT ((0)) NULL
);



