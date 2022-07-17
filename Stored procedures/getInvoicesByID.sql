CREATE PROCEDURE getInvoicesById
(@invoiceId bigint)
AS
BEGIN
SET NOCOUNT ON
	Begin
		WITH  MyDescendants AS (
		SELECT *
		FROM invoice_payment
		WHERE id = @invoiceId

		UNION ALL

		SELECT invoice_payment.*
		FROM invoice_payment
		JOIN MyDescendants ON invoice_payment.id = MyDescendants.previous_payment
	)
	SELECT * FROM MyDescendants
	end
END