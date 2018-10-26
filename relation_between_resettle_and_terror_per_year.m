
Year = YearValueTable.Year;
Value = YearValueTable.Value;
yearandvalue = [array2table(Year), array2table(Value)];
[yv, Years] = findgroups(yearandvalue.Year); %Value �� ������ �������� ������.

addvalue2 = splitapply(@sum, Value, yv); %������ Value���� ���� ���� ����

ta3 = [array2table(Years), array2table(addvalue2)]; 

plot(Years, addvalue2, 'r');

xlabel('����');
xticks([1960 1970 1980 1990 2000 2010 2016]);
xticklabels({'1960', '1970', '1980', '1990', '2000', '2010', '2016'});
% ylabel('������ ��');
% yticks([0 20000 40000 60000 80000 100000 120000 140000 160000]);
% yticklabels({'0','2����', '4����','6����', '8����', '10����', '12����', '14����', '16����'});



[group_by_year,year]= findgroups(my_terror_DB(:,1));
no_of_attack_by_year = splitapply(@nansum,my_terror_DB.Var1,group_by_year);
year = table2array(year);
hold on;
 plot((year),no_of_attack_by_year * 25);   % ���� ���� �������� �׷� ���� �ʹ� �����Ƿ� ȿ�� ���� �񱳸� ���� �׷��Ǽ��� 20�� ��.
 yticks([]);
 legend('������ ���� ���� ��','������ �׷� �߻� �Ǽ�');
 
 since_terror_year = addvalue2(12:end);   
 correlcoeff = (corrcoef(since_terror_year,no_of_attack_by_year));
 disp(['������ ���� ���� �� �� �ش� �⵵ �׷� �߻��Ǽ� ������ �������� ' , num2str(correlcoeff(1,2))]);
 

 since_terror_year = addvalue2(16:end);   
 correlcoeff = (corrcoef(since_terror_year,no_of_attack_by_year(1:43)));
 disp(['������ ���� ���� �� �� 4���� �׷� �߻��Ǽ� ������ ��������  ',num2str(correlcoeff(1,2))]);
