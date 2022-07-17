CREATE PROCEDURE getInvoiceItem
(@itemID bigint,
 @invoiceID bigint)
AS
BEGIN
SET NOCOUNT ON
		 Select *
		 FROM	invoice_item
         WHERE  invoice = @invoiceID
		 and
		 payment_item=@itemID
 
END