CREATE PROCEDURE deleteInvoice
(@invoiceID bigint)
AS
BEGIN
SET NOCOUNT ON
 
  DELETE FROM	invoice_payment
         WHERE  id = @invoiceID
 
END