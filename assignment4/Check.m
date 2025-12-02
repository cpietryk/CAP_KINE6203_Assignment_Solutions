%% Calculate Normalized Means
for N=1:length(SubjectID)
    WeightNormalizedDay1(N,1)=Day1(N,1)/Weight(N,1);
    WeightNormalizedDay2(N,1)=Day2(N,1)/Weight(N,1);
    WeightNormalizedDay3(N,1)=Day3(N,1)/Weight(N,1);
end
for N=1:length(Day1)
    if Gender(N,1)=='M'
        GenderM(N,1)=1;
    else
        GenderM(N,1)=0;
    end
    Day1NormM(N,1)=WeightNormalizedDay1(N,1)*GenderM(N,1);
    Day2NormM(N,1)=WeightNormalizedDay2(N,1)*GenderM(N,1);
    Day3NormM(N,1)=WeightNormalizedDay3(N,1)*GenderM(N,1);
    if Gender(N,1)=='F'
        GenderF(N,1)=1;
    else
        GenderF(N,1)=0;
    end
    Day1NormF(N,1)=WeightNormalizedDay1(N,1)*GenderF(N,1);
    Day2NormF(N,1)=WeightNormalizedDay2(N,1)*GenderF(N,1);
    Day3NormF(N,1)=WeightNormalizedDay3(N,1)*GenderF(N,1);
end
normDay1mean=([mean(Day1NormM),mean(Day1NormF)]);
normDay2mean=([mean(Day2NormM),mean(Day2NormF)]);
normDay3mean=([mean(Day3NormM),mean(Day3NormF)]);
% Separate by gender
MnormDay1=normDay1mean(:,1);
FnormDay1=normDay1mean(:,2);
MnormDay2=normDay1mean(:,1);
FnormDay2=normDay1mean(:,2);
MnormDay3=normDay1mean(:,1);
FnormDay3=normDay1mean(:,2);
%% Match Lengths
MatchLength=max([length(maleIsoIndMeans),length(femaleIsoIndMeans),...
    length(maleGroupIsoMean),length(femaleGroupIsoMean),...
    length(day1toDay2),length(day2toDay3),length(normDay1mean),...
    length(normDay2mean),length(normDay3mean)]);
maleIsoIndMeans(end+1:MatchLength) = NaN;
femaleIsoIndMeans(end+1:MatchLength) = NaN;
maleGroupIsoMean(end+1:MatchLength) = NaN;
femaleGroupIsoMean(end+1:MatchLength) = NaN;
day1toDay2(end+1:MatchLength) = NaN;
day2toDay3(end+1:MatchLength) = NaN;
MnormDay1(end+1:MatchLength)=NaN;
FnormDay1(end+1:MatchLength)=NaN;
MnormDay2(end+1:MatchLength)=NaN;
FnormDay2(end+1:MatchLength)=NaN;
MnormDay3(end+1:MatchLength)=NaN;
FnormDay3(end+1:MatchLength)=NaN;
%% Combine Data back
normDay1mean=[MnormDay1',FnormDay1'];
normDay2mean=[MnormDay2',FnormDay2'];
normDay3mean=[MnormDay3',FnormDay3'];
%% CSV
Data=array2table([maleIsoIndMeans, femaleIsoIndMeans, maleGroupIsoMean, ...
    femaleGroupIsoMean, day1toDay2, day2toDay3, normDay1mean, ...
    normDay2mean, normDay3mean]);
Data.Properties.VariableNames=['maleIsoIndMeans', 'femaleIsoIndMeans',...
    'maleGroupIsoMean','femaleGroupIsoMean', 'day1toDay2', 'day2toDay3',...
    'MaleNormDay1mean', 'FemaleNormDay1mean','MaleNormDay2mean', ...
    'FemaleNormDay2mean', 'MaleNormDay3mean', 'FemaleNormDay3mean']
writematrix(Data,'test.csv');