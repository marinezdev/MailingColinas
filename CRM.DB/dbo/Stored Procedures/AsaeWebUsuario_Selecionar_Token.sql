


CREATE PROCEDURE [dbo].[AsaeWebUsuario_Selecionar_Token]
	@Token	VARCHAR(250)
AS
BEGIN
	IF EXISTS (SELECT AsaeWebUsuariosEventos.Id FROM AsaeWebUsuarioToken
		INNER JOIN AsaeWebUsuariosEventos ON AsaeWebUsuariosEventos.Id = AsaeWebUsuarioToken.IdUsuario
		INNER JOIN AsaeWebEventos ON AsaeWebEventos.Id = AsaeWebUsuariosEventos.IdEvento
		WHERE AsaeWebUsuarioToken.Token = @Token AND AsaeWebUsuarioToken.Activo = 1 AND AsaeWebEventos.Activo = 1 AND GETDATE() < AsaeWebEventos.FechaFin  )
	BEGIN 
		DECLARE @_IdUsuario INT;
		DECLARE @_IdEvento	INT;

		SET @_IdUsuario = (SELECT IdUsuario FROM AsaeWebUsuarioToken WHERE Token = @Token);
		SET @_IdEvento = (SELECT IdEvento FROM AsaeWebUsuarioToken WHERE Token = @Token);

		UPDATE AsaeWebUsuariosEventos SET Confirmado = 1 WHERE Id = @_IdUsuario AND IdEvento = @_IdEvento;

		SELECT 
		AsaeWebUsuariosEventos.Nombre,
		AsaeWebUsuariosEventos.ApellidoPaterno, 
		AsaeWebUsuariosEventos.ApellidoMaterno,
		AsaeWebUsuariosEventos.NombreEmpresa,
		AsaeWebUsuariosEventos.CorreoEmpresa,
		AsaeWebUsuariosEventos.CorreoPersonal,
		AsaeWebUsuariosEventos.TelefonoMovil,
		AsaeWebUsuariosEventos.TelefonoLocal,
		AsaeWebEventos.Clave,
		AsaeWebEventos.Password,
		AsaeWebEventos.Descripcion
		FROM AsaeWebUsuariosEventos
		INNER JOIN AsaeWebEventos ON AsaeWebEventos.Id = AsaeWebUsuariosEventos.IdEvento
		WHERE AsaeWebUsuariosEventos.Id = @_IdUsuario
		AND AsaeWebUsuariosEventos.Activo = 1;

	END
	ELSE
	BEGIN
		SELECT 
		'' AS Nombre,
		'' AS ApellidoPaterno,
		'' AS ApellidoMaterno,
		'' AS NombreEmpresa,
		'' AS CorreoEmpresa,
		'' AS CorreoPersonal,
		'' AS TelefonoMovil,
		'' AS TelefonoLocal,
		'' AS Clave,
		'' AS Password,
		'' AS Descripcion,
		'Evento no encontrado.' AS Respuesta
	END
END