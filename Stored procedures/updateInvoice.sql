CREATE PROCEDURE updateInvoice
(@invoiceID bigint,
 @invoiceStudentID bigint,
 @invoiceDate date,
 @invoiceFeeID bigint,
 @invoiceRemaining money,
 @invoicePreviousPayment bigint)
AS
BEGIN
SET NOCOUNT ON
 
  UPDATE invoice_payment
            SET		student_id=@invoiceStudentID,
					date=@invoiceDate,
					fee_id=@invoiceFeeID,
					remaining=@invoiceRemaining,
					previous_payment=@invoicePreviousPayment
            WHERE  id = @invoiceID
 
END