function [Tot Diff Prod Mx]=SDPM(num1,num2)
% This function takes in two numeric values and calculates the sum,
% difference, product, and maximum value between the two variables
%
% Inputs: 
% (1) Single numeric value
% (2) Single numeric value
% Outputs:
% (1) Sum of two numeric inputs
% (2) Difference of two numeric inputs (this difference will always
% be largest number minus smallest number)
% (3) Product of two numeric inputs
% (4) Max between the two numeric inputs
%
% Example: [Tot,Diff,Prod,Mx]=SDPM(1,2) calculates the the sum, difference,
% product, and max between 1 and 2
%
% Author: Christopher Pietryk
% Date: 10/22/25
% Version: MATLAB R2025a

%% Error Message
%Inputs need to be two numeric values otherwise error
if length(num1)~=1||length(num2)~=1
    error('The function needs two single numeric inputs')
else
%% Calculating sum, difference, product, and max
%Calculate the sum by adding the inputs together
Tot=num1+num2;

%Find max between inputs and calculate difference of biggest number from 
%smallest
if num1>num2
Diff=(num1-num2);
Mx=num1;
else
Diff=(num2-num1);
Mx=num2;
end

%Product is calculated by multiplying the two inputs together
Prod=num1*num2;
end
end
