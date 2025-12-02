function CounterL2H(num1,num2)
%  This function takes in two single integer values and displays a counter
%  from the lower number to the higher number by finding out which number is
%  lower and using a while loop to add to the lower number and store and 
%  display the value each time it goes up.
%
%  Inputs:
%  (1) Single integer value
%  (2) Single integer value
%  Outputs:
%  (0) Counter from the lower number to the higher number
%
% Example:
% CounterL2H(1,2) will display a counter going up by 1 from 1 to 2
%
% Author: Christopher Pietryk
% Date: 10/22/25
% Version: MATLAB R2025a

%% Error Message
% Inputs must be single integer values
if length(num1)~=1||length(num2)~=1
    error('Inputs must be single integer values');
elseif rem(num1,1)~=0||rem(num2,1)~=0
    error('Inputs must be integer values')
else
%% Counter
% Find which number is lower
if num1<num2
    Snum=num1;
    Lnum=num2;
else
    Snum=num2;
    Lnum=num1;
end
N=1; %Iteration
% While loop stores lower number, adds 1 to the lower number, stores this
% new value, and goes until the smaller number and bigger number are equal.
while Snum<=Lnum
Num(N)=Snum;
N=N+1;
Snum = Snum + 1;
end
%Display counter
Num'
end
end

