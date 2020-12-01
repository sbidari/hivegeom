function [t,y] = sim2patchnf(params,initial)

params.Dw = 1.2;
params.beta = 10;
params.Dv =  1;
params.theta = .1;

initial.v1 = .12;          % initial recruitting bees
initial.v2 = 0;
initial.w1 = 0;
initial.w2 = (1-initial.v1-initial.v2-initial.w1);

initial.v1 = .12;          % initial recruitting bees
initial.v2 = 0;
initial.w1 = (1-initial.v1-initial.v2)/2;
initial.w2 = (1-initial.v1-initial.v2)/2;

end_time = 5; 
opts = odeset('RelTol',1e-12,'AbsTol',1e-12);

[t, y] = ode45(@(t, x) derivative(x, params), ...
    [0 end_time],cell2mat(struct2cell(initial)),opts);

figure; hold on;
C = linspecer(16); 
plot (t, y(:,1),'LineWidth',5,'color',C(15,:)); plot (t, y(:,2),'LineWidth',5,'color',C(12,:));
plot (t, y(:,3),'LineWidth',5,'color',C(1,:)); plot (t, y(:,4),'LineWidth',5,'color',C(6,:));
plot(linspace(0,end_time,10),params.theta*ones(10,1),'--','lineWidth',2,'Color',[.7 .7 .7]);

set(groot, 'defaultAxesTickLabelInterpreter','latex'); 
set(groot, 'defaultLegendInterpreter','latex');
set(gca,'fontsize',30);
ylim([0 1])
% legend('$v_1$','$v_2$','$w_1$','$w_2$');

end

function [dxdt] = derivative(x, params)

dxdt = zeros(4,1);

dxdt(1) = (params.beta)*(heaviside(x(1)-params.theta)*x(3)+heaviside(x(2)-...
    params.theta)*x(4)) + params.Dv*(x(2)-x(1)) ;
dxdt(2) =  params.Dv*(x(1)-x(2));
dxdt(3) = -(params.beta)*heaviside(x(1)-params.theta)*x(3) + params.Dw*(x(4)-x(3));
dxdt(4) = -(params.beta)*heaviside(x(2)-params.theta)*x(4) + params.Dw*(x(3)-x(4));

end


