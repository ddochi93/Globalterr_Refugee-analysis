

%% 연도별 망명신청자 증가 추이
%load asylum.mat;
asylumseekersmonthly = readtable('asylum_seekers.csv');

[group_by_year_asylum,year_assylum] = findgroups(asylumseekersmonthly(:,3));
no_of_asylumseekers_by_year = splitapply(@nansum,asylumseekersmonthly.Value,group_by_year_asylum);
plot(table2array(year_assylum),no_of_asylumseekers_by_year);
title('연도별 망명신청자수');
xlabel('연도');
ylabel('망명신청자수');




