-- =============================================
-- Author:		Jose Luis Villarreal Ruiz
-- Create date: 27/10/20
-- Description:	Selecciona los usuarios responsables
-- =============================================
CREATE PROCEDURE Usuarios_Seleccionar_Responsables 
	-- Add the parameters for the stored procedure here
	@idconfiguracion INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT usu.id, LTRIM(usu.nombre) AS Nombre, usu.ApellidoPaterno, usu.ApellidoMaterno, eu.IdEmpresa, 
    usu.Correo, ud.Telefono, ud.Celular, emp.Nombre AS Empresa 
    FROM usuarios usu 
    INNER JOIN UsuarioConfiguracion usuc ON usuc.IdUsuario = usu.id 
    LEFT JOIN EmpresasUsuarios eu ON eu.IdUsuario = usu.id 
    LEFT JOIN UsuariosRoles ur ON ur.IdUsuario = usu.Id 
    LEFT JOIN usuariosdetalle ud ON ud.idusuario=usu.id 
    LEFT JOIN empresas emp ON emp.id=eu.idempresa 
    WHERE usuc.IdConfiguracion = @idconfiguracion 
    AND usu.activo=1 
    AND ur.IdRol=5
END