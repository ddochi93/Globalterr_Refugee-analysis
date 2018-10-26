function rsquare = rsquare(~,y,y_tmp)

%%
% 
% <<Rsquare_formula.PNG>>
% 
s_tot = sum((y - mean(y)).^2);
s_residual = sum( (y - y_tmp).^2 );
rsquare  = 1 - (s_residual/ s_tot);
end
