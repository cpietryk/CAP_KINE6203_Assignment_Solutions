function [MSubMean, FSubMean, maleGroupMean, femaleGroupMean]=genderIsoCalc(Gender,Day1,Day2,Day3)
for N=1:length(Day1)
    if Gender(N,1)=='M'
        Gender(N,1)=1;
    else
        Gender(N,1)=0;
    end
    MSubMean(N,1)=(Day1(N,1)+Day2(N,1)+Day3(N,1))*Gender(N,1);
    if Gender(N,1)=='F'
        Gender(N,1)=1;
    else
        Gender(N,1)=0;
    end
    FSubMean(N,1)=(Day1(N,1)+Day2(N,1)+Day3(N,1))*Gender(N,1);
end
maleGroupMean=mean(MSubMean>0);
femaleGroupMean=mean(FSubMean>0);
