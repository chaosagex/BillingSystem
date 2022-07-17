CREATE PROCEDURE deletePayment
(@paymentID bigint)
AS
BEGIN
SET NOCOUNT ON
 
  DELETE FROM	payment_details
         WHERE  id = @paymentID
 
END