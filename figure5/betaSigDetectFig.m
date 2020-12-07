function [JJ,opt_JJ,opt_theta,Vs]=betaSigDetectFig
% Figure 5.d

% Initialiaze here
list_v10 = linspace(0,.5,51);
f_plus = 2*betapdf(2*list_v10,5,5);
f_minus = 2*betapdf(2*list_v10,1.5,6);
figure; hold on;
plot(list_v10,f_plus,'Color',[0.2588,0.5725,0.7764],'LineWidth',4.0);
plot(list_v10,f_minus,'Color',[0.9882,0.3058,0.1647],'LineWidth',4.0);
set(gca,'fontsize',30);
ylabel('$f(v_1(0))$','fontsize',30,'interpreter','latex');
xlabel('$v_1(0)$','fontsize',30,'interpreter','latex');

% define parameters here
params.Dw = 0;
params.Dv = 5;
list_beta =  linspace(0.1,10,25);
list_theta = linspace(0,.5,25);

for k = 1:length(list_beta)
    params.beta = list_beta(k);
    
    v_s = zeros(length(list_v10),length(list_theta));
    JJ = zeros(1,length(list_theta));
    
    for i = 1:length(list_theta)
        params.theta = list_theta(i);
        for j = 1:length(list_v10)
            v10 = list_v10(j);
            v_s(j,i) = sim_comt(params,v10);
            Vs(k,j,i) = v_s(j,i);
        end
%         list_v10
%         v_s(:,i)'
%         f_minus
        J1 = 1 - trapz(list_v10,v_s(:,i)'.*f_minus);
        J2 = trapz(list_v10,v_s(:,i)'.*f_plus);
        JJ(k,i) = J1+J2;
    end
    k
    pos =  find(JJ(k,:) == max(JJ(k,:)));
    opt_theta(k) = list_theta(pos)
    opt_JJ(k) = JJ(k,pos)
    
end

figure;
plot(list_beta, opt_theta,'LineWidth',4.0)
set(gca,'fontsize',30);
ylabel('$\theta$','fontsize',30,'interpreter','latex');
xlabel('$\beta$','fontsize',30,'interpreter','latex');

end
