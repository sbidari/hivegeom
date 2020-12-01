function [list_B,time,list_Dv]=T2Rnf10p

init = .1;      % v_1(0)
list_B = linspace(0,5,101);
list_Dv = logspace(-2,1,201);

params.theta = 0.05;
params.Dw = 5;
end_time = 300;

for i = 1:length(list_B)
    params.beta = list_B(i);
    for j = 1:length(list_Dv)
        params.Dv = list_Dv(j);
        [t,y,comt] =  simu10(params,init,end_time);
        pos =  find(comt >= .9);
        if ~isempty(pos)
            time(i,j) = t(pos(1));
        else
            time(i,j) = NaN;
        end
    end 
    i
end
save('10pT2RnfDw5.mat','list_B','time','list_Dv')

figure;
colormap(hot);
hold on;
pcolor(list_Dv,list_B,log10(time)); shading flat; colorbar;
set(gca,'fontsize',20);
xlabel('$D_v$','fontsize',25,'interpreter','latex');
ylabel('$\beta$','fontsize',25,'interpreter','latex');

end
