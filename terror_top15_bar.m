
% preprocessing
% globalterrorismdb_0718dist.xlsb 에서 필요한 column data만 추출하여 myDB.mat라는
% table 변수를 생성.
% xlsread
 my_terror_DB = readtable('global_terror.xlsx');       %나중에 주석해제
% myDB를 load
%  load my_terror_DB.mat

% 테러 건수를 세기 위해 마지막 28행에 count변수를 추가(모두 1로 셋팅)
count = ones([height(my_terror_DB),1]);
for idx = 1: height(my_terror_DB)
    count(idx) = 1;
end
count = array2table(count(:,1));  %기존 table db와의 결합을 위해 table형으로 형 변환
my_terror_DB = [my_terror_DB , count]; %기존 table에 count 변수 추가 (테러건수를 세기 위함)

% 국가코드가 4부터 시작하여 splitapply 함수를 적용하기가 어려우므로 새로운 국가코드를 생성
new_country = findgroups(my_terror_DB(:,5));

% 새로운 국가코드를 기존의 table과 결합.
my_terror_DB = [my_terror_DB,array2table(new_country)];
[group_by_country, country_name] = findgroups( my_terror_DB.country_txt);
no_of_attack_by_country = splitapply(@nansum,my_terror_DB.Var1,my_terror_DB.new_country);
country_attack_table = [cell2table(country_name),array2table(no_of_attack_by_country)];
country_attack_table = sortrows(country_attack_table,2,'descend');
country_x =  string(country_attack_table.country_name); 
country_x = country_x(1:15);
country_x = categorical(country_x);
country_x = reordercats(country_x,{
    'Iraq                            '
    'Pakistan                        '
    'Afghanistan                     '
    'India                           '
    'Colombia                        '
    'Philippines                     '
    'Peru                            '
    'El Salvador                     '
    'United Kingdom                  '
    'Turkey                          '
    'Somalia                         '
    'Nigeria                         '
    'Thailand                        '
    'Yemen                           '
    'Spain                           '
});
no_of_attack_by_country = country_attack_table.no_of_attack_by_country(1:15);

bar( categorical(country_x),no_of_attack_by_country);
title('테러 발생이 많은 국가 top15');
xlabel('국가')
ylabel('테러발생건수');
yticks([0 5000 10000 15000  20000 25000 30000]);
yticklabels({'0','5000','10000','15000','20000','25000','30000'});
