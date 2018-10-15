%% �� ���� ���� ��û��
load asylum_o.mat
% �ʿ��� column �и�
origin = asylumseekersmonthly.Origin;   % ���� �̸�
value = asylumseekersmonthly.Value;     % ���� ��û�� ��
% NaN�� ���� (Not a Number)
TF = isnan(value);                      % ���ڸ� 0, ���ڰ� �ƴϸ� 1�� TF�� �����
value = value(~TF);                     % ���ϴ� �� �����̹Ƿ� ~TF�� �����
origin = origin(~TF);
% ���� �̸����� �׷�ȭ�ؼ� ��� ����
[FG, groups] = findgroups(origin);      % FG���� �׷� �ѹ��� ����ǰ� groups���� ���� �̸��� �����
SA = splitapply(@sum, value, FG);       % �׷� �ѹ��� ���� value���� ����
% bar(groups, SA)

% ���� 20 ���� �и�
ta = [array2table(groups), array2table(SA)];    % �����ϱ����� table�� ����
ta = sortrows(ta,2);                            % SA�� �������� ����
ta(1:end-20,:) = [];                            % �� ���� 20���� �����͸� ����

groups = table2array(ta(:,1));
value = table2array(ta(:,2));
groups = string(groups);                        % �״�� bar�� �׸��� x���̺��� ���������� ������
groups = categorical(groups, flip(groups));     % �����̸��� string������ �ٲٰ� �ٽ� categorical������ ��ȯ
bar(groups, value);
ylabel('numbers');
title('���� ���� ��û�� ��');

%% ���� ��û �������� ���� ��û��
load asylum_o.mat
% �ʿ��� column �и�
country = asylumseekersmonthly.Countryterritoryofasylumresidence;    % ���� �̸�
countryValue = asylumseekersmonthly.Value;                           % ���� ��û�� ��
% NaN�� ���� (Not a Number)
cTF = isnan(countryValue);                      % ���ڸ� 0, ���ڰ� �ƴϸ� 1�� TF�� �����
countryValue = countryValue(~cTF);              % ���ϴ� �� �����̹Ƿ� ~TF�� �����
country = country(~cTF);
% ���� �̸����� �׷�ȭ�ؼ� ��� ����
[cFG, groups] = findgroups(country);             % FG���� �׷� �ѹ��� ����ǰ� groups���� ���� �̸��� �����
cSA = splitapply(@sum, countryValue, cFG);       % �׷� �ѹ��� ���� value���� ����
% bar(groups, cSA)

% ���� 20 ���� �и�
cta = [array2table(groups), array2table(cSA)];    % �����ϱ����� table�� ����
cta = sortrows(cta,2);                            % SA�� �������� ����
cta(1:end-20,:) = [];                             % �� ���� 20���� �����͸� ����

cg = table2array(cta(:,1));
cv = table2array(cta(:,2));
cg = string(cg);                  % �״�� bar�� �׸��� x���̺��� ���������� ������
cg = categorical(cg, cg);         % �����̸��� string������ �ٲٰ� �ٽ� categorical������ ��ȯ
bar(cg, cv);
title('���� ��û �������� ���� ��û�� ��')