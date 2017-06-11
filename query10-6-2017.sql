create proc getExamCode @code varchar(255) as
select * from Exam where ExamCode = @code

create proc getListExamByEmail @email nvarchar(255) as
select * from Exam where CreatedBy = @email

alter proc getListExamsByEmailPage @limit int, @email nvarchar(255) as
	SELECT TOP 8 * from Exam WHERE CreatedBy = @email and ExamID NOT IN(SELECT TOP (@limit) ExamID FROM Exam where CreatedBy = @email ORDER BY ExamID desc) 
	ORDER BY ExamID desc

create proc getExam @examID int as
select * from Exam where ExamID = @examID

alter proc getQuestion @questionID int as
select * from Question q join Answer a on q.QuestionID = a.QuestionID where q.QuestionID = @questionID

exec getQuestion 1

alter proc getListExamDetail @examID int as
select * from ExamDetail where ExamID = @examID order by QuestionID

select * from ExamDetail where ExamID = 69

exec getListExamDetail 4

create proc getListExamsPage @limit int as
SELECT TOP 8 * from Exam where ExamID NOT IN(SELECT TOP (@limit) ExamID FROM Exam ORDER BY ExamID desc) 
	ORDER BY ExamID desc

create proc getListMostViewExamsPage @limit int as 
SELECT TOP 8 * from Exam where ExamID NOT IN(SELECT TOP (@limit) NumberOfStudent FROM Exam ORDER BY NumberOfStudent desc) 
	ORDER BY NumberOfStudent desc

exec getListMostViewExamsPage 0