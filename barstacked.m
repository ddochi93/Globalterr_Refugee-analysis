%%  ����(������) ���� ���뱹�� top30 in bar chart 

resettlement = readtable('resettlement2.csv', 'ReadVariableNames', false);
resettlement(1,:) = [];
resettlement = table2array(resettlement);

Country = resettlement(:,1);
Country = categorical(Country);
Origin = resettlement(:,2);
Origin = categorical(Origin);
Value = resettlement(:,4);
Value = str2double(Value);

[group_num, country, origin] = findgroups(Country, Origin);
sa = splitapply(@sum, Value, group_num);

% ������, �ø���, �̶�ũ ��Ÿ� ����
barstacked_l = logical(origin == 'Afghanistan' | origin == 'Syrian Arab Rep.' | origin == 'Iraq' | origin == 'Pakistan');
country = country(barstacked_l);
origin = origin(barstacked_l);
group_num = group_num(barstacked_l);
val = sa(barstacked_l);

% �� ������ ������ ��� �ִ� ���� ����
barstacked_ta = [array2table(country), array2table(origin), array2table(val)];
for_count = 0;                      % �� ���� ��� �ִ��� �˱� ���� ����
str = table2array(barstacked_ta(1,1));         % ���� ���� ������ �̸�
for i = 1:size(group_num)
    if table2array(barstacked_ta(i,1)) == str  % ���� ��� ���� ������ ���
        for_count = for_count + 1; 
    else
        if for_count < 4            % �� ���� �� �ϳ��� ������ �����̶� ���� ���
            for j = 1:for_count
                barstacked_ta(i-j,1) = {''};
                barstacked_ta(i-j,2) = {''};
            end
        end
        for_count = 1;
        str = table2array(barstacked_ta(i,1));
    end
end
if for_count < 4                    % ������ ���� ������ ó���� ���� ����
    barstacked_ta(i,1) = {''};
    barstacked_ta(i,2) = {''};
end

[group_num, country] = findgroups(table2array(barstacked_ta(:,1)));
country = categorical(string(country));
origin = table2array(barstacked_ta(:,2));
val = table2array(barstacked_ta(:,3));
total = splitapply(@sum, val, group_num);
Iraq = val(logical(origin == 'Iraq'));
Syria = val(logical(origin == 'Syrian Arab Rep.'));
Afghan = val(logical(origin == 'Afghanistan'));
Pak = val(logical(origin == 'Pakistan'));

sort_table = [array2table(country), array2table(Afghan), array2table(Iraq), array2table(Syria), array2table(Pak), array2table(total)];
sort_table = sortrows(sort_table, 6);
country = string(table2array(sort_table(:,1)));
country = categorical(country, flip(country));
arr = table2array(sort_table(:,2:5));
b = bar(country, arr, 'stacked');
title('������ ���� ���뱹��');
b(1,1).DisplayName = 'Afghanistan';
b(1,2).DisplayName = 'Iraq';
b(1,3).DisplayName = 'Syrian Arab Rep.';
b(1,4).DisplayName = 'Pakistan';
legend;
ylabel('�������μ�');
yticks([0 50000 100000 150000  200000 250000 300000]);
yticklabels({'0','50000','100000','150000','200000','250000','300000'});
hold off;