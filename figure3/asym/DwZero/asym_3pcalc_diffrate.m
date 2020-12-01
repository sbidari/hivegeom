function[list_beta,list_v1,list_D,D]=asym_3pcalc_diffrate

list_beta = linspace(.1,10,51);
list_v1 = linspace(0.15,1/2,41);
list_D = linspace(0,100,101);
v1min = zeros(length(list_D),1);
params.Dw = 0;

for i = 1:length(list_beta)
    params.beta = list_beta(i);
    for j = 1:length(list_v1)
        
        initial.v1 = list_v1(j);
        initial.v2 = 0;
        initial.v3 = 0;
        initial.w1 = (1-initial.v1-initial.v2-initial.v3)/3;
        initial.w2 = (1-initial.v1-initial.v2-initial.v3)/3;
        initial.w3 = (1-initial.v1-initial.v2-initial.v3)/3;
        
        params.theta = .15 ;
        
        for k = 1:length(list_D)
            params.Dv = list_D(k);
            
            [t,y] = asymthreepatchnf(params,initial);
            v1min(k) = min(y(:,1));
            %             v1max(k) = max(y(:,1));
            %             v2min(k) = min(y(:,2));
            %             v2max(k) = max(y(:,2));
        end
        
        pos=find(v1min<=params.theta);
        if isempty(pos)
            D(i,j)= NaN;
        else
            D(i,j)=list_D(pos(1));
        end
    end
    i
end

figure;
colormap(hot);
hold on;
pcolor(list_v1,list_beta,D); shading flat; colorbar
set(gca,'fontsize',20);
xlabel('$v_1(0)$','fontsize',25,'interpreter','latex');
ylabel('$\beta$','fontsize',25,'interpreter','latex');

end
