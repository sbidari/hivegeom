function [t,y] = twopatchplot

params.beta = 1;
params.Dv = .66;
params.lambda =.05;
params.mu =.045;
% params.lambda =.1;
% params.mu =.14;
params.Dw = 0;
params.theta = 0.1;

initial.u = 0;         % initial foraging bees
initial.v1 = 0.15;          % initial recruitting bees
initial.v2 = 0; 
initial.w1 = (1-initial.v1-initial.v2-initial.u)/2;
initial.w2 = (1-initial.v1-initial.v2-initial.u)/2;

end_time = 50;  % end of simulation time span starting at 0
opts = odeset('RelTol',1e-12,'AbsTol',1e-16);

[t, y] = ode45(@(t, x) derivative(x, params), ...
    [0 end_time],cell2mat(struct2cell(initial)),opts);

figure; hold on;
C = linspecer(16); 
plot (t, y(:,1),'LineWidth',4,'color',C(3,:)); plot (t, y(:,2),'LineWidth',4,'color',C(15,:));
plot (t, y(:,3),'LineWidth',4,'color',C(12,:)); plot (t, y(:,4),'LineWidth',4,'color',C(1,:));
plot (t, y(:,5),'LineWidth',4,'color',C(6,:));
plot(linspace(0,end_time,10),0.1*ones(10,1),'--','lineWidth',2,'Color',[.7 .7 .7]);
hold off;
set(groot, 'defaultAxesTickLabelInterpreter','latex'); 
set(groot, 'defaultLegendInterpreter','latex');
set(gca,'fontsize',30);
% xlabel('time','fontsize',25,'interpreter','latex');
% ylabel('Individuals committed','fontsize',25,'interpreter','latex');
ylim([0 .8])
% legend('$u$','$v_1$','$v_2$','$w_1$','$w_2$');


end

function [dxdt] = derivative(x, params)
dxdt = zeros(5,1);

dxdt(1) = (params.beta)*(heaviside(x(2)-params.theta)*x(4)+heaviside(x(3)-params.theta)*x(5)) - params.lambda*x(1) + params.mu*(x(2)+x(3));
dxdt(2) = (params.lambda)*x(1) - params.mu*x(2) + params.Dv*(x(3)-x(2));
dxdt(3) = - params.mu*x(3) + params.Dv*(x(2)-x(3));
dxdt(4) = -(params.beta)*heaviside(x(2)-params.theta)*x(4) + params.Dw*(x(5)-x(4));
dxdt(5) = -(params.beta)*heaviside(x(3)-params.theta)*x(5) + params.Dw*(x(4)-x(5));

end