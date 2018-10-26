%% ������ ���� ���� �� 
% resettlement_3.xlsx �� �����͸� ����ϱ� ���� �������� ���̺�� �ҷ�����.
YearValueTable = readtable('resettlement2.csv');
% load reYearValue.mat
Year = YearValueTable.Year;
Value = YearValueTable.Value;
yearandvalue = [array2table(Year), array2table(Value)];
[yv, Years] = findgroups(yearandvalue.Year); %Value �� ������ �������� ������.

addvalue2 = splitapply(@sum, Value, yv); %������ Value���� ���� ���� ����

ta3 = [array2table(Years), array2table(addvalue2)]; 

plot(Years, addvalue2, 'r');
title('������ ���� ���� ��');
xlabel('����');
xticks([1960 1970 1980 1990 2000 2010 2016]);
xticklabels({'1960', '1970', '1980', '1990', '2000', '2010', '2016'});
ylabel('������ ��');
yticks([0 20000 40000 60000 80000 100000 120000 140000 160000]);
yticklabels({'0','2����', '4����','6����', '8����', '10����', '12����', '14����', '16����'});