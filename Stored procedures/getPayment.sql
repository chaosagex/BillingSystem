CREATE PROCEDURE getPayment
(@paymentSchool varchar(50),
 @paymentYear date,
 @paymentStudentType smallint)
AS
BEGIN
SET NOCOUNT ON
		 Select *
		 FROM	payment_details
         WHERE  school=@paymentSchool 
		 and
		 year=@paymentYear 
		 and
		 student_type=@paymentStudentType
 
END