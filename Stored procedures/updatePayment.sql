CREATE PROCEDURE updatePaymentDetail
(@paymentId bigint,
 @paymentName varchar(200),
 @paymentType int,
 @paymentAmount money,
 @paymentSchool varchar(50),
 @paymentYear date,
 @paymentStudentType smallint)
AS
BEGIN
SET NOCOUNT ON
 
 UPDATE payment_details
            SET		name=@paymentName,
					type=@paymentType,
					amount=@paymentAmount,
					school=@paymentSchool,
					year=@paymentYear,
					student_type=@paymentStudentType
            WHERE  id = @paymentId
 
END