CREATE TABLE [dbo].[AsaeWebUsuarioToken] (
    [Id]            INT           IDENTITY (1, 1) NOT NULL,
    [IdUsuario]     INT           NOT NULL,
    [IdEvento]      INT           NOT NULL,
    [Token]         VARCHAR (250) NULL,
    [Activo]        BIT           NULL,
    [FechaRegistro] DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    FOREIGN KEY ([IdEvento]) REFERENCES [dbo].[AsaeWebEventos] ([Id]),
    FOREIGN KEY ([IdUsuario]) REFERENCES [dbo].[AsaeWebUsuariosEventos] ([Id])
);

