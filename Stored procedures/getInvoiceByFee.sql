CREATE PROCEDURE getInvoiceByFee
(@invoiceFee bigint)
AS
BEGIN
SET NOCOUNT ON
		 Select *
		 FROM	invoice_payment
         WHERE  fee_id = @invoiceFee
 
END