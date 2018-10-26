%% ���ε��� ���� ������ ���� top 30
% ���� ���� ���뱹�� top 30
% resettlement_DB = readtable('resettlement.xlsx');  %xlsx���Ϸκ��� �ʿ��� data����(*��0���ιٲ�)
resettlement_DB = readtable('resettlement2.csv');
[country_flag,country] = findgroups(resettlement_DB(:,1)); %country���� �з��� ������ ��.
country = table2array(country);
no_of_resettlement_by_country = splitapply(@nansum, resettlement_DB(:,4), country_flag); %�������� �����μ�
no_by_country_table = [cell2table(country),array2table(no_of_resettlement_by_country)];
%  bar(country,no_of_resettlement_by_country);
 
 wordcloud(no_by_country_table,'country','no_of_resettlement_by_country');