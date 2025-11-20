function [DaytoDayInc]=dayComparer(subject,day1,day2)
%  This function takes in three arrays of data, the subject ID's, the first
%  day of comparison's data, and the second day of comparison's data. It
%  outputs the subject ID's that increased from the first day of comparison
%  to the second day of comparison. The input arrays must be of equal
%  length
%
%  Inputs:
%  (1) Array of subject ID's
%  (2) Array of numeric isokinetic values from day 1 of comparison
%  (3) Array of numeric isokinetic values from day 2 of comparison
%  Outputs:
%  (1) String Array of subject ID's that increased from the first day inputs
%  to the second day inputs with blanks for subjects that increase for the
%  second day
%
%  Example:
%  day1toDay2=dayComparer(["1";"2";"3"],[1;2;3],[1;3;5]); will output an
%  array of ["","2","3"] because the second and third subject increase while
%  the first does not.
%
%  Author: Christopher Pietryk
%  Date: 11/19/25
%  Version: MATLAB R2025a

%% Error Checking
if length(subject)~=length(day1)||length(subject)~=length(day2)
    error('Input arrays must be of equal length.');
end
%% Check if subject improves
%For loop checks if the second day value is less than or equal to the first
%day values setting it to NaN if it does because they did not improve
for N=1:length(day1)
    if day2(N,1)<=day1(N,1)
    subject(N,1)=NaN;
    end
end
% Store and output array of subject ID's that improve from 1st day input 
% to 2nd day input.
DaytoDayInc=subject(:,1);
end