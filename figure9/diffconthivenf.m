function [t,tot_rec,tot_w,tot_v] = diffconthivenf(beta,theta,Dw,Dv,L,a)

% define constants here
beta = 3.9710;
Dv = 4;
theta = 0.1;
L = 10;
Dw = 5;

a = 1.5;
dt = 0.001;
time_steps = 100/dt;

h =  0.2;
N = 1+L/h;
% N = 10;
% h = L/(N-1)
x = (0:h:L).';

% Construct matrices for the diffusion
M = 1/h^2*(diag([ -2; -2*ones(N-2,1); -2], 0) + diag([2;ones(N-2,1)], 1) + diag([ones(N-2,1);2], -1));
v(:,1) = initial_v(x,L,a);
w(:,1)= initial_w(x,L,v);

for i = 1:time_steps+1
    t(i+1) = dt*(i+1);
    V = zeros(length(x),1);
    V(1) = 2*(beta*trapz(x,heaviside(v(:,i)-theta).*w(:,i)))/(h);
    
    v(:,i+1) = v(:,i) + ( Dv*(M*v(:,i)) + V )*dt;
    w(:,i+1) = w(:,i) + ( Dw*(M*w(:,i))  - beta*heaviside(v(:,i)-theta).*w(:,i))*dt;
end
    tot_w = trapz(x,w);
    tot_v = trapz(x,v);
    tot_rec = trapz(t,tot_v);
    
figure;
hold on;
plot(t, tot_v,'LineWidth',5)
plot(t, tot_w,'LineWidth',5)
ylabel('fraction of bees');
xlabel('time');
set(gca,'fontsize',20);
legend('recruiters (v)','uncommitted (w)')

figure;
plot(x, v(:,1:500:end))
% plot(x, v)
ylabel('Waggling bees');
xlabel('position in hive');
% ylim([0,0.5])
set(gca,'fontsize',20);

figure;
plot(x,w(:,1:500:end))
% plot(x, w)
set(gca,'fontsize',20);
ylabel('Uncommitted bees');
xlabel('position in hive');

end

function y = initial_w(x,L,v)
y = zeros(length(x),1);
for i = 1:length(x)
    y(i) = (1-trapz(x,v(:,1)))/L;
end
end

function Y = initial_v(x,L,a)
Y = zeros(length(x),1);
% for i = 1:4
%     Y(i) = 0.2;
% end
  Y(1) = a;
end