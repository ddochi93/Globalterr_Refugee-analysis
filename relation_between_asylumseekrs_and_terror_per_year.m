
%% 연도별 테러 발생횟수 추이
[group_by_year,year]= findgroups(my_terror_DB(:,1));
no_of_attack_by_year = splitapply(@nansum,my_terror_DB.Var1,group_by_year);
year = table2array(year);

 plot((year),no_of_attack_by_year * 100); % 망명신청자수에 비해 너무 적으므로 그래프에서 비교 분석을 위해 *100
title('연도별 테러 발생횟수와 망명신청자 수');



%% 연도별 망명신청자 증가 추이

[group_by_year_asylum,year_assylum] = findgroups(asylumseekersmonthly(:,3));
no_of_asylumseekers_by_year = splitapply(@nansum,asylumseekersmonthly.Value,group_by_year_asylum);

hold on;

  year_assylum = table2array(year_assylum);
 plot(year_assylum,no_of_asylumseekers_by_year);
 legend('연도별 테러 발생건수','연도별 망명 신청자 수');
 yticks([]);
hold off;

%% 상관계수 분석
% 해당년도 테러발생 건수와 그 해의 망명신청자 수의 관계
y1 = no_of_attack_by_year(29:end);
y2 = no_of_asylumseekers_by_year;
corr1 = corrcoef(y1,y2);
disp(['연도별 테러 발생 건수와 해당 년도 망명신청자수 사이의 상관계수는  ',num2str(corr1(1,2))]);


% 전년도 테러와 다음 해 망명신청자 수의 관계
y1 =  no_of_attack_by_year(28:end-1);      %1998년부터 테러 발생횟수
y2 = no_of_asylumseekers_by_year;   %1999년부터 망명신청자수
corr2 = corrcoef(y1,y2);
disp(['연도별 테러 발생 건수와 다음 년도 망명신청자수 사이의 상관계수는  ',num2str(corr2(1,2))]);
% 해당 년도보다 다음년도의 망명신청자수가 더 상관관계가 높음을 알 수 있다. (테러가 많이 발생한 후에 망명신청을 많이한다.)

