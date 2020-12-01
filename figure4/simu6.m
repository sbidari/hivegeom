function [t,y,c] = simu6(params,init,end_time)

initial.v1 = init;
initial.v2 = 0;
initial.v3 = 0;
initial.v4 = 0;
initial.v5 = 0;
initial.v6 = 0;
initial.w1 = (1-initial.v1-initial.v2-initial.v3-initial.v4-initial.v5-initial.v6)/6;
initial.w2 = (1-initial.v1-initial.v2-initial.v3-initial.v4-initial.v5-initial.v6)/6;
initial.w3 = (1-initial.v1-initial.v2-initial.v3-initial.v4-initial.v5-initial.v6)/6;
initial.w4 = (1-initial.v1-initial.v2-initial.v3-initial.v4-initial.v5-initial.v6)/6;
initial.w5 = (1-initial.v1-initial.v2-initial.v3-initial.v4-initial.v5-initial.v6)/6;
initial.w6 = (1-initial.v1-initial.v2-initial.v3-initial.v4-initial.v5-initial.v6)/6;

opts = odeset('RelTol',1e-12,'AbsTol',1e-12);

[t, y] = ode45(@(t, x) derivative(x, params), ...
    [0 end_time],cell2mat(struct2cell(initial)),opts);

c = y(:,1)+y(:,2)+y(:,3)+y(:,4)+y(:,5)+y(:,6);

% figure;
% plot(t,y)

end

function [dxdt] = derivative(x, params)

dxdt = zeros(12,1);

dxdt(1) = params.beta*(heaviside(x(1)-params.theta)*x(7) + heaviside(x(2)-...
    params.theta)*x(8) + heaviside(x(3)-params.theta)*x(9) + heaviside(x(4)-...
    params.theta)*x(10) +  heaviside(x(5)-params.theta)*x(11) + heaviside(x(6)...
    -params.theta)*x(12))+ params.Dv*(x(2)-x(1)) ;
dxdt(2) = params.Dv*(x(1)-2*x(2)+x(3));
dxdt(3) = params.Dv*(x(2)-2*x(3)+x(4));
dxdt(4) = params.Dv*(x(3)-2*x(4)+x(5));
dxdt(5) = params.Dv*(x(4)-2*x(5)+x(6));
dxdt(6) = params.Dv*(x(5)-x(6));
dxdt(7) = -params.beta*heaviside(x(1)-params.theta)*x(7) + params.Dw*(x(8)-x(7));
dxdt(8) = -params.beta*heaviside(x(2)-params.theta)*x(8) + params.Dw*(x(7)-2*x(8)+x(9));
dxdt(9) = -params.beta*heaviside(x(3)-params.theta)*x(9) + params.Dw*(x(8)-2*x(9)+x(10));
dxdt(10) = -params.beta*heaviside(x(4)-params.theta)*x(10) + params.Dw*(x(9)-2*x(10)+x(11));
dxdt(11) = -params.beta*heaviside(x(5)-params.theta)*x(11) + params.Dw*(x(10)-2*x(11)+x(12));
dxdt(12) = -params.beta*heaviside(x(6)-params.theta)*x(12) + params.Dw*(x(11)-x(12));

end


