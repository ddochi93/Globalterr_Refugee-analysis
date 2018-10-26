%% 나라별 테러 발생 수 geobubble
%load gt.mat
country = categorical(table2array(readtable('global_terror.xlsx', 'Range', 'E:E')));
latitude = table2array(readtable('global_terror.xlsx', 'Range', 'J:J'));
longitude = table2array(readtable('global_terror.xlsx', 'Range', 'K:K'));

%country = gt(:,1);        % 나라이름
%latitude = gt(:,2);
%longitude = gt(:,3);

%country = table2array(country);
%latitude = table2array(latitude);
%longitude = table2array(longitude);

% latitude NaN 제거
tf = isnan(latitude);           % NaN이면 1, 아니면 0
country = country(~tf);         % NaN을 제거해야하므로 ~tf로 사용
latitude = latitude(~tf);
longitude = longitude(~tf);
% longitude NaN 제거
tf = isnan(longitude);
country = country(~tf);
latitude = latitude(~tf);
longitude = longitude(~tf);

[group_num, groups] = findgroups(country);               % fg에 그룹넘버, gr에 나라이름
mean_latitude = splitapply(@mean, latitude, group_num);      % 나라별 latitude 평균
mean_longitude = splitapply(@mean, longitude, group_num);    % 나라별 longitude 평균

value = ones(size(group_num));                % v는 테러 발생 횟수를 세기 위한 column
sum_value = splitapply(@sum, value, group_num);   % 나라별 테러 발생 횟수
% subplot(2,1,1);
% geo = geobubble(mean_latitude, mean_longitude, sum_value, groups);

% 테러 발생 횟수 상위 30개국
ta = [array2table(groups), array2table(mean_latitude), array2table(mean_longitude), array2table(sum_value)];
ta = sortrows(ta,4);
ta(1:end-30,:) = [];

country30 = table2array(ta(:,1));
latitude30 = table2array(ta(:,2));
longitude30 = table2array(ta(:,3));
value30 = table2array(ta(:,4));

% subplot(2,1,2);
geo30 = geobubble(latitude30, longitude30, value30, country30);
title('테러 발생수 top30 국가들');