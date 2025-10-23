function [DaytoDayInc]=dayComparer(subject,day1,day2)
for N=1:length(day1)
    if day2(N)<=day1(N)
subject(N,1)='';
    else
    end
end
DaytoDayInc=rmmissing(subject);
end