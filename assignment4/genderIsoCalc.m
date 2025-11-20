function [maleIsoIndMeans, femaleIsoIndMeans, maleGroupIsoMean, femaleGroupIsoMean]=genderIsoCalc(Gender,Day1,Day2,Day3)
%  This function takes 4 arrays including subject's genders and their day 
%  1, day 2, and day 3 isokinetic outputs and outputs the group means
%  (separated by gender) across days 1-3 and the individual means across 
%  days 1-3. The input arrays must be of equal length.
%
%  Inputs:
%  (1) String array of subject genders (F & M)
%  (2) Array of day 1 subject's isokinetic data
%  (3) Array of day 2 subject's isokinetic data
%  (4) Array of day 3 subject's isokinetic data
%  Output:
%  (1) Array of individual male subjects average isokietic data across each
%  day with NaN replacing the non relevant subjects
%  (2) Array of individual female subjects average isokietic data across 
%  each day with NaN replacing the non relevant subjects
%  (3) Single integer output of average male isokinetic output across each
%  day with NaN replacing the non relevant subjects
%  (4) Single integer output of average female isokinetic output across
%  each day with NaN replacing the non relevant subjects
%
%  Example:
%  [maleIsoIndMeans,femaleIsoIndMeans,maleGroupIsoMean,...
%  femaleGroupIsoMean]=genderIsoCalc(["F";"M";"M"],[1;2;3],[1;2;3],[1;2;3]);
%  This will give the average individual and group isokinetic data across
%  the three days
%
%  Author: Christopher Pietryk
%  Date: 11/19/25
%  Version: MATLAB R2025a

%% Error Checking
if length(Gender)~=length(Day1)||length(Gender)~=length(Day2)||length(Gender)~=length(Day3)
    error("Input arrays need to be equal length");
end
%% Indexing
% For loop creates 2 arrays of 1's and 0's representing true and false 
% for if the gender is male or female to be used in calculating the
% individual and group means
for N=1:length(Day1)
    % Create matrix of true's and false's for subject being male
    if Gender(N,1)=='M'
        GenderM(N,1)=1;
    else
        GenderM(N,1)=0;
    end
    % Multiply individual means by 1 or 0 to create array of male
    % individual means
    maleIsoIndMeans(N,1)=(1/3)*(Day1(N,1)+Day2(N,1)+Day3(N,1))*GenderM(N,1);
    % Create matrix of true's and false's for subject being female
    if Gender(N,1)=='F'
        GenderF(N,1)=1;
    else
        GenderF(N,1)=0;
    end
    % Multiply individual means by 1 or 0 to create array of female
    % individual means
    femaleIsoIndMeans(N,1)=(1/3)*(Day1(N,1)+Day2(N,1)+Day3(N,1))*GenderF(N,1);
end
%% Group Means
%Calculate group means by using the mean command and omitting zero values
%(non relevant subjects) by indexing and using the values that are greater
%than 0
maleGroupIsoMean=mean(maleIsoIndMeans(maleIsoIndMeans>0));
femaleGroupIsoMean=mean(femaleIsoIndMeans(femaleIsoIndMeans>0));
% Replace 0 values with NaN because I like it more
maleIsoIndMeans(maleIsoIndMeans<=0)=NaN;
femaleIsoIndMeans(femaleIsoIndMeans<=0)=NaN;
