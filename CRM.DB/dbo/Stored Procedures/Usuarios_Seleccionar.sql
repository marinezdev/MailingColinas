-- =============================================
-- Author:		Jose Luis Villarreal Ruiz
-- Create date: 27/10/20
-- Description:	Selecciona todos los registros
-- =============================================
CREATE PROCEDURE Usuarios_Seleccionar 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT us.id,us.nombre, ISNULL(us.apellidopaterno, '') AS ApellidoPaterno, ISNULL(us.apellidomaterno, '') AS ApellidoMaterno, 
	ro.Id AS Rol, conf.Nombre AS Empresa 
    FROM usuarios us 
    INNER JOIN UsuariosRoles ur ON us.Id = ur.IdUsuario 
    INNER JOIN Roles ro ON ur.IdRol = ro.Id 
    INNER JOIN UsuarioConfiguracion uc ON uc.IdUsuario=us.id 
    INNER JOIN Configuracion conf ON conf.Id = uc.IdConfiguracion
END