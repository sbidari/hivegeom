function [tot_forg] = twopatch(params,initial)

end_time = 50;  % end of simulation time span starting at 0
opts = odeset('RelTol',1e-12,'AbsTol',1e-12);

[t, y] = ode45(@(t, x) derivative(x, params), ...
    [0 end_time],cell2mat(struct2cell(initial)),opts);

tot_forg = trapz(t,y(:,1))+0.5*trapz(t,y(:,2))+0.5*trapz(t,y(:,3));

end


function [dxdt] = derivative(x, params)
dxdt = zeros(5,1);

dxdt(1) = (params.beta)*(heaviside(x(2)-params.theta)*x(4)+heaviside(x(3)-params.theta)*x(5)) - params.lambda*x(1) + params.mu*(x(2)+x(3));
dxdt(2) = (params.lambda)*x(1) - params.mu*x(2) + params.Dv*(x(3)-x(2));
dxdt(3) = - params.mu*x(3) + params.Dv*(x(2)-x(3));
dxdt(4) = -(params.beta)*heaviside(x(2)-params.theta)*x(4) + params.Dw*(x(5)-x(4));
dxdt(5) = -(params.beta)*heaviside(x(3)-params.theta)*x(5) + params.Dw*(x(4)-x(5));

end