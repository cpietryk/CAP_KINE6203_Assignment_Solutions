%% Comment Section
%Name:Christopher Pietryk
%Date:11/19/25
%Description: This code takes in isokinetic across three days along with
%subject ID's, ages, genders, and weights for all those participating, and
%it calculates individual means, group means, normalized means, and who
%increased across the days. It uses three outside functions for its file
%importing and mean calculations.
clear all, clc
%% Import and Store Data with Function
[SubjectID, Age, Gender, Weight, Day1, Day2, Day3]=importfile('isok_data_6803.csv');
%% Calculate Means with Function
[maleIsoIndMeans,femaleIsoIndMeans,maleGroupIsoMean,femaleGroupIsoMean]=genderIsoCalc(Gender,Day1,Day2,Day3);
%% Calculate who increased with Function
day1toDay2=dayComparer(SubjectID,Day1,Day2); %Who increased from day 1 to 
% day 2
day2toDay3=dayComparer(SubjectID,Day2,Day3); %Who increased from day 2 to 
% day 3
%% Calculate Normalized Means
%Calculating normalized means by dividing isokietic results by the subjects
%weights
    WeightNormalizedDay1=Day1./Weight;
    WeightNormalizedDay2=Day2./Weight;
    WeightNormalizedDay3=Day3./Weight;
% Calculate means of normalized data for each day using the mean command
    normDay1mean=mean(WeightNormalizedDay1);
    normDay2mean=mean(WeightNormalizedDay2);
    normDay3mean=mean(WeightNormalizedDay3);
%% Match Lengths
%Find max length of variables using max command
MatchLength=max([length(maleIsoIndMeans),length(femaleIsoIndMeans),...
    length(maleGroupIsoMean),length(femaleGroupIsoMean),...
    length(day1toDay2),length(day2toDay3),length(normDay1mean),...
    length(normDay2mean),length(normDay3mean)]);
% Match the length of each variable to max length by using indexing to add 
% NaN values to the end of every variable until they reach the max length
maleIsoIndMeans(end+1:MatchLength) = NaN;
femaleIsoIndMeans(end+1:MatchLength) = NaN;
maleGroupIsoMean(end+1:MatchLength) = NaN;
femaleGroupIsoMean(end+1:MatchLength) = NaN;
day1toDay2(end+1:MatchLength) = NaN;
day2toDay3(end+1:MatchLength) = NaN;
normDay1mean(end+1:MatchLength)= NaN;
normDay2mean(end+1:MatchLength)= NaN;
normDay3mean(end+1:MatchLength)= NaN;
%% Make Everything the same
%Transpose variables as needed to get all variables to be one column of
%data
femaleGroupIsoMean=femaleGroupIsoMean';
maleGroupIsoMean=maleGroupIsoMean';
normDay1mean=normDay1mean';
normDay2mean=normDay2mean';
normDay3mean=normDay3mean';
%% CSV
% Create a table of the variables with their names as the titles using the 
% table command
Data=table(SubjectID,maleIsoIndMeans, femaleIsoIndMeans, maleGroupIsoMean, ...
    femaleGroupIsoMean, day1toDay2, day2toDay3, normDay1mean, ...
    normDay2mean, normDay3mean,'VariableNames',["SubjectID",...
    "maleIsoIndMeans", "femaleIsoIndMeans","maleGroupIsoMean",...
    "femaleGroupIsoMean", "day1toDay2", "day2toDay3",...
    "normDay1mean","normDay2mean","normDay3mean"]);
% Write the table to a CSV with the writeteable command
writetable(Data,'iso_results.csv');
