
CREATE PROCEDURE [dbo].[AsaeWebUsuario_consulta_Token]
	@Token	VARCHAR(250)
AS
BEGIN
	DECLARE @_IdUsuario INT;
	DECLARE @_IdEvento	INT;

	SET @_IdUsuario = (SELECT IdUsuario FROM AsaeWebUsuarioToken WHERE Token = @Token);
	SET @_IdEvento = (SELECT IdEvento FROM AsaeWebUsuarioToken WHERE Token = @Token);

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
	AND AsaeWebUsuariosEventos.Activo = 1
	AND AsaeWebUsuariosEventos.IdEvento = @_IdEvento
END