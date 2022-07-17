CREATE PROCEDURE insertInvoiceItem
(@itemID bigint,
 @invoiceID bigint)
AS
BEGIN
SET NOCOUNT ON
 
 INSERT INTO invoice_item(invoice,payment_item) VALUES (@invoiceID,@itemID)
 
END