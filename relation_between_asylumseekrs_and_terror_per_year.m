
%% ������ �׷� �߻�Ƚ�� ����
[group_by_year,year]= findgroups(my_terror_DB(:,1));
no_of_attack_by_year = splitapply(@nansum,my_terror_DB.Var1,group_by_year);
year = table2array(year);

 plot((year),no_of_attack_by_year * 100); % �����û�ڼ��� ���� �ʹ� �����Ƿ� �׷������� �� �м��� ���� *100
title('������ �׷� �߻�Ƚ���� �����û�� ��');



%% ������ �����û�� ���� ����

[group_by_year_asylum,year_assylum] = findgroups(asylumseekersmonthly(:,3));
no_of_asylumseekers_by_year = splitapply(@nansum,asylumseekersmonthly.Value,group_by_year_asylum);

hold on;

  year_assylum = table2array(year_assylum);
 plot(year_assylum,no_of_asylumseekers_by_year);
 legend('������ �׷� �߻��Ǽ�','������ ���� ��û�� ��');
 yticks([]);
hold off;

%% ������ �м�
% �ش�⵵ �׷��߻� �Ǽ��� �� ���� �����û�� ���� ����
y1 = no_of_attack_by_year(29:end);
y2 = no_of_asylumseekers_by_year;
corr1 = corrcoef(y1,y2);
disp(['������ �׷� �߻� �Ǽ��� �ش� �⵵ �����û�ڼ� ������ ��������  ',num2str(corr1(1,2))]);


% ���⵵ �׷��� ���� �� �����û�� ���� ����
y1 =  no_of_attack_by_year(28:end-1);      %1998����� �׷� �߻�Ƚ��
y2 = no_of_asylumseekers_by_year;   %1999����� �����û�ڼ�
corr2 = corrcoef(y1,y2);
disp(['������ �׷� �߻� �Ǽ��� ���� �⵵ �����û�ڼ� ������ ��������  ',num2str(corr2(1,2))]);
% �ش� �⵵���� �����⵵�� �����û�ڼ��� �� ������谡 ������ �� �� �ִ�. (�׷��� ���� �߻��� �Ŀ� �����û�� �����Ѵ�.)

