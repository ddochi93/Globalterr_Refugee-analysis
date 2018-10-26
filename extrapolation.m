%% 2017����� �׷� �߻� �Ǽ��� �������� 2018�⵵ �����û�ڼ��� ����(extrapolation)

terror_per_year =  no_of_attack_by_year(28:end-1);      %1998����� �׷� �߻�Ƚ��
asylum_per_year = no_of_asylumseekers_by_year;   %1999����� �����û�ڼ�
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
legend('������ �׷��߻��Ǽ��� ���� �����û�ڼ�','curvefitting�� �Լ�');
hold off;

% r^2 ���
x = terror_per_year;
y = a*(sin(x-pi)) + b*((x-10).^2) + c;
rs = rsquare(terror_per_year, asylum_per_year,y);
disp(['������ �׷��߻����� �����û�ڼ��� curvefitting�� �׷����� ���� ������(������ �����û�ڼ�)����  �������(R2)�� ', num2str(rs)]);

x = no_of_attack_by_year(end);   % 2017�⵵�� �׷��߻��Ǽ�
y = a*(sin(x-pi)) + b*((x-10).^2) + c;  % 2017�⵵�� �׷��߻��Ǽ��� ���� 2018�⵵�� �����û�ڼ� ����(extrapolation)
disp(['2018�⿡�� ', num2str(round(y)), '���� �����û�ڼ��� ����ȴ�.']);

