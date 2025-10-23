function TwoVecPlot(vec1,vec2)
% This function takes in  two+ numeric x and y vectors and creates an appropriately
% labeled plot with the x and y vectors. An inifinite amount of x and y
% vectors can be used as long as there are as many x vectors as there are y
% vectors. The x vector is taken as the first input and the y vector is
% taken as the second input.
%
% Inputs:
% (1) Single numeric value representing the x vector (can be array of 
% values)
% (2) Single numeric value representing the y vector (can be array of 
% values)
% Outputs:
% (0) Plot of vectors
%
% Example: TwoVecPlot([1 2],[1 2]) plots a line to coordinates (1,1) and
% then (2,2)
%
% Author: Christopher Pietryk
% Date: 10/22/25
% Version: MATLAB R2025a

%% Error Message
% Inputs must be of equal length
if length(vec1)~=length(vec2)
    error('Inputs must be of equal length');
else
%% Vec Plotting
%Plot vectors with plot command
plot(vec1, vec2,'r')
%Label axes
xlabel('X axis');
ylabel('Y axis');
%Title figure
title('Vector Plot');
end
end