clear all, clc
%% Import and Store Data
[SubjectID, Age, Gender, Weight, Day1, Day2, Day3]=importfile('isok_data_6803.csv');
[maleIsoIndMeans,femaleIsoIndMeans,maleGroupIsoMean,femaleIsoGroupMean]=genderIsoCalc(Gender,Day1,Day2,Day3);
day1toDay2=dayComparer(day1,day2);
day2toDay3=dayComparer(day2,day3);
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
    DayNormM(N,1)=(Day1(N,1)+Day2(N,1)+Day3(N,1))*GenderM(N,1);
    if Gender(N,1)=='F'
        GenderF(N,1)=1;
    else
        GenderF(N,1)=0;
    end
    Day(N,1)=(Day1(N,1)+Day2(N,1)+Day3(N,1))*Gender(N,1);
end
