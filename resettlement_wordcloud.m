%% 난민들이 많이 정착한 나라 top 30
% 난민 적극 수용국가 top 30
% resettlement_DB = readtable('resettlement.xlsx');  %xlsx파일로부터 필요한 data추출(*를0으로바꿈)
resettlement_DB = readtable('resettlement2.csv');
[country_flag,country] = findgroups(resettlement_DB(:,1)); %country에는 분류된 국가명만 들어감.
country = table2array(country);
no_of_resettlement_by_country = splitapply(@nansum, resettlement_DB(:,4), country_flag); %각국가별 정착민수
no_by_country_table = [cell2table(country),array2table(no_of_resettlement_by_country)];
%  bar(country,no_of_resettlement_by_country);
 
 wordcloud(no_by_country_table,'country','no_of_resettlement_by_country');