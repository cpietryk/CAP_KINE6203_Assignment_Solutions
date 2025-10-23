function [Avg,LetterGrade] = FunctionPractice(grade1,grade2,grade3)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
Avg=mean([grade1,grade2,grade3]);
if Avg>=90
    LetterGrade='A';
elseif Avg>=80
    LetterGrade='B';
elseif Avg>=70
    LetterGrade='C';
elseif Avg>=60
    LetterGrade='D';
else
    LetterGrade='F';
end
