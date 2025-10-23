function twoTimes=duble(num)
% This function takes a single numeric input and outputs a number that is 
% double the input by multiplying it by 2
%
% Inputs: (1) Single numeric value
% Outputs: (1) Single numeric value (double of the input)
%
% Example: DoubleNum=duble(1) calculates the value double of 1
%
% Author: Christopher Pietryk
% Date: 10/22/25
% Version: MATLAB R2025a

%% Error Message
%Input needs to be single numeric input otherwise error
if length(num)~=1
    error('The function needs a single numeric input')
else
%% Doubling Input
twoTimes = num*2; %Multiply input variable by 2 to double it.
end
end