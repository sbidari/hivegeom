function [t,y,c] = simu5(params,init,end_time)

% init = .1;
% end_time = 25;
% params.beta = .1;
% % params.Dv = .4786;
% params.Dv = 1;
% params.Dw = 0;
% params.theta = 0.05;

initial.v1 = init;
initial.v2 = 0;
initial.v3 = 0;
initial.v4 = 0;
initial.v5 = 0;
initial.w1 = (1-initial.v1-initial.v2-initial.v3-initial.v4-initial.v5)/5;
initial.w2 = (1-initial.v1-initial.v2-initial.v3-initial.v4-initial.v5)/5;
initial.w3 = (1-initial.v1-initial.v2-initial.v3-initial.v4-initial.v5)/5;
initial.w4 = (1-initial.v1-initial.v2-initial.v3-initial.v4-initial.v5)/5;
initial.w5 = (1-initial.v1-initial.v2-initial.v3-initial.v4-initial.v5)/5;

opts = odeset('RelTol',1e-12,'AbsTol',1e-12);

[t, y] = ode45(@(t, x) derivative(x, params), ...
    [0 end_time],cell2mat(struct2cell(initial)),opts);

c = y(:,1)+y(:,2)+y(:,3)+y(:,4)+y(:,5);

% 
% C = linspecer(5); 
% figure; hold on;
% % plot(t,y) 
% plot (t, y(:,1),'LineWidth',5,'Color',C(1,:)); plot (t, y(:,2),'LineWidth',5,'Color',C(2,:)); 
% plot (t, y(:,3),'LineWidth',5,'Color',C(3,:)); plot (t, y(:,4),'LineWidth',5,'Color',C(4,:)); 
% plot (t, y(:,5),'LineWidth',5,'Color',C(5,:)); 
% % plot(t,c,'--')
% plot(linspace(0,end_time,10),params.theta*ones(10,1),'--','lineWidth',2,'Color',[.7 .7 .7]);
% ylim([0 .15])
% 
% xlabel('time','fontsize',25,'interpreter','latex');
% ylabel('wagglers','fontsize',25,'interpreter','latex');
% % legend('v_1','v_2','v_3','v_4','v_5')
% set(gca,'fontsize',30);
end

function [dxdt] = derivative(x, params)

dxdt = zeros(10,1);

dxdt(1) = params.beta*(heaviside(x(1)-params.theta)*x(6) + heaviside(x(2)-...
    params.theta)*x(7) + heaviside(x(3)-params.theta)*x(8) + heaviside(x(4)-...
    params.theta)*x(9) +  heaviside(x(5)-params.theta)*x(10)) + params.Dv*(x(2)-x(1)) ;
dxdt(2) = params.Dv*(x(1)-2*x(2)+x(3));
dxdt(3) = params.Dv*(x(2)-2*x(3)+x(4));
dxdt(4) = params.Dv*(x(3)-2*x(4)+x(5));
dxdt(5) = params.Dv*(x(4)-x(5));
dxdt(6) = -params.beta*heaviside(x(1)-params.theta)*x(6) + params.Dw*(x(7)-x(6));
dxdt(7) = -params.beta*heaviside(x(2)-params.theta)*x(7) + params.Dw*(x(6)-2*x(7)+x(8));
dxdt(8) = -params.beta*heaviside(x(3)-params.theta)*x(8) + params.Dw*(x(7)-2*x(8)+x(9));
dxdt(9) = -params.beta*heaviside(x(4)-params.theta)*x(9) + params.Dw*(x(8)-2*x(9)+x(10));
dxdt(10) = -params.beta*heaviside(x(5)-params.theta)*x(10) + params.Dw*(x(9)-x(10));

end


