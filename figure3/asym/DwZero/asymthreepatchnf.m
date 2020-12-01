function [t,y] = asymthreepatchnf(params,initial)

% params.beta = 3;
% params.Dv = 1.5;
% params.Dw = 0;
% params.theta = 0.15;
% 
% initial.v1 = .2;         
% initial.v2 = 0;
% initial.v3 = 0;
% initial.w1 = (1-initial.v1-initial.v2-initial.v3)/3;
% initial.w2 = (1-initial.v1-initial.v2-initial.v3)/3;
% initial.w3 = (1-initial.v1-initial.v2-initial.v3)/3;

end_time = 50;  % end of simulation time span starting at 0
opts = odeset('RelTol',1e-12,'AbsTol',1e-12);

[t, y] = ode45(@(t, x) derivative(x, params), ...
    [0 end_time],cell2mat(struct2cell(initial)),opts);

% figure;
% plot (t, y,'LineWidth',3);
% set(gca,'fontsize',20);
% xlabel('time','fontsize',25,'interpreter','latex');
% ylabel('Individuals committed','fontsize',25,'interpreter','latex');
% legend('waggler1','waggler2','waggler3','patch1','patch2','patch3');

end

function [dxdt] = derivative(x, params)
dxdt = zeros(6,1);
% dxdt(1) = params.beta*x(4) + params.D*(x(2)-x(1));
% dxdt(2) = params.D*(x(1)-2*x(2)+x(3));
% dxdt(3) = params.D*(x(2)-x(3));
% dxdt(4) = -params.beta*x(4);
% dxdt(5) = 0;
% dxdt(6) = 0;

dxdt(1) = params.beta*(heaviside(x(1)-params.theta)*x(4) + heaviside(x(2)-...
    params.theta)*x(5) + heaviside(x(3)-params.theta)*x(6) ) + params.Dv*(x(2)-x(1)) ;
dxdt(2) = params.Dv*(x(1)-2*x(2)+x(3));
dxdt(3) = params.Dv*(x(2)-x(3));
dxdt(4) = -(params.beta)*heaviside(x(1)-params.theta)*x(4) + params.Dw*(x(5)-x(4));
dxdt(5) = -(params.beta)*heaviside(x(2)-params.theta)*x(5) + params.Dw*(x(4)-2*x(5)+x(6));
dxdt(6) = -(params.beta)*heaviside(x(3)-params.theta)*x(6) + params.Dw*(x(5)-x(6));
end


