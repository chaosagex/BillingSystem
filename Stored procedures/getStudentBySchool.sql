CREATE PROCEDURE getStudentBySchool
(@school bigint)
AS
BEGIN
SET NOCOUNT ON
		 Select *
		 FROM	student
         WHERE  school = @school
END