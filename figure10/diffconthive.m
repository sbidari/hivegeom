function [tot_forg,tot_w,tot_v,u] = diffconthive(beta,theta,Dw,Dv,lambda,mu,L,a)

% define constants here

dt = 0.001;
time_steps = 100/dt;

h =  0.2;
N = 1+L/h;
x = (0:h:L).';

% Initialize 
u(1) = 0;
v(:,1) = initial_v(x,L,a);
w(:,1)= initial_w(x,L,v,u);

% Construct matrices for the diffusion
M = 1/h^2*(diag([ -2; -2*ones(N-2,1); -2], 0) + diag([2;ones(N-2,1)], 1) + diag([ones(N-2,1);2], -1));

for i = 1:time_steps+1
    t(i+1) = dt*(i+1);
    V = zeros(length(x),1);
    V(1) = 2*lambda*u(i)/(h);
    v(:,i+1) = v(:,i) + ( Dv*(M*v(:,i)) + V - mu*v(:,i) )*dt;
    w(:,i+1) = w(:,i) + ( Dw*(M*w(:,i))  - beta*heaviside(v(:,i)-theta).*w(:,i) )*dt;
    u(i+1) = u(i) + ( beta*trapz(x,heaviside(v(:,i)-theta).*w(:,i)) - lambda*u(i) + mu*trapz(x,v(:,i)) )*dt;   
end

tot_w = trapz(x,w);
tot_v = trapz(x,v);
tot_forg = 0.5*trapz(t,tot_v) + trapz(t,u);

end

function Y = initial_v(x,L,a)
Y = zeros(length(x),1);
 Y(1) = a;
end

function y = initial_w(x,L,v,u)
y = zeros(length(x),1);
for i = 1:length(x)
    y(i) = (1-u(1)-trapz(x,v(:,1)))/L;
end
end

