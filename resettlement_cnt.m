%%preprocessing
%resettlement.csv의 데이터를 사용하기 위해 엑셀파일 테이블로 불러오기

countryandvalue = readtable('resettlement2.csv');
 
%% 국가별 난민 정착수 막대그래프 출력  절차

Countries = countryandvalue(:,1); %정착국가명만을 뽑고 Countries라는 변수에 저장
Value = countryandvalue(:,4); % 정착국가민의 수만을 뽑고 Value라는 변수에 저장

countryandvalue=  [array2table(Countries),array2table(Value)];

[can,CountryNames] = findgroups(countryandvalue. Countries); % can과 CountryNames라는 변수에 번호 할당

Value = table2array(Value);
addvalue = splitapply(@sum,Value, can);% addvalue라는 변수에 can에 대입되는 Value를 각각 더함

table =  [array2table(CountryNames),array2table(addvalue)]; %정렬하기 위해 table형으로 생성

table = sortrows(table,2,'descend'); % addvalue를 기준으로 정렬

table = table(1:15,:); %상위 15개국 추출

x = table2array(table.CountryNames);
x = categorical(x, (x));
%상위 30개국의 국가명을 cell형 변수 rearrange_country로 받음
%rearrange_country = {'United States of America';'Canada';'Australia';'Sweden';'Norway';'United Kingdom of Great Britain and Northern Ireland';'New Zealand';'Denmark';'Netherlands';'Finland';'Germany';'Ireland';'Japan';'France';'Switzerland'};

%x = reordercats(x,rearrange_country); %알파벳순 자동정렬 방지하기 기존에 sorting하는데로 재배열

% 막대그래프 출력
bar(x,table.addvalue); 
title('국가별 정착 난민수');
xlabel('국가'); % x축 
ylabel('정착난민수'); %y축
yticks([0 500000 1000000 1500000  2000000 2500000 3000000]);
yticklabels({'0','50만명','100만명','150만명','200만명','250만명','300만명'});
