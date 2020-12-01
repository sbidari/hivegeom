function [t,y,c] = simu9(params,init,end_time)

initial.v1 = init;
initial.v2 = 0;
initial.v3 = 0;
initial.v4 = 0;
initial.v5 = 0;
initial.v6 = 0;
initial.v7 = 0;
initial.v8 = 0;
initial.v9 = 0;
initial.w1 = (1-initial.v1-initial.v2-initial.v3-initial.v4-initial.v5-initial.v6-initial.v7-initial.v8-initial.v9)/9;
initial.w2 = (1-initial.v1-initial.v2-initial.v3-initial.v4-initial.v5-initial.v6-initial.v7-initial.v8-initial.v9)/9;
initial.w3 = (1-initial.v1-initial.v2-initial.v3-initial.v4-initial.v5-initial.v6-initial.v7-initial.v8-initial.v9)/9;
initial.w4 = (1-initial.v1-initial.v2-initial.v3-initial.v4-initial.v5-initial.v6-initial.v7-initial.v8-initial.v9)/9;
initial.w5 = (1-initial.v1-initial.v2-initial.v3-initial.v4-initial.v5-initial.v6-initial.v7-initial.v8-initial.v9)/9;
initial.w6 = (1-initial.v1-initial.v2-initial.v3-initial.v4-initial.v5-initial.v6-initial.v7-initial.v8-initial.v9)/9;
initial.w7 = (1-initial.v1-initial.v2-initial.v3-initial.v4-initial.v5-initial.v6-initial.v7-initial.v8-initial.v9)/9;
initial.w8 = (1-initial.v1-initial.v2-initial.v3-initial.v4-initial.v5-initial.v6-initial.v7-initial.v8-initial.v9)/9;
initial.w9 = (1-initial.v1-initial.v2-initial.v3-initial.v4-initial.v5-initial.v6-initial.v7-initial.v8-initial.v9)/9;

opts = odeset('RelTol',1e-12,'AbsTol',1e-12);

[t, y] = ode45(@(t, x) derivative(x, params), ...
    [0 end_time],cell2mat(struct2cell(initial)),opts);

 c = y(:,1)+y(:,2)+y(:,3)+y(:,4)+y(:,5)+y(:,6)+y(:,7)+y(:,8)+y(:,9);

end

function [dxdt] = derivative(x, params)

dxdt = zeros(18,1);

dxdt(1) = params.beta*(heaviside(x(1)-params.theta)*x(10) + heaviside(x(2)-params.theta)*x(11) +...
    heaviside(x(3)-params.theta)*x(12) + heaviside(x(4)-params.theta)*x(13) + ...
    heaviside(x(5)-params.theta)*x(14) + heaviside(x(6)-params.theta)*x(15) + ...
    heaviside(x(7)-params.theta)*x(16) + heaviside(x(8)-params.theta)*x(17) + ...
    heaviside(x(9)-params.theta)*x(18) )+ params.Dv*(x(2)-x(1)) ;
dxdt(2) = params.Dv*(x(1)-2*x(2)+x(3));
dxdt(3) = params.Dv*(x(2)-2*x(3)+x(4));
dxdt(4) = params.Dv*(x(3)-2*x(4)+x(5));
dxdt(5) = params.Dv*(x(4)-2*x(5)+x(6));
dxdt(6) = params.Dv*(x(5)-2*x(6)+x(7));
dxdt(7) = params.Dv*(x(6)-2*x(7)+x(8));
dxdt(8) = params.Dv*(x(7)-2*x(8)+x(9));
dxdt(9) = params.Dv*(x(8)-x(9));
dxdt(10) = -params.beta*heaviside(x(1)-params.theta)*x(10) + params.Dw*(x(11)-x(10));
dxdt(11) = -params.beta*heaviside(x(2)-params.theta)*x(11) + params.Dw*(x(10)-2*x(11)+x(12));
dxdt(12) = -params.beta*heaviside(x(3)-params.theta)*x(12) + params.Dw*(x(11)-2*x(12)+x(13));
dxdt(13) = -params.beta*heaviside(x(4)-params.theta)*x(13) + params.Dw*(x(12)-2*x(13)+x(14));
dxdt(14) = -params.beta*heaviside(x(5)-params.theta)*x(14) + params.Dw*(x(13)-2*x(14)+x(15));
dxdt(15) = -params.beta*heaviside(x(6)-params.theta)*x(15) + params.Dw*(x(14)-2*x(15)+x(16));
dxdt(16) = -params.beta*heaviside(x(7)-params.theta)*x(16) + params.Dw*(x(15)-2*x(16)+x(17));
dxdt(17) = -params.beta*heaviside(x(8)-params.theta)*x(17) + params.Dw*(x(16)-2*x(17)+x(18));
dxdt(18) = -params.beta*heaviside(x(9)-params.theta)*x(18) + params.Dw*(x(17)-x(18));

end


