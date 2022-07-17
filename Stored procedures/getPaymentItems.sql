CREATE PROCEDURE getPaymentItems
(@school bigint,
 @student_type smallint,
 @grade smallint)
AS
BEGIN
SET NOCOUNT ON
		 Select *
		 FROM	payment_details
         WHERE  school = @school
		 and
		 student_type=@student_type
		 and
		 Grade=@grade
 
END