CREATE PROCEDURE getFeeById
(@feeID bigint)
AS
BEGIN
SET NOCOUNT ON
		 Select *
		 FROM	student_fees
         WHERE  id = @feeID
 
END