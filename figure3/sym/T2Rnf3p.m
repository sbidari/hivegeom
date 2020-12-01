function [time,list_B,list_Dv] = T2Rnf3p

initial.v1 = 0;
initial.v2 = .15;
initial.v3 = 0;
initial.w1 = (1-initial.v1-initial.v2-initial.v3)/3;
initial.w2 = (1-initial.v1-initial.v2-initial.v3)/3;
initial.w3 = (1-initial.v1-initial.v2-initial.v3)/3;

list_B = linspace(0,10,20);
list_Dv = linspace(0,10,20);
params.Dw = .1;
params.theta = 0.1;

for i = 1:length(list_B)
    params.beta = list_B(i);
    for j = 1:length(list_Dv)
        params.Dv = list_Dv(j);
        [t,y] = symthreepatchnf(params,initial);
        comt = y(:,1)+y(:,2)+y(:,3);
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
pcolor(list_Dv,list_B,log10(time)); shading flat; colorbar;
set(gca,'fontsize',20);
xlabel('$D_v$','fontsize',25,'interpreter','latex');
ylabel('$\beta$','fontsize',25,'interpreter','latex');

end