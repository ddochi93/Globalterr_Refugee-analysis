
%% 국가별 테러발생건수와 망명신청자수 사이의 상관관계 분석(curve fitting)
% remove outliers
 no_of_terror_attacks([2,80,143]) = [];
  no_of_asylum_seekers([2,80,143]) = [];   % 알바니아 ,코소보 ,시리아는 내전 & 아이티는 지진과 연관되므로 제외
  relation_bet_terr_asyl = corrcoef(no_of_asylum_seekers,no_of_terror_attacks);
  relation_bet_terr_asyl = ['국가별 테러발생 횟수와 망명 신청자수 간의 상관계수는 ',num2str(relation_bet_terr_asyl(2,1))];
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
xlabel('망명 신청자 수');
ylabel('테러 발생 건수');



% curvefitting 첨가
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
hold off; % 빼야하나?
  
x = no_of_asylum_seekers;
y  = a*exp(b*x) + c*exp(d*x);
rtn = rsquare(no_of_asylum_seekers,no_of_terror_attacks, y);
disp(['국가별테러발생수와 망명신청자수로 curvefitting한 그래프와 실제 데이터(국가별 테러발생건수)간의 결정계수(R2)는 ', num2str(rtn)]);

