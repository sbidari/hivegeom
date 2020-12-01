function [JJ,v_s]=SigDetectFig

% define pdf variables here
list_theta = linspace(0,1,101);

% Initialiaze here
list_v10 = linspace(0,.5,51);
f_plus = 2*betapdf(2*list_v10,5,5);
f_minus = 2*betapdf(2*list_v10,1.5,6);
% figure; hold on;
% plot(list_v10,f_plus,'Color',[0.2588,0.5725,0.7764],'LineWidth',4.0);
% plot(list_v10,f_minus,'Color',[0.9882,0.3058,0.1647],'LineWidth',4.0);
% set(gca,'fontsize',30);
% ylabel('$f(v_1(0))$','fontsize',30,'interpreter','latex');
% xlabel('$v_1(0)$','fontsize',30,'interpreter','latex');


% define parameters here
params.Dw = 0;
params.Dv = 4;
params.beta = 1;
params.lambda = 2;
params.mu = .1;

v_s = zeros(length(list_theta),length(list_v10));
JJ = zeros(1,length(list_theta));

for i = 1:length(list_theta)
    params.theta = list_theta(i);
    for j = 1:length(list_v10)
        v10 = list_v10(j);
        v_s(i,j) = sim_comt(params,v10);
    end
    i
    J1 = 1 - trapz(list_v10,v_s(i,:).*f_minus);
    J2 = trapz(list_v10,v_s(i,:).*f_plus);
    JJ(i) = J1+J2;
end

figure;
plot(list_theta, JJ,'k','LineWidth',4.0)
set(gca,'fontsize',30);
ylabel('J','fontsize',30,'interpreter','latex');
xlabel('$\theta$','fontsize',30,'interpreter','latex');
hold on;
pos =  find(JJ == max(JJ));
plot(list_theta(pos),JJ(pos),'.','MarkerSize',50);
plot(list_theta(pos)*ones(1,51),2*linspace(0,1,51),'Color',[.7 .7 .7])
hold off;
list_theta(pos)
JJ(pos)
end
