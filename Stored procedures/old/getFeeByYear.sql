CREATE PROCEDURE getFeeByYear
(@feeYear date)
AS
BEGIN
SET NOCOUNT ON
		 Select *
		 FROM	student_fees
         WHERE  year = @feeYear
 
END