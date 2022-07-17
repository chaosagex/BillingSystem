CREATE PROCEDURE deleteStudentFees
(@feeID bigint)
AS
BEGIN
SET NOCOUNT ON
 
  DELETE FROM	student_fees
         WHERE  id = @feeID
 
END