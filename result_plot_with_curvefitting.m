
%% ������ �׷��߻��Ǽ��� �����û�ڼ� ������ ������� �м�(curve fitting)
% remove outliers
 no_of_terror_attacks([2,80,143]) = [];
  no_of_asylum_seekers([2,80,143]) = [];   % �˹ٴϾ� ,�ڼҺ� ,�ø��ƴ� ���� & ����Ƽ�� ������ �����ǹǷ� ����
  relation_bet_terr_asyl = corrcoef(no_of_asylum_seekers,no_of_terror_attacks);
  relation_bet_terr_asyl = ['������ �׷��߻� Ƚ���� ���� ��û�ڼ� ���� �������� ',num2str(relation_bet_terr_asyl(2,1))];
  disp(relation_bet_terr_asyl);
for i = 1:length(no_of_terror_attacks)
        hold on
        markerSize = no_of_terror_attacks(i) / 100;
        if(markerSize < 10)
            markerSize =10;
        end
        plot(no_of_asylum_seekers(i),no_of_terror_attacks(i),'Color',[rand(), rand(), rand()],'Marker','.','LineStyle','none','MarkerSize',markerSize);
       
           axis([-2000 1000000 -2000 25000]);
%          legend(nation);
    
end
xlabel('���� ��û�� ��');
ylabel('�׷� �߻� �Ǽ�');



% curvefitting ÷��
% y =no_of_terror_attacks;
x= no_of_asylum_seekers;

a =        1183 ;
b =   2.958e-06 ;
c =      -932.7  ;      
d =   4.305e-07  ;
x =  linspace(min(x),max(x),10000);

y=a*exp(b*x) + c*exp(d*x);

hold on;
plot(x,y,'LineWidth',3,'Color','red');
hold off; % �����ϳ�?
  
x = no_of_asylum_seekers;
y  = a*exp(b*x) + c*exp(d*x);
rtn = rsquare(no_of_asylum_seekers,no_of_terror_attacks, y);
disp(['�������׷��߻����� �����û�ڼ��� curvefitting�� �׷����� ���� ������(������ �׷��߻��Ǽ�)���� �������(R2)�� ', num2str(rtn)]);

