-- =============================================
-- Author:		Jose Luis Villarreal Ruiz
-- Create date: 29/10/20
-- Description:	Valida si un usuario es el creador de la oportunidad ó si tiene permisos de modificación
-- =============================================
CREATE PROCEDURE [dbo].[Oportunidades_Validar_CreadorPermiso]
	-- Add the parameters for the stored procedure here
	@idoportunidad INT, 
	@idusuario INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @idcreadoroportunidad INT;
	DECLARE @permiso BIT;

    -- Obtiene el creador de la oportunidad
	SELECT @idcreadoroportunidad = oecu.IdUsuario 
    FROM usuarios usu 
    INNER JOIN oecu ON oecu.IdUsuario = usu.id 
    WHERE oecu.IdOportunidad=@idoportunidad;

	-- Asigna si el usuario tiene permisos de modificación aunque no sea el creador
	IF ((SELECT 1 FROM compartiroportunidades WHERE idoportunidad=@idoportunidad AND idusuario=@idusuario)>0)
		BEGIN
			SET @permiso = 1;
		END
	ELSE
		BEGIN
			SET @permiso = 0;
		END

	-- Evalúa y devuelve la validación
	IF (@idcreadoroportunidad = @idusuario OR @permiso = 1 OR @idusuario = 2)
		SELECT 1;
	ELSE
		SELECT 0; 

END