CREATE PROCEDURE insertPaymentDetail
(@paymentName varchar(200),
 @paymentType int,
 @paymentAmount money,
 @paymentSchool varchar(50),
 @paymentYear date,
 @paymentStudentType smallint)
AS
BEGIN
SET NOCOUNT ON
 
 INSERT INTO payment_details(name,type,amount,school,year,student_type) VALUES (@paymentName,@paymentType,@paymentAmount,@paymentSchool,@paymentYear,@paymentStudentType)
 
END