CREATE PROCEDURE deleteInvoiceItem
(@itemID bigint,
 @invoiceID bigint)
AS
BEGIN
SET NOCOUNT ON
 
  DELETE FROM	invoice_item
         WHERE  invoice = @invoiceID 
				and
				payment_item=@itemID
 
END