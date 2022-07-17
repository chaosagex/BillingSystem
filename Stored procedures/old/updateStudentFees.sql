CREATE PROCEDURE updateStudentFees
(@feeId bigint,
 @feeActivity bigint,
 @feeResources bigint,
 @feeFirstInstallment bigint,
 @feeSecondInstallment bigint,
 @feeUniform bigint,
 @feeTotalFees bigint,
 @feeYear date)
AS
BEGIN
SET NOCOUNT ON
 
 UPDATE student_fees
            SET    activity= @feeActivity,
                   resources = @feeResources,
                   first_installment = @feeFirstInstallment,
                   second_installment = @feeSecondInstallment,
				   uniform=@feeUniform,
				   total_fees=@feeTotalFees,
				   year=@feeYear
            WHERE  id = @feeId
 
END