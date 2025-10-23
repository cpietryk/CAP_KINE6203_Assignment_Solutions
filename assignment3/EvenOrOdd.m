function WooOrHah=EvenOrOdd(num1,num2)
% This function takes in two integer inputs and calculates their sum by 
% adding them together, printing a 'Woo' if the sum is even or a 'Hah' if 
% the sum is odd.
%
% Inputs:
% (1) Single integer value
% (2) Single integer value
% Outputs:
% (1) String value of Woo or Hah
%
% Example:
% EvenOrOdd(1,2) calculates if the sum of 1 and 2 is even or odd printing a
% Woo or Hah
%
% Author: Christopher Pietryk
% Date: 10/22/25
% Version: MATLAB R2025a

%% Error Message
%Input needs to be two integer values
if length(num1)~=1||length(num2)~=1
    error('The function needs two single integer inputs')
elseif rem(num1,1)~=0||rem(num2,1)~=0
    error('The function needs two single integer inputs')
else
%% Find if the sum is even or odd
%Calculate the sum of the two integer inputs
Tot=num1+num2;
% If the remainder (calculated with rem command) when the sum is divided by 
% 2 is 0, then it is even
if rem(Tot,2)==0
    WooOrHah='Woo';
else %else it is odd
    WooOrHah='Hah';
end
end
end