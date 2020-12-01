function [t,tot_w,u,v,w] = diffconthiveDv0

% define constants here

beta = 10;
Dw = 1;
theta = .1;
lambda = 2;
mu = 1;

L = 10;

dt = 0.001;
time_steps = 100/dt;
% N = 21;             % # of points in x-grid
% h = L/(N-1);

h =  0.1;
N = 1+L/h;
x = (0:h:L).';

% Initialize 
u(1) = 0;
v(1) = .15;
w(:,1)= initial_w(x,L,v,u);

% Construct matrices for the diffusion
M2 = 1/h^2*(diag([ -2; -2*ones(N-2,1); -2], 0) + diag([2;ones(N-2,1)], 1) + diag([ones(N-2,1);2], -1));

for i = 1:time_steps+1
    t(i+1) = dt*(i+1);
        V = zeros(length(x),1);
          V(1) = beta.*w(1,i);
    v(i+1) = v(i) + ( lambda*u(i) - mu*v(i) )*dt;
    w(:,i+1) = w(:,i) + ( Dw*(M2*w(:,i))  - V )*dt;
    u(i+1) = u(i) + ( beta*w(1,i)*h - lambda*u(i) + mu*v(i) )*dt;   
end

tot_w = trapz(x,w);
tot = tot_w+v+u;
ln = [20 500 1500 3000 5000 10000 20000 50000 100000]; % 200000 500000 ];
Rd = [255,237,160;254,217,118;254,204,92;254,178,76;253,141,60;252,78,42;240,59,32;227,26,28;189,0,38;177,0,38;128,0,38];
Rd = Rd/255;
Gr = [229,245,224;199,233,192;186,228,179;161,217,155;116,196,118;65,171,93;49,163,84;35,139,69;0,109,44;0,90,50;0,68,27];
Gr = Gr/255;
Bl = [222,235,247;198,219,239;189,215,231;158,202,225;107,174,214;66,146,198;49,130,189;33,113,181;8,81,156;8,69,148;8,48,107];
Bl = Bl/255;

figure;
plot(t, u,'LineWidth',5,'Color',Bl(6,:))
hold on;
plot(t, v,'LineWidth',5,'Color',Gr(6,:))
plot(t, tot_w,'LineWidth',5,'Color',Rd(6,:))
% plot(t, tot,'LineWidth',5)
ylabel('fraction of bees','interpreter','latex');
xlabel('t','interpreter','latex');
set(gca,'fontsize',30); box off;
legend('foragers (u)','recruiters (v)','uncommitted (w)','interpreter','latex');

figure; 
plot(x, w(:,ln),'LineWidth',2)
ylabel('Uncommitted bees','interpreter','latex');
xlabel('x','interpreter','latex');
set(gca,'fontsize',30); xlim([0 L]); box off;

end


function y = initial_w(x,L,v,u)
y = zeros(length(x),1);
for i = 1:length(x)
    y(i) = (1-u(1)-v(1))/L;
end
end


