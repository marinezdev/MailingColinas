-- =============================================
-- Author:		Jose Luis Villarreal Ruiz
-- Create date: 27/10/20
-- Description:	Selecciona los usuarios activos que pertenecen a una oportunidad
-- =============================================
CREATE PROCEDURE Usuarios_Seleccionar_PorIdOportunidad_Activos 
	-- Add the parameters for the stored procedure here
	@id INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT opor.idoportunidad, 
    usu.id AS IdUsuario, usu.Nombre, usu.apellidopaterno, ISNULL(usu.ApellidoMaterno, '') AS ApellidoMaterno, 
    bic.id AS idbitacora 
    FROM oportunidadesresponsables opor 
    INNER JOIN usuarios usu ON usu.id = opor.idasignado 
    LEFT JOIN Bitacora bic ON (bic.IdResponsable=usu.id AND bic.IdOportunidad=opor.IdOportunidad) 
    WHERE opor.idoportunidad=@id 
	AND usu.activo=1
END