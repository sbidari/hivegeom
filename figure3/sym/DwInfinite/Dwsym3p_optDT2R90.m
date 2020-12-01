function [time,list_v1,list_beta] = Dwsym3p_optDT2R90
 
load('DwInfsym3p_theta01.mat','D','list_beta','list_v1')
 
D(isnan(D))=100;
params.Dw = 500;
params.theta = 0.10;
time = zeros(length(list_beta),length(list_v1));
 
for i = 1:length(list_beta)
    params.beta = list_beta(i);
     time(i,1)=NaN;
    for j = 2:length(list_v1)
        initial.v1 = 0;
        initial.v2 = list_v1(j);
        initial.v3 = 0;
        initial.w1 = (1-initial.v1-initial.v2-initial.v3)/3;
        initial.w2 = (1-initial.v1-initial.v2-initial.v3)/3;
        initial.w3 = (1-initial.v1-initial.v2-initial.v3)/3;
        params.Dv = D(i,j)-1; 
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
pcolor(list_v1,list_beta,log(time)); shading flat; colorbar
set(gca,'fontsize',20);
xlabel('$v_2(0)$','fontsize',25,'interpreter','latex');
ylabel('$\beta$','fontsize',25,'interpreter','latex');
 
end