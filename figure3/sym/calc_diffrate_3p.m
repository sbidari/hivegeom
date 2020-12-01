function[list_beta,list_v2,list_D,D]=calc_diffrate_3p

list_beta = linspace(.1,10,101);
list_v2 = linspace(0.15,.5,51);
list_D = linspace(0,100,201);
v2min = zeros(length(list_D),1);
params.Dw = 1;
    
for i = 1:length(list_beta)
    params.beta = list_beta(i);
    for j = 1:length(list_v2)
        
        initial.v1 = 0;
        initial.v2 = list_v2(j);
        initial.v3 = 0;
        initial.w1 = (1-initial.v1-initial.v2-initial.v3)/3;
        initial.w2 = (1-initial.v1-initial.v2-initial.v3)/3;
        initial.w3 = (1-initial.v1-initial.v2-initial.v3)/3;
        
        params.theta = 0.15 ;
        
        for k = 1:length(list_D)
            params.Dv = list_D(k);
            
            [t,y] = symthreepatchnf(params,initial);
            v2min(k) = min(y(:,2));
            %             v1max(k) = max( y(:,1));
            %             v2min(k) = min(y(:,2));
            %             v2max(k) = max(y(:,2));
        end
        
        pos=find(v2min<=params.theta);
        if isempty(pos)
            D(i,j)= NaN;
        else
            D(i,j)=list_D(pos(1));
        end
    end
    i
end

figure;
% colorDepth = 10000;
colormap(hot);
hold on;
pcolor(list_v2,list_beta,D); shading flat; colorbar
set(gca,'fontsize',20);
xlabel('$v_1(0)$','fontsize',25,'interpreter','latex');
ylabel('$\beta$','fontsize',25,'interpreter','latex');

end
