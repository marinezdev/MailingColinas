
CREATE PROCEDURE [dbo].[AsaeWebUsuarioBuscar]
	@CorreoPersonal VARCHAR(250),
	@Evento			VARCHAR(250)
AS
BEGIN
	DECLARE @_IdEvento	INT;
	DECLARE @_IdUsuario	INT;
	SET @_IdEvento = (SELECT Id FROM AsaeWebEventos WHERE Nombre = @Evento AND Activo = 1)
	SET @_IdUsuario = (SELECT Id FROM AsaeWebUsuariosEventos WHERE IdEvento = @_IdEvento AND CorreoPersonal = @CorreoPersonal AND Activo = 1)

	SELECT AsaeWebUsuarioToken.Token, @CorreoPersonal AS Email FROM AsaeWebUsuarioToken WHERE IdUsuario = @_IdUsuario AND IdEvento = @_IdEvento AND Activo = 1

END