function logvalue=Triangle(sides)
% This function takes a single 3-element array input of positive integer 
% values, representing the three side lengths of a triangle,and prints a 
% logical value 1 if the 3 side lengths create a valid triangle or a 
% logical value 0 if they do not. For the triangle to be valid the 2 
% shorter sides must sum to be greater than the largest side length.
%
% Inputs:
% (1) 3 element array of triangle side lengths. Must be positive numeric
% values
% Outputs:
% (1) Logical 1 or 0 
%
% Example:
% LogValue=Triangle([1,2,3]) calculates the sum of the two shorter sides (1 and 2)
% and compares it to the largest, returning a 1 if the side lengths create a
% valid triangle, 0 if not.
%
% Author: Christopher Pietryk
% Date: 10/22/25
% Version: MATLAB R2025a

%% Error Message
% Input needs to be single 3 element array of positive numeric values
if length(sides)~=3
    error('Input needs to be 3 element array')
elseif sides(1)<=0||sides(2)<=0||sides(3)<=0
    error('Input needs to be all positive values')
else
%% Valid Triangle Checking
% Check which sides are shorter and if their sum is bigger than the
% greatest length
% Check if the two smaller sides add up to be greater than longest side
if sides(1)<=sides(3) && sides(2)<=sides(3) && sides(1)+sides(2)>sides(3) 
logvalue=true;
elseif sides(1)<=sides(2) && sides(3)<=sides(2) && sides(1)+sides(3)>sides(2)
logvalue=true;
elseif sides(2)<=sides(1) && sides(3)<=sides(1) && sides(2)+sides(3)>sides(1)
logvalue=true;
% If sum is smaller than it can't be a valid triangle
else
logvalue=false;
end
end