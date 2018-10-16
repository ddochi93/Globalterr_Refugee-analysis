%%
%resettlement2.csv���� �ʿ��� ��������
%Countryterritoryofasylumresidence,Origin,Value ������ resettle_stacked.mat�� ����
%load resettle_stacked.mat;
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

% ������, �ø���, �ƶ� ��Ÿ� ����
l = logical(origin == 'Afghanistan' | origin == 'Syrian Arab Rep.' | origin == 'Iraq');
country = country(l);
origin = origin(l);
group_num = group_num(l);
val = sa(l);

% �� ������ ������ ��� �ִ� ���� ����
ta = [array2table(country), array2table(origin), array2table(val)];
for_count = 0;                      % �� ���� ��� �ִ��� �˱� ���� ����
str = table2array(ta(1,1));         % ���� ���� ������ �̸�
for i = 1:size(group_num)
    if table2array(ta(i,1)) == str  % ���� ��� ���� ������ ���
        for_count = for_count + 1; 
    else
        if for_count < 3            % �� ���� �� �ϳ��� ������ �����̶� ���� ���
            for j = 1:for_count
                ta(i-j,1) = {''};
                ta(i-j,2) = {''};
            end
        end
        for_count = 1;
        str = table2array(ta(i,1));
    end
end
if for_count < 3                    % ������ ���� ������ ó���� ���� ����
    ta(i,1) = {''};
    ta(i,2) = {''};
end

[group_num, country] = findgroups(table2array(ta(:,1)));
country = categorical(string(country));
origin = table2array(ta(:,2));
val = table2array(ta(:,3));
total = splitapply(@sum, val, group_num);
Iraq = val(logical(origin == 'Iraq'));
Syria = val(logical(origin == 'Syrian Arab Rep.'));
Afghan = val(logical(origin == 'Afghanistan'));

sort_table = [array2table(country), array2table(Afghan), array2table(Iraq), array2table(Syria), array2table(total)];
sort_table = sortrows(sort_table, 5);
country = string(table2array(sort_table(:,1)));
country = categorical(country, flip(country));
arr = table2array(sort_table(:,2:4));
b = bar(country, arr, 'stacked');
b(1,1).DisplayName = 'Afghanistan';
b(1,2).DisplayName = 'Iraq';
b(1,3).DisplayName = 'Syrian Arab Rep.';
legend;