CREATE PROCEDURE insertStudentFees
(@feeActivity bigint,
 @feeResources bigint,
 @feeFirstInstallment bigint,
 @feeSecondInstallment bigint,
 @feeUniform bigint,
 @feeTotalFees bigint,
 @feeYear date)
AS
BEGIN
SET NOCOUNT ON
 
 INSERT INTO student_fees(activity,resources,first_installment,second_installment,uniform,total_fees,year) VALUES (@feeActivity,@feeResources,@feeFirstInstallment,@feeSecondInstallment,@feeUniform,@feeTotalFees,@feeYear)
 
END