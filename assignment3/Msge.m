function [Lth,FirstLetter,FinalLetter]=Msge(str)
% This function takes in a single string input and returns the length,
% first character, and last character of the string input. Spaces are
% counted as characters so if there is a space to start the first letter
% will be blank.
%
% Inputs:
% (1) Single string input
% Outputs:
% (1) Length of string
% (2) First Letter of string
% (3) Last Letter of string
%
% Example:
% [Lth,FirstLetter,FinalLetter]=Msge('Word') outputs the length 4
% characters, first letter W, and last letter d.
%
% Author: Christopher Pietryk
% Date: 10/22/25
% Version: MATLAB R2025a

%% Analyzing String input
% Find length
Lth=length(str);
%Find first character with indexing
FirstLetter=str(1);
%Find last character with indexing
FinalLetter=str(end);
% Display results
StrgAnaly=[string(Lth);FirstLetter;FinalLetter];
disp(StrgAnaly);
end