﻿CREATE TABLE [dbo].[Contactos] (
    [Id]                   INT            IDENTITY (1, 1) NOT NULL,
    [Nombre]               NVARCHAR (50)  NULL,
    [ApellidoPaterno]      NVARCHAR (50)  NULL,
    [ApellidoMaterno]      NVARCHAR (50)  NULL,
    [Correo]               NVARCHAR (150) NULL,
    [Telefono]             NVARCHAR (50)  NULL,
    [Celular]              NVARCHAR (50)  NULL,
    [Direccion]            NVARCHAR (250) NULL,
    [Ciudad]               NVARCHAR (150) NULL,
    [Estado]               INT            NULL,
    [Cargo]                NVARCHAR (50)  NULL,
    [FechaCumpleaños]      NVARCHAR (50)  NULL,
    [TipoContacto]         INT            NULL,
    [Notas]                NVARCHAR (MAX) NULL,
    [Alta]                 DATETIME       CONSTRAINT [DF_Contactos_Alta] DEFAULT (getdate()) NULL,
    [UsuarioAlta]          INT            NULL,
    [ContactoUsuario]      INT            CONSTRAINT [DF_Contactos_ContactoUsuario] DEFAULT ((0)) NULL,
    [IdUsuarioResponsable] INT            NULL,
    [IdConfiguracion]      INT            NULL,
    [IdUDN]                INT            NULL,
    [IdArea]               INT            NULL,
    [CP]                   NVARCHAR (5)   NULL,
    [Pais]                 INT            NULL,
    [Activo]               BIT            CONSTRAINT [DF_Contactos_Activo] DEFAULT ((1)) NULL,
    [Ingreso]              INT            NULL,
    [Edad]                 INT            NULL,
    [Sexo]                 CHAR (1)       NULL,
    CONSTRAINT [PK_Contactos] PRIMARY KEY CLUSTERED ([Id] ASC)
);





