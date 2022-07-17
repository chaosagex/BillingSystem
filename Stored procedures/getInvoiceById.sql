CREATE PROCEDURE getInvoiceById
(@invoiceId bigint)
AS
BEGIN
SET NOCOUNT ON
		 Select *
		 FROM	invoice_payment
         WHERE  id = @invoiceId
 
END