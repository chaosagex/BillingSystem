CREATE PROCEDURE getPreviousPayment
(@student bigint)
AS
BEGIN
SET NOCOUNT ON
		 select *
from invoice_payment
where student=@student
order by date desc,id desc;
 
END