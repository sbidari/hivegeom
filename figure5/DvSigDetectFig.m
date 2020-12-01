function [JJ,opt_JJ,opt_theta]=DvSigDetectFig

% Initialiaze here
list_v10 = linspace(0,.5,501);
f_plus = 2*betapdf(2*list_v10,5,5);
f_minus = 2*betapdf(2*list_v10,1.5,6);

% define parameters here
params.Dw = 0;
params.beta = 1;
list_Dv =  linspace(0,10,21);
list_theta = linspace(0,.5,501);

JJ = zeros(1,length(list_theta));

for k = 1:length(list_Dv)
    params.Dv = list_Dv(k);
    for i = 1:length(list_theta)
        params.theta = list_theta(i);
        for j = 1:length(list_v10)
            v10 = list_v10(j);
            v_s(j,i) = sim_comt(params,v10);
        end
        J1 = 1 - trapz(list_v10,v_s(:,i)'.*f_minus);
        J2 = trapz(list_v10,v_s(:,i)'.*f_plus);
        JJ(i) = J1+J2;
    end
    k
    pos =  find(JJ == max(JJ));
    opt_theta(k) = list_theta(pos(1));
    opt_JJ(k) = JJ(pos(1));
end

figure;
plot(list_Dv, opt_theta,'LineWidth',4.0)
set(gca,'fontsize',30);
ylabel('$\theta$','fontsize',30,'interpreter','latex');
xlabel('$D_v$','fontsize',30,'interpreter','latex');

end
