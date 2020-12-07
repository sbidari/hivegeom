function [JJ,v_s]=SigDetectFig

% Figure 5.c

% define pdf variables here
list_theta = linspace(0,.5,501);

% Initialiaze here
list_v10 = linspace(0,.5,101);
f_plus = 2*betapdf(2*list_v10,5,5);
f_minus = 2*betapdf(2*list_v10,1.5,6);


% define parameters here
params.Dw = 0;
params.Dv = 5;
params.beta = 1;

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
