
CREATE PROCEDURE [dbo].[AsaeWebUsuarioAgregar]
	@Nombre				VARCHAR(250),
	@ApellidoPaterno		VARCHAR(250),
	@ApellidoMaterno		VARCHAR(250),
	@NombreEmpresa		VARCHAR(250),
	@CorreoEmpresa		VARCHAR(250),
	@CorreoPersonal		VARCHAR(250),
	@TelefonoMovil		VARCHAR(30),
	@TelefonoLocal		VARCHAR(30),
	@Evento				VARCHAR(250)
AS
BEGIN
	DECLARE @_IdUsuario		INT;
	DECLARE @_IdEvento		INT;
	DECLARE @_FechaInicio	DATETIME;
	DECLARE @_FechaFin		DATETIME;
	DECLARE @_Token			VARCHAR(50);



	SET @_Token = (SELECT dbo.AsaeWebfnCustomPass(30,'CN'))
	SET @_IdEvento = (SELECT Id FROM AsaeWebEventos WHERE Nombre = @Evento)
	
	IF EXISTS(SELECT Id FROM AsaeWebEventos WHERE Id = @_IdEvento AND Activo = 1)
	BEGIN	
		SELECT @_FechaInicio = FechaInicio, @_FechaFin = FechaFin  FROM AsaeWebEventos WHERE Id = @_IdEvento AND Activo = 1
		IF(@_FechaInicio<GETDATE())
		BEGIN
			IF(GETDATE()>@_FechaFin)
			BEGIN
				SELECT 0 AS Token, '' AS Email, 'El evento a finalizado.' AS RespuestaText , 0 AS Respuesta
			END
			ELSE
			BEGIN
				IF NOT EXISTS(SELECT * FROM AsaeWebUsuariosEventos WHERE CorreoPersonal = @CorreoPersonal AND IdEvento = @_IdEvento AND Activo = 1)
				BEGIN
					INSERT INTO AsaeWebUsuariosEventos(IdEvento,Nombre,ApellidoPaterno,ApellidoMaterno,NombreEmpresa,CorreoEmpresa,CorreoPersonal,TelefonoMovil,TelefonoLocal,Confirmado,Activo,FechaRegistro)
					VALUES(@_IdEvento, @Nombre,@ApellidoPaterno,@ApellidoMaterno,@NombreEmpresa,@CorreoEmpresa,@CorreoPersonal,@TelefonoMovil,@TelefonoLocal,0,1,GETDATE());

					SET @_IdUsuario = (SELECT Id FROM AsaeWebUsuariosEventos WHERE CorreoPersonal = @CorreoPersonal)

					INSERT INTO AsaeWebUsuarioToken(IdUsuario,IdEvento,Token,Activo,FechaRegistro)
					VALUES(@_IdUsuario,@_IdEvento,@_Token,1,GETDATE())

					SELECT @_Token AS Token, @CorreoPersonal AS Email,'OK' AS RespuestaText, 1 AS Respuesta

				END
				ELSE 
				BEGIN
					SELECT 0 AS Token, '' AS Email, 'El email que intentas ingresar ya está registrado para este evento , ¿ Deseas que te mandemos un correo con tus credenciales de acceso ?' AS RespuestaText, 2 AS Respuesta
				END
			END
		END
		ELSE 
		BEGIN
			SELECT 0 AS Token, '' AS Email, CONCAT('El evento aun no abre sus registros, fecha apartura: ',FORMAT(@_FechaInicio, 'dd/MM/yyyy hh:mm:ss ')) AS RespuestaText, 0 AS Respuesta
		END
	END 
	ELSE 
	BEGIN
		SELECT 0 AS Token, '' AS Email, 'Evento no encontrado' AS RespuestaText, 0 AS Respuesta
	END
END