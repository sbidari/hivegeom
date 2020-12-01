function [time,list_v1,list_beta,minT,minD] = asym3p_T2R90

list_beta = linspace(.1,10,51);
list_v1 = linspace(0.15,1/2,41);
list_D = linspace(0,100,101);
params.Dw = 0;
params.theta = 0.15;

for i = 1:length(list_beta)
    params.beta = list_beta(i);
    for j = 2:length(list_v1)
        initial.v1 = list_v1(j);
        initial.v2 = 0;
        initial.v3 = 0;
        initial.w1 = (1-initial.v1-initial.v2-initial.v3)/3;
        initial.w2 = (1-initial.v1-initial.v2-initial.v3)/3;
        initial.w3 = (1-initial.v1-initial.v2-initial.v3)/3;
        for k = 1:length(list_D)
            params.Dv = list_D(k);
            [t,y] = asymthreepatchnf(params,initial);
            comt = y(:,1)+y(:,2)+y(:,3);
            pos =  find(comt >= .9);
            if isempty(pos)
                time(k) = NaN;
            else
                time(k) = t(pos(1));
            end
        end

        minT(i,j) = min(time);
        pos= find(time==min(time));
        if isempty(pos)
            minD(i,j) =  NaN;
        else
            minD(i,j) = list_D(pos(1));
        end     
    end
    i
end


% figure;
% colormap(hot);
% hold on;
% pcolor(list_v1,list_beta,log(time)); shading flat; colorbar
% set(gca,'fontsize',20);
% xlabel('$v_1(0)$','fontsize',25,'interpreter','latex');
% ylabel('$\beta$','fontsize',25,'interpreter','latex');

end