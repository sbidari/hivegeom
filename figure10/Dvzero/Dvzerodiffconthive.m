function [tot_forg] = Dvzerodiffconthive(beta,Dw,nu,mu,zeta,L,T)

% numerically solve the pde in Eq. 34
% Figure 10.a

dt = 0.001;
time_steps = T/dt;

h =  0.1;
N = 1+L/h;
x = (0:h:L).';

% Initialize 
u(1) = 0;
v(1) = zeta;
w(:,1)= initial_w(x,L,v,u);

% Construct matrices for the diffusion
M2 = 1/h^2*(diag([ -1; -2*ones(N-2,1); -1], 0) + diag([1;ones(N-2,1)], 1) + diag([ones(N-2,1);1], -1));

for i = 1:time_steps+1
    t(i+1) = dt*(i+1);
    V = zeros(length(x),1);
    V(1) = beta*w(1,i)/(h);
    v(i+1) = v(i) + ( nu*u(i) - mu*v(i) )*dt;
    w(:,i+1) = w(:,i) + ( Dw*(M2*w(:,i))  - V )*dt;
    u(i+1) = u(i) + ( beta.*w(1,i) - nu*u(i) + mu*v(i))*dt;   
end

tot_forg = 0.5*trapz(t,v) + trapz(t,u);

end


function y = initial_w(x,L,v,u)
y = zeros(length(x),1);
for i = 1:length(x)
    y(i) = (1-u(1)-v(1))/L;
end
end

