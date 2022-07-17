CREATE PROCEDURE insertInvoice
(@invoiceStudentID bigint,
 @invoiceDate date,
 @invoiceFeeID bigint,
 @invoiceRemaining money,
 @invoicePreviousPayment bigint)
AS
BEGIN
SET NOCOUNT ON
 
 INSERT INTO invoice_payment(student_id,date,fee_id,remaining,previous_payment) VALUES (@invoiceStudentID,@invoiceDate,@invoiceFeeID,@invoiceRemaining,@invoicePreviousPayment)
 
END