-- =============================================
-- Author:		Jose Luis Villarreal Ruiz
-- Create date: 27/10/20
-- Description:	Selecciona todos los registros activos
-- =============================================
CREATE PROCEDURE Usuarios_Seleccionar_Activos 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT usu.id, usu.Nombre, usu.ApellidoPaterno, ISNULL(usu.ApellidoMaterno, '') AS ApellidoMaterno, usu.Clave, usu.Activo, usu.Correo, 
	conf.Nombre AS Empresa 
    FROM usuarios usu 
    INNER JOIN UsuarioConfiguracion uc ON uc.IdUsuario=usu.id 
    INNER JOIN Configuracion conf ON conf.Id=uc.IdConfiguracion 
    WHERE usu.activo=1
    ORDER BY usu.nombre
END