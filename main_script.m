%% 개요

% resettlement : 다른 국가에 최종적으로 정착한 난민을 의미
% asylum_seekers : 자신의 국가에서 망명을 신청한 난민
% global_terror : 전세계 모든 국가의 테러 정보들


warning('off','all');

%% 난민들이 많이 정착한 나라 top 15
figure(1);
% 난민을 많이 받은 나라
subplot(1,2,1);
resettlement_cnt;

% 난민(무슬림) 적극 수용국가 top15 in bar chart - 이라크,시리아,파키스탄,아프가니스탄
subplot(1,2,2);
barstacked;

%% 난민을 많이 받는 나라 top30 & 테러가 많이 발생한 나라 top 30 (geobubble)
figure(2); % 두번째 그래프
subplot(1,2,1);
resettlement_gb;

subplot(1,2,2);
geob;


%% 난민을 많이 받는 나라 top30 & 테러가 많이 발생한 나라 top 15 (bar)
% 난민 적극 수용국가 top 30
figure(3);
subplot(1,2,1);
resettlement_wordcloud;

% 테러가 많이 발생한 나라.
subplot(1,2,2);
terror_top15_bar;



%% 연도별 난민 정착 수
figure(4);
subplot(2,1,1);
resettlement_per_year;

%% 연도별 테러발생 건수
subplot(2,1,2);
terror_per_year;

%% 연도별 난민 정착 수와 테러발생 건수 사이의 상관관계
figure(5);
relation_between_resettle_and_terror_per_year;

%% 연도별 테러발생 건수
figure(6);
subplot(2,1,1);
terror_per_year;

%% 연도별 망명신청자수
subplot(2,1,2);
asylum_seekers_per_year;

%% 연도별 테러발생 건수와 망명신청자수 사이의 상관관계
figure(7);
relation_between_asylumseekrs_and_terror_per_year;

%% 국가별 테러발생 건수와 해당 국가의 망명신청자수 사이의 상관관계
% without curve fitting
figure(8);
result_plot;
% with curvefitting tool & remove outliers
figure(9);
result_plot_with_curvefitting;


%% 2017년까지 테러 발생 건수를 바탕으로 2018년도 망명신청자수를 예측(extrapolation)
figure(10);
extrapolation;

