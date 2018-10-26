%% ����

% resettlement : �ٸ� ������ ���������� ������ ������ �ǹ�
% asylum_seekers : �ڽ��� �������� ������ ��û�� ����
% global_terror : ������ ��� ������ �׷� ������


warning('off','all');

%% ���ε��� ���� ������ ���� top 15
figure(1);
% ������ ���� ���� ����
subplot(1,2,1);
resettlement_cnt;

% ����(������) ���� ���뱹�� top15 in bar chart - �̶�ũ,�ø���,��Ű��ź,�������Ͻ�ź
subplot(1,2,2);
barstacked;

%% ������ ���� �޴� ���� top30 & �׷��� ���� �߻��� ���� top 30 (geobubble)
figure(2); % �ι�° �׷���
subplot(1,2,1);
resettlement_gb;

subplot(1,2,2);
geob;


%% ������ ���� �޴� ���� top30 & �׷��� ���� �߻��� ���� top 15 (bar)
% ���� ���� ���뱹�� top 30
figure(3);
subplot(1,2,1);
resettlement_wordcloud;

% �׷��� ���� �߻��� ����.
subplot(1,2,2);
terror_top15_bar;



%% ������ ���� ���� ��
figure(4);
subplot(2,1,1);
resettlement_per_year;

%% ������ �׷��߻� �Ǽ�
subplot(2,1,2);
terror_per_year;

%% ������ ���� ���� ���� �׷��߻� �Ǽ� ������ �������
figure(5);
relation_between_resettle_and_terror_per_year;

%% ������ �׷��߻� �Ǽ�
figure(6);
subplot(2,1,1);
terror_per_year;

%% ������ �����û�ڼ�
subplot(2,1,2);
asylum_seekers_per_year;

%% ������ �׷��߻� �Ǽ��� �����û�ڼ� ������ �������
figure(7);
relation_between_asylumseekrs_and_terror_per_year;

%% ������ �׷��߻� �Ǽ��� �ش� ������ �����û�ڼ� ������ �������
% without curve fitting
figure(8);
result_plot;
% with curvefitting tool & remove outliers
figure(9);
result_plot_with_curvefitting;


%% 2017����� �׷� �߻� �Ǽ��� �������� 2018�⵵ �����û�ڼ��� ����(extrapolation)
figure(10);
extrapolation;

