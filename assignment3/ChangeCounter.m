function ChangeCount=ChangeCounter(quarter,dime,nickel,penny)
% This function takes in 4 integer values representing the amount of
% quarters, dimes, nickels, and penny's and outputs the total change given
% these amounts by summing the number of each coin multiplied by their
% respective worth.
%
% Inputs: All inputs must be positive integer values
% (1) Number of quarters
% (2) Number of dimes
% (3) Number of nickels
% (4) Number of pennies
% Outputs:
% (1) Total Change
%
% Example:
% ChangeCount=ChangeCounter(1,2,3,4) calculates the total change of 1
% quarter, 2 dimes, 3 nickels, and 4 pennies
%
% Author: Christopher Pietryk
% Date: 10/22/25
% Version: MATLAB R2025a

%% Error Message
%Input needs to be four positive integer values
if length(quarter)~=1||length(dime)~=1||length(nickel)~=1||length(penny)~=1
    error('The function needs four single integer inputs');
elseif quarter<0||dime<0||nickel<0||penny<0
    error('The function needs positive integers');
elseif rem(quarter,1)~=0||rem(dime,1)~=0||rem(nickel,1)~=0||rem(penny,1)~=0
    error('The function needs integer inputs');
else
%% Calculate Change
%Calculate the tota change by multiplying and summing each coin amount to
%their respective values
ChangeCount=(quarter*0.25)+(dime*0.1)+(nickel*0.05)+(penny*0.01);
%Print correct formatting
fprintf('Total Change: $%.2f\n',ChangeCount);
end
end