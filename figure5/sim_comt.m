function [comt] = sim_comt(params,v10)

initial.v1 = v10;
initial.v2 = 0;
initial.w1 = (1-initial.v1-initial.v2)/2;
initial.w2 = (1-initial.v1-initial.v2)/2;

end_time =50;  % end of simulation time span starting at 0
opts = odeset('RelTol',1e-12,'AbsTol',1e-12);

[t, y] = ode45(@(t, x) derivative(x, params), ...
    [0 end_time],cell2mat(struct2cell(initial)),opts);

comt = y(end,1)+y(end,2);

% figure;
% plot(t,y)
end

function [dxdt] = derivative(x, params)

dxdt = zeros(4,1);

dxdt(1) = (params.beta)*(heaviside(x(1)-params.theta)*x(3)+heaviside(x(2)-...
    params.theta)*x(4)) + params.Dv*(x(2)-x(1)) ;
dxdt(2) =  params.Dv*(x(1)-x(2));
dxdt(3) = -(params.beta)*heaviside(x(1)-params.theta)*x(3) + params.Dw*(x(4)-x(3));
dxdt(4) = -(params.beta)*heaviside(x(2)-params.theta)*x(4) + params.Dw*(x(3)-x(4));

end


