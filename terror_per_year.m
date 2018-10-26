%% 연도별 테러발생 건수
[group_by_year,year]= findgroups(my_terror_DB(:,1));
no_of_attack_by_year = splitapply(@nansum,my_terror_DB.Var1,group_by_year);
year = table2array(year);
% subplot(2,1,1);
% h = animatedline;
  axis([1970,2020,0,20000]);
% for k = 1:length(year)
% %     axis([1970,2020,0,180000]);
%     if year(k) == 2011
%         pause(3);
%     end
%     addpoints(h,year(k),no_of_attack_by_year(k));
%     drawnow;
%     pause(0.3);
% end

 plot((year),no_of_attack_by_year );    
title('연도별 테러 발생횟수 추이');
xlabel('연도');
ylabel('테러발생횟수');
 
