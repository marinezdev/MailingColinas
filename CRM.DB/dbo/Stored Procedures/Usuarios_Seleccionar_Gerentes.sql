-- =============================================
-- Author:		Jose Luis Villarreal Ruiz
-- Create date: 27/10/20
-- Description:	Selecciona los gerentes activos por rol
-- =============================================
CREATE PROCEDURE [dbo].[Usuarios_Seleccionar_Gerentes] 
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
	SET @consulta = N'SELECT usu.id, LTRIM(usu.nombre) AS Nombre, usu.ApellidoPaterno, usu.ApellidoMaterno, usu.clave 
    FROM usuarios usu 
    INNER JOIN UsuarioConfiguracion usuc ON usuc.IdUsuario=usu.id 
    INNER JOIN UsuariosRoles ur ON ur.IdUsuario=usu.Id 
    WHERE usuc.IdConfiguracion=@idconfiguracion 
	AND usu.activo=1';
    IF (@idrol = 2)
       SET @consulta += ' AND ur.idrol IN (2,3, 5, 6, 7)'
    IF (@idrol = 3)
       SET @consulta += ' AND ur.idrol IN (3, 5, 6, 7)'
    IF (@idrol = 5)
       SET @consulta += ' AND ur.idrol IN (5, 6, 7) '
    IF (@idrol = 6)
       SET @consulta += ' AND ur.idrol IN (6, 7) '
    IF (@idrol = 7)
       SET @consulta += ' AND ur.idrol = 6 '
    SET @consulta += ' AND usu.id<>@idusuario
    ORDER BY usu.Nombre, usu.apellidopaterno';	
	PRINT @consulta;
	EXECUTE sp_executesql @consulta,
	N'@idconfiguracion INT, @idrol INT, @idusuario INT',
	@idconfiguracion    = @idconfiguracion, 
	@idrol  			= @idrol,  
	@idusuario 			= @idusuario;
END