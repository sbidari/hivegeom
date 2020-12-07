function [listN, D]=critD

init = .1;      % v_1(0)
listN = 2:10;
list_D = linspace(0,5,201);
v1min = zeros(length(list_D),1);

params.theta = 0.05;
params.Dw = 500;
params.beta = 0.1;
end_time = 20;

for i = 1:length(listN)
    N=listN(i);  

    f = strcat('simu',num2str(N))
    for k = 1:length(list_D)
        params.Dv = list_D(k);
        [t,y,c] =  feval(f,params,init,end_time);
        v1min(k) = min(y(:,1));
    end
    
    pos=find(v1min<=params.theta);
    if isempty(pos)
        D(i)= NaN;
    else
        D(i)=list_D(pos(1));
    end
    i
end
 save('critDinfB01.mat','D','listN')

figure;
plot(listN,D)
set(gca,'fontsize',20);
xlabel('$N$','fontsize',25,'interpreter','latex');
ylabel('$D_v$','fontsize',25,'interpreter','latex');

end
