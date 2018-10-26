
% preprocessing
% globalterrorismdb_0718dist.xlsb ���� �ʿ��� column data�� �����Ͽ� myDB.mat���
% table ������ ����.
% xlsread
 my_terror_DB = readtable('global_terror.xlsx');       %���߿� �ּ�����
% myDB�� load
%  load my_terror_DB.mat

% �׷� �Ǽ��� ���� ���� ������ 28�࿡ count������ �߰�(��� 1�� ����)
count = ones([height(my_terror_DB),1]);
for idx = 1: height(my_terror_DB)
    count(idx) = 1;
end
count = array2table(count(:,1));  %���� table db���� ������ ���� table������ �� ��ȯ
my_terror_DB = [my_terror_DB , count]; %���� table�� count ���� �߰� (�׷��Ǽ��� ���� ����)

% �����ڵ尡 4���� �����Ͽ� splitapply �Լ��� �����ϱⰡ �����Ƿ� ���ο� �����ڵ带 ����
new_country = findgroups(my_terror_DB(:,5));

% ���ο� �����ڵ带 ������ table�� ����.
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
title('�׷� �߻��� ���� ���� top15');
xlabel('����')
ylabel('�׷��߻��Ǽ�');
yticks([0 5000 10000 15000  20000 25000 30000]);
yticklabels({'0','5000','10000','15000','20000','25000','30000'});
