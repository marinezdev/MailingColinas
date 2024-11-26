-- =============================================
-- Author:		José Luis Villarreal Ruiz
-- Create date: 27/10/20
-- Description:	Selecciona usuarios responsables activos por configuracion, idusuario
-- =============================================
CREATE PROCEDURE Usuarios_Seleccionar_Responsables_PorConfiguracionUsuario 
	-- Add the parameters for the stored procedure here
	@idconfiguracion INT, 
	@idusuario INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT usu.id, LTRIM(usu.nombre) AS Nombre, usu.ApellidoPaterno, usu.ApellidoMaterno 
	FROM usuarios usu 
	INNER JOIN UsuarioConfiguracion usuc ON usuc.IdUsuario = usu.id 
	INNER JOIN UsuariosRoles ur ON ur.IdUsuario = usu.Id 
	WHERE usuc.IdConfiguracion = @idconfiguracion 
	AND usu.activo=1 
	AND usu.id<> @idusuario
	ORDER BY usu.nombre, usu.ApellidoPaterno
END