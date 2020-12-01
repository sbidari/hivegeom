function [listN,time, minT,list_Dv]=T2Rnf

init = .1;      % v_1(0)
listN = 2:10;
list_Dv = logspace(-2,1,101);

params.theta = 0.05;
params.Dw = 0;
params.beta = 0.1;
end_time = 500;

for i = 1:length(listN)
    N=listN(i);
    f = strcat('simu',num2str(N))
    for j = 1:length(list_Dv)
        params.Dv = list_Dv(j);
        [t,y,comt] =  feval(f,params,init,end_time);
        pos =  find(comt >= .9);
        if ~isempty(pos)
            time(i,j) = t(pos(1));
        else
            time(i,j) = NaN;
        end
    end 
  minT(i) = min(time(i,:));
    i
end
save('B01T2RnfDw0.mat','listN','time','minT','list_Dv')

figure;
plot(listN,minT)
set(gca,'fontsize',20);
xlabel('$N$','fontsize',25,'interpreter','latex');
ylabel('$t$','fontsize',25,'interpreter','latex');

figure; plot(list_Dv,time)

end
