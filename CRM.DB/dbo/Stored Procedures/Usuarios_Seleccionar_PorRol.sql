-- =============================================
-- Author:		Jose Luis Villarreal Ruiz
-- Create date: 27/10/20
-- Description:	Selecciona usuarios por rol
-- =============================================
CREATE PROCEDURE [dbo].[Usuarios_Seleccionar_PorRol] 
	-- Add the parameters for the stored procedure here
	@idconfiguracion INT,
	@idrol INT,
	@idusuario INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DECLARE @consulta NVARCHAR(3000); 
	SET @consulta = N'SELECT usu.id, usu.Nombre, usu.ApellidoPaterno , usu.ApellidoMaterno
    FROM usuarios usu 
    INNER JOIN UsuarioConfiguracion uc ON uc.IdUsuario = usu.id 
    INNER JOIN Configuracion conf ON conf.Id = uc.IdConfiguracion 
    INNER JOIN UsuariosRoles ur ON ur.IdUsuario = usu.Id 
    WHERE conf.id=@idconfiguracion AND usu.activo=1';
    IF (@idrol=2)
		SET @consulta += N' AND ur.IdRol IN (2, 3)'; 
    ELSE
		SET @consulta += N' AND ur.IdRol=@idrol'; 
    SET @consulta += N' AND usu.id NOT IN (@idusuario) ORDER BY usu.nombre';
	EXECUTE sp_executesql @consulta,
	N'@idconfiguracion INT, @idrol INT, @idusuario INT',
	@idconfiguracion    = @idconfiguracion, 
	@idrol  			= @idrol,  
	@idusuario 			= @idusuario;
END