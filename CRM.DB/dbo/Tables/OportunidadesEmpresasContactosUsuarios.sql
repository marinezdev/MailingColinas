CREATE TABLE [dbo].[OportunidadesEmpresasContactosUsuarios] (
    [IdOportunidad]   INT NULL,
    [IdEmpresa]       INT NULL,
    [IdContacto]      INT NULL,
    [IdUsuario]       INT NULL,
    [IdConfiguracion] INT NULL,
    CONSTRAINT [FK_OportunidadesActividadesEmpresasContactosUsuarios_Contactos] FOREIGN KEY ([IdContacto]) REFERENCES [dbo].[Contactos] ([Id]),
    CONSTRAINT [FK_OportunidadesActividadesEmpresasContactosUsuarios_Empresas] FOREIGN KEY ([IdEmpresa]) REFERENCES [dbo].[Empresas] ([Id]),
    CONSTRAINT [FK_OportunidadesActividadesEmpresasContactosUsuarios_Oportunidades] FOREIGN KEY ([IdOportunidad]) REFERENCES [dbo].[Oportunidades] ([Id]),
    CONSTRAINT [FK_OportunidadesActividadesEmpresasContactosUsuarios_Usuarios] FOREIGN KEY ([IdUsuario]) REFERENCES [dbo].[Usuarios] ([Id])
);

