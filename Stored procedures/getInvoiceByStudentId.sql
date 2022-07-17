CREATE PROCEDURE getInvoiceByStudentId
(@invoiceStudentId bigint)
AS
BEGIN
SET NOCOUNT ON
		 Select *
		 FROM	invoice_payment
         WHERE  student_id = @invoiceStudentId
 
END