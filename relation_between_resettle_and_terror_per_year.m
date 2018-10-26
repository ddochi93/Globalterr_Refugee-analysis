
Year = YearValueTable.Year;
Value = YearValueTable.Value;
yearandvalue = [array2table(Year), array2table(Value)];
[yv, Years] = findgroups(yearandvalue.Year); %Value 를 연도를 기준으로 나눈다.

addvalue2 = splitapply(@sum, Value, yv); %연도별 Value합을 받을 변수 생성

ta3 = [array2table(Years), array2table(addvalue2)]; 

plot(Years, addvalue2, 'r');

xlabel('연도');
xticks([1960 1970 1980 1990 2000 2010 2016]);
xticklabels({'1960', '1970', '1980', '1990', '2000', '2010', '2016'});
% ylabel('정착민 수');
% yticks([0 20000 40000 60000 80000 100000 120000 140000 160000]);
% yticklabels({'0','2만명', '4만명','6만명', '8만명', '10만명', '12만명', '14만명', '16만명'});



[group_by_year,year]= findgroups(my_terror_DB(:,1));
no_of_attack_by_year = splitapply(@nansum,my_terror_DB.Var1,group_by_year);
year = table2array(year);
hold on;
 plot((year),no_of_attack_by_year * 25);   % 정착 난민 수에비해 테러 수가 너무 적으므로 효과 적인 비교를 위해 테러건수에 20을 곱.
 yticks([]);
 legend('연도별 정착 난민 수','연도별 테러 발생 건수');
 
 since_terror_year = addvalue2(12:end);   
 correlcoeff = (corrcoef(since_terror_year,no_of_attack_by_year));
 disp(['연도별 정착 난민 수 와 해당 년도 테러 발생건수 사이의 상관계수는 ' , num2str(correlcoeff(1,2))]);
 

 since_terror_year = addvalue2(16:end);   
 correlcoeff = (corrcoef(since_terror_year,no_of_attack_by_year(1:43)));
 disp(['연도별 정착 난민 수 와 4년전 테러 발생건수 사이의 상관계수는  ',num2str(correlcoeff(1,2))]);
