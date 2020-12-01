function [list_B,time,list_Dv]=T2Rnf2p

init = .1;      % v_1(0)
list_B = linspace(0,5,51);
list_Dv = logspace(-3,1,101);

params.theta = 0.05;
params.Dw = 1;
end_time = 100;

for i = 1:length(list_B)
    params.beta = list_B(i);
    for j = 1:length(list_Dv)
        params.Dv = list_Dv(j);
        [t,y,comt] =  simu2(params,init,end_time);
        pos =  find(comt >= .9);
        if ~isempty(pos)
            time(i,j) = t(pos(1));
        else
            time(i,j) = NaN;
        end
    end 
    i
end
% save('2pT2RnfDw0.mat','list_B','time','list_Dv')

figure;
colormap(hot);
hold on;
pcolor(list_Dv,list_B,log10(time)); shading flat; colorbar;
[B1,hfigc] = contour(log10(list_Dv),list_B,log10(time));
clabel(B1,hfigc)
set(gca,'fontsize',20);
xlabel('$D_v$','fontsize',25,'interpreter','latex');
ylabel('$\beta$','fontsize',25,'interpreter','latex');

end
