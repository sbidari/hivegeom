function [time,list_v1,list_beta] = T2R90_2p

load('DInf2ptheta01.mat','D','list_beta','list_v1')

D(isnan(D))=100;
params.Dw = 500;
params.theta = 0.1;
time = zeros(length(list_beta),length(list_v1));

for i = 1:length(list_beta)
    params.beta = list_beta(i);
    time(i,1)=NaN;
    for j = 2:length(list_v1)
        initial.v1 = list_v1(j);
        initial.v2 = 0;
        initial.w1 = (1-initial.v1-initial.v2)/2;
        initial.w2 = (1-initial.v1-initial.v2)/2;
        params.Dv = D(i,j)- .2; 
        [t,y] = sim2patchnf(params,initial);
        comt = y(:,1)+y(:,2);
        pos =  find(comt >= .9);
        if isempty(pos)
            time(i,j) = NaN;
        else
            time(i,j) = t(pos(1));
        end
    end
    i
end

figure;
colormap(hot);
hold on;
pcolor(list_v1,list_beta,log(time)); shading flat;
h=colorbar;
set(get(h,'title'),'string','$D_v$');
lev = [-1.5,-1,0,1,1.5];
[B1,hfigc] = contour(list_v1,list_beta,log(time),lev);
set(hfigc,'LineWidth',1.0,'Color', [0 0 0]);
clabel(B1,hfigc,'FontSize',20)
set(gca,'fontsize',25);
xlabel('$v_1(0)$','fontsize',25,'interpreter','latex');
ylabel('$\beta$','fontsize',25,'interpreter','latex');

end