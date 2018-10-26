%% ���� �׷� �߻� �� geobubble
%load gt.mat
country = categorical(table2array(readtable('global_terror.xlsx', 'Range', 'E:E')));
latitude = table2array(readtable('global_terror.xlsx', 'Range', 'J:J'));
longitude = table2array(readtable('global_terror.xlsx', 'Range', 'K:K'));

%country = gt(:,1);        % �����̸�
%latitude = gt(:,2);
%longitude = gt(:,3);

%country = table2array(country);
%latitude = table2array(latitude);
%longitude = table2array(longitude);

% latitude NaN ����
tf = isnan(latitude);           % NaN�̸� 1, �ƴϸ� 0
country = country(~tf);         % NaN�� �����ؾ��ϹǷ� ~tf�� ���
latitude = latitude(~tf);
longitude = longitude(~tf);
% longitude NaN ����
tf = isnan(longitude);
country = country(~tf);
latitude = latitude(~tf);
longitude = longitude(~tf);

[group_num, groups] = findgroups(country);               % fg�� �׷�ѹ�, gr�� �����̸�
mean_latitude = splitapply(@mean, latitude, group_num);      % ���� latitude ���
mean_longitude = splitapply(@mean, longitude, group_num);    % ���� longitude ���

value = ones(size(group_num));                % v�� �׷� �߻� Ƚ���� ���� ���� column
sum_value = splitapply(@sum, value, group_num);   % ���� �׷� �߻� Ƚ��
% subplot(2,1,1);
% geo = geobubble(mean_latitude, mean_longitude, sum_value, groups);

% �׷� �߻� Ƚ�� ���� 30����
ta = [array2table(groups), array2table(mean_latitude), array2table(mean_longitude), array2table(sum_value)];
ta = sortrows(ta,4);
ta(1:end-30,:) = [];

country30 = table2array(ta(:,1));
latitude30 = table2array(ta(:,2));
longitude30 = table2array(ta(:,3));
value30 = table2array(ta(:,4));

% subplot(2,1,2);
geo30 = geobubble(latitude30, longitude30, value30, country30);
title('�׷� �߻��� top30 ������');