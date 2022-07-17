CREATE PROCEDURE getPaymentById
(@paymentID bigint)
AS
BEGIN
SET NOCOUNT ON
		 Select *
		 FROM	payment_details
         WHERE  id = @paymentID
 
END