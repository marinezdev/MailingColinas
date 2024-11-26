-- =============================================
-- Author:		<Jose Luis Villarreal Ruiz>
-- Create date: getdate()
-- Description:	
-- =============================================
CREATE PROCEDURE Usuarios_Seleccionar_CorreosCambiados 
	-- Add the parameters for the stored procedure here
	@idusuario INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT correo FROM otroscorreos WHERE idusuario=@idusuario
END