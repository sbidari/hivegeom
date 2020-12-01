function [t,y,c] = simu2(params,init,end_time)

initial.v1 = init;         
initial.v2 = 0;
initial.w1 = (1-initial.v1-initial.v2)/2;
initial.w2 = (1-initial.v1-initial.v2)/2;

opts = odeset('RelTol',1e-12,'AbsTol',1e-12);

[t, y] = ode45(@(t, x) derivative(x, params), ...
    [0 end_time],cell2mat(struct2cell(initial)),opts);

c = y(:,1)+y(:,2);

end

function [dxdt] = derivative(x, params)

dxdt = zeros(4,1);

dxdt(1) = (params.beta)*(heaviside(x(1)-params.theta)*x(3)+heaviside(x(2)-...
    params.theta)*x(4)) + params.Dv*(x(2)-x(1)) ;
dxdt(2) =  params.Dv*(x(1)-x(2));
dxdt(3) = -(params.beta)*heaviside(x(1)-params.theta)*x(3) + params.Dw*(x(4)-x(3));
dxdt(4) = -(params.beta)*heaviside(x(2)-params.theta)*x(4) + params.Dw*(x(3)-x(4));

end


