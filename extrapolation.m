%% 2017년까지 테러 발생 건수를 바탕으로 2018년도 망명신청자수를 예측(extrapolation)

terror_per_year =  no_of_attack_by_year(28:end-1);      %1998년부터 테러 발생횟수
asylum_per_year = no_of_asylumseekers_by_year;   %1999년부터 망명신청자수
x = terror_per_year;  
scatter(terror_per_year,asylum_per_year,'filled');

hold on;
% Coefficients (with 95% confidence bounds):
a = 3.329e+04;
b = 0.003665;
c =  3.746e+05;
% Linear model:
x =  linspace(min(x),max(x),10000);
y = a*(sin(x-pi)) + b*((x-10).^2) + c;
plot(x,y,'LineWidth',0.01);
title('extrapolation');
legend('연도별 테러발생건수에 따른 망명신청자수','curvefitting한 함수');
hold off;

% r^2 계산
x = terror_per_year;
y = a*(sin(x-pi)) + b*((x-10).^2) + c;
rs = rsquare(terror_per_year, asylum_per_year,y);
disp(['연도별 테러발생수와 망명신청자수로 curvefitting한 그래프와 실제 데이터(연도별 망명신청자수)간의  결정계수(R2)는 ', num2str(rs)]);

x = no_of_attack_by_year(end);   % 2017년도의 테러발생건수
y = a*(sin(x-pi)) + b*((x-10).^2) + c;  % 2017년도의 테러발생건수에 따른 2018년도의 망명신청자수 예측(extrapolation)
disp(['2018년에는 ', num2str(round(y)), '명의 망명신청자수가 예상된다.']);

