%%preprocessing
%resettlement.csv�� �����͸� ����ϱ� ���� �������� ���̺�� �ҷ�����

countryandvalue = readtable('resettlement.csv');
 
%% ������ ���� ������ ����׷��� ���  ����

Countries = countryandvalue(:,1); %������������ �̰� Countries��� ������ ����
Value = countryandvalue(:,4); % ������������ ������ �̰� Value��� ������ ����

countryandvalue=  [array2table(Countries),array2table(Value)];

[can,CountryNames] = findgroups(countryandvalue. Countries); % can�� CountryNames��� ������ ��ȣ �Ҵ�

addvalue = splitapply(@nansum,Value, can);% addvalue��� ������ can�� ���ԵǴ� Value�� ���� ����

table =  [array2table(CountryNames),array2table(addvalue)]; %�����ϱ� ���� table������ ����

table = sortrows(table,2,'descend'); % addvalue�� �������� ����

table = table(1:30,:); %���� 30���� ����

x = categorical({'United States of America';'Canada';'Australia';'Sweden';'Norway';'United Kingdom of Great Britain and Northern Ireland';'New Zealand';'Denmark';'Netherlands';'Finland';'Germany';'Ireland';'Japan';'France';'Switzerland';'Belgium';'Austria';'Brazil';'Italy';'Iceland';'Spain';'Chile';'Argentina';'Iran (Islamic Rep. of)';'Benin';'Luxembourg';'Portugal';'Uruguay';'Czech Rep.';'Philippines'});

%���� 30������ �������� cell�� ���� rearrange_country�� ����
rearrange_country = {'United States of America';'Canada';'Australia';'Sweden';'Norway';'United Kingdom of Great Britain and Northern Ireland';'New Zealand';'Denmark';'Netherlands';'Finland';'Germany';'Ireland';'Japan';'France';'Switzerland';'Belgium';'Austria';'Brazil';'Italy';'Iceland';'Spain';'Chile';'Argentina';'Iran (Islamic Rep. of)';'Benin';'Luxembourg';'Portugal';'Uruguay';'Czech Rep.';'Philippines'};

x = reordercats(x,rearrange_country); %���ĺ��� �ڵ����� �����ϱ� ������ sorting�ϴµ��� ��迭

% ����׷��� ���
bar(x,table.addvalue); 
title('������ ���� ���μ�');
xlabel('����'); % x�� 
ylabel('�������μ�'); %y��
yticks([0 500000 1000000 1500000  2000000 2500000 3000000]);
yticklabels({'0','50����','100����','150����','200����','250����','300����'});

