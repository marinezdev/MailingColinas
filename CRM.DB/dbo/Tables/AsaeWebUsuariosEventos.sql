CREATE TABLE [dbo].[AsaeWebUsuariosEventos] (
    [Id]              INT           IDENTITY (1, 1) NOT NULL,
    [IdEvento]        INT           NOT NULL,
    [Nombre]          VARCHAR (250) NULL,
    [ApellidoPaterno] VARCHAR (250) NULL,
    [ApellidoMaterno] VARCHAR (250) NULL,
    [NombreEmpresa]   VARCHAR (250) NULL,
    [CorreoEmpresa]   VARCHAR (250) NULL,
    [CorreoPersonal]  VARCHAR (250) NULL,
    [TelefonoMovil]   VARCHAR (30)  NULL,
    [TelefonoLocal]   VARCHAR (30)  NULL,
    [Confirmado]      BIT           NULL,
    [Activo]          BIT           NULL,
    [FechaRegistro]   DATETIME      NULL,
    [Ingreso]         INT           NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    FOREIGN KEY ([IdEvento]) REFERENCES [dbo].[AsaeWebEventos] ([Id])
);




GO
CREATE trigger [dbo].[DispersarContactosExternos]
on [dbo].[AsaeWebUsuariosEventos]
AFTER INSERT
AS
DECLARE @nombre NVARCHAR(50);
DECLARE @apaterno NVARCHAR(50);
DECLARE @amaterno NVARCHAR(50);
DECLARE @obtenido INT;
DECLARE @campaña NVARCHAR(150);
DECLARE @correo1 NVARCHAR(150);
DECLARE @correo2 NVARCHAR(150);
DECLARE @evento INT;
DECLARE @claveevento NVARCHAR(50);
DECLARE @ingreso INT;
DECLARE @idusuario INT;
BEGIN
	--Obtener los valores inciales del contacto que se registró en la tabla externa
	SELECT @correo1=correopersonal FROM INSERTED;
	SELECT @correo2=correoempresa FROM INSERTED;
	SELECT @evento=idevento FROM INSERTED; 
	SELECT @ingreso=ingreso FROM INSERTED;
	SELECT @nombre=nombre FROM INSERTED;
	SELECT @apaterno = apellidopaterno FROM INSERTED;
	SELECT @amaterno = apellidomaterno FROM INSERTED;
	SELECT @claveevento=claveevento FROM asaewebeventos WHERE id=@evento
	
	--Validar que el contacto por medio de su correo no exista en la tabla principal de contactos de CRM
	IF NOT EXISTS(SELECT correo FROM contactos WHERE correo = @correo1)
		BEGIN			
			SELECT @campaña=id FROM Marketing WHERE consecutivo=@claveevento;
			--Creador de la campaña
			SELECT @idusuario=usuario FROM marketing WHERE id=@campaña;
			--No existe, se agrega como nuevo a ambas tablas, contactos y marketingcontactos
			INSERT INTO contactos (nombre, apellidopaterno, apellidomaterno, correo, idconfiguracion, tipocontacto, usuarioalta)
			VALUES (UPPER(@nombre), UPPER(@apaterno), UPPER(@amaterno), @correo1, 2, 2, @idusuario);
			SET @obtenido = @@IDENTITY;			
			INSERT INTO MarketingContactos (idcontacto,idcampaña,ingreso) VALUES(@obtenido,@campaña,@ingreso)
		END
END
GO
CREATE trigger [dbo].[ActualizarConfirmacionContactosExternos]
on [dbo].[AsaeWebUsuariosEventos]
AFTER UPDATE
AS
DECLARE @correo NVARCHAR(150);
DECLARE @idcontacto INT;
DECLARE @claveevento NVARCHAR(50);
DECLARE @evento INT;
DECLARE @campaña int;
DECLARE @idusuario INT;
declare @confirmacion bit;
BEGIN
	SELECT @evento=idevento FROM INSERTED;
	SELECT @correo=correopersonal FROM INSERTED;
	select @confirmacion=Confirmado from INSERTED;
	SELECT @claveevento=claveevento FROM asaewebeventos WHERE id=@evento;
	SELECT @campaña=id FROM Marketing WHERE consecutivo=@claveevento;	
	SELECT @idusuario=id FROM contactos WHERE correo=@correo;

	IF (@confirmacion = 1)
		BEGIN
			UPDATE marketingcontactos SET Confirmacion=1 WHERE IdContacto = @idusuario AND idcampaña=@campaña;
		PRINT 'Confirmación realizada'
		END
	ELSE
		PRINT 'Sin confirmación'
END