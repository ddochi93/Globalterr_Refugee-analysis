%% 각 나라별 난민 신청수
load asylum_o.mat
% 필요한 column 분리
origin = asylumseekersmonthly.Origin;   % 나라 이름
value = asylumseekersmonthly.Value;     % 난민 신청자 수
% NaN값 제거 (Not a Number)
TF = isnan(value);                      % 숫자면 0, 숫자가 아니면 1이 TF에 저장됨
value = value(~TF);                     % 원하는 건 숫자이므로 ~TF로 써야함
origin = origin(~TF);
% 나라 이름으로 그룹화해서 모두 더함
[FG, groups] = findgroups(origin);      % FG에는 그룹 넘버가 저장되고 groups에는 나라 이름이 저장됨
SA = splitapply(@sum, value, FG);       % 그룹 넘버가 같은 value끼리 더함
% bar(groups, SA)

% 상위 20 나라 분리
ta = [array2table(groups), array2table(SA)];    % 정렬하기위해 table로 만듦
ta = sortrows(ta,2);                            % SA를 기준으로 정렬
ta(1:end-20,:) = [];                            % 맨 밑의 20개의 데이터만 남김

groups = table2array(ta(:,1));
value = table2array(ta(:,2));
groups = string(groups);                        % 그대로 bar를 그리면 x레이블이 더러워지기 때문에
groups = categorical(groups, flip(groups));     % 나라이름을 string형으로 바꾸고 다시 categorical형으로 변환
bar(groups, value);
ylabel('numbers');
title('나라별 난민 신청자 수');

%% 난민 신청 목적지별 난민 신청수
load asylum_o.mat
% 필요한 column 분리
country = asylumseekersmonthly.Countryterritoryofasylumresidence;    % 나라 이름
countryValue = asylumseekersmonthly.Value;                           % 난민 신청자 수
% NaN값 제거 (Not a Number)
cTF = isnan(countryValue);                      % 숫자면 0, 숫자가 아니면 1이 TF에 저장됨
countryValue = countryValue(~cTF);              % 원하는 건 숫자이므로 ~TF로 써야함
country = country(~cTF);
% 나라 이름으로 그룹화해서 모두 더함
[cFG, groups] = findgroups(country);             % FG에는 그룹 넘버가 저장되고 groups에는 나라 이름이 저장됨
cSA = splitapply(@sum, countryValue, cFG);       % 그룹 넘버가 같은 value끼리 더함
% bar(groups, cSA)

% 상위 20 나라 분리
cta = [array2table(groups), array2table(cSA)];    % 정렬하기위해 table로 만듦
cta = sortrows(cta,2);                            % SA를 기준으로 정렬
cta(1:end-20,:) = [];                             % 맨 밑의 20개의 데이터만 남김

cg = table2array(cta(:,1));
cv = table2array(cta(:,2));
cg = string(cg);                  % 그대로 bar를 그리면 x레이블이 더러워지기 때문에
cg = categorical(cg, cg);         % 나라이름을 string형으로 바꾸고 다시 categorical형으로 변환
bar(cg, cv);
title('난민 신청 목적지별 난민 신청자 수')