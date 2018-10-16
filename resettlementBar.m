%% 연도별 resettlement
% resettlement_3.xlsx 의 데이터를 사용하기 위해 엑셀파일 테이블로 불러오기.
YearValueTable = readtable('resettlement_3.xlsx');
% load reYearValue.mat
yearandvalue = [array2table(Year), array2table(Value)];
[yv, Years] = findgroups(yearandvalue.Year); %Value 를 연도를 기준으로 나눈다.

addvalue2 = splitapply(@sum, Value, yv); %연도별 Value합을 받을 변수 생성

ta3 = [array2table(Years), array2table(addvalue2)]; 
 
figure
plot(Years, addvalue2, 'r');
title('연도별 난민 정착민 수');
xlabel('연도');
xticks([1960 1970 1980 1990 2000 2010 2016]);
xticklabels({'1960', '1970', '1980', '1990', '2000', '2010', '2016'});
ylabel('정착민 수');
yticks([0 20000 40000 60000 80000 100000 120000 140000 160000]);
yticklabels({'0','2만명', '4만명','6만명', '8만명', '10만명', '12만명', '14만명', '16만명'});

