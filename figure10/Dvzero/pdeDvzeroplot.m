function [lambda_n,a_n] = pdeDvzeroplot

% compute and plot fourier series solution of Eq. 34
% Figure 10.a

% define constants here
beta = 1;
Dw = 1;
nu = 1;
mu = 1;

L = 10;
zeta = .15;
N = 0:500;

X = linspace(0,L,length(N));
T = linspace(0,100,201);

%% define eigenvalues here
fl = @(x) tan(L*sqrt(x)) - beta./(Dw*sqrt(x));
 lambda  = @(n) fsolve(fl,(n*pi/(L)).^2+0.0001);
lambda_n = lambda(N);

A=lambda_n;
A=(round(A*1000))/1000;
lambda_n =unique(A);

%% define coefficient here  

w_init = @(x) (1-zeta)/L;
a_n = 2*(1-zeta)*beta.^2./((L.*sqrt(lambda_n)).*(L.*beta^2 + Dw*beta+ L.*Dw.^2.*lambda_n));
 
%% define functions here

w = @(x,t) sum(a_n.*exp(-t.*Dw.*lambda_n).*((Dw.*sqrt(lambda_n)./beta).*...
    cos(x.*sqrt(lambda_n)) + sin(x.*sqrt(lambda_n)) ));

v = @(t) zeta*nu/(mu + nu) + (nu/(mu + nu))*sum(a_n./sqrt(lambda_n)) + ...
    sum((nu.*a_n.*exp(-t*Dw.*lambda_n))./(sqrt(lambda_n).*(Dw.*lambda_n - mu - nu))) +...
    (exp(-t*(nu+mu))/(mu+nu))*(zeta*mu - nu*Dw*sum(a_n.*sqrt(lambda_n)./(Dw*lambda_n - mu - nu)));

u = @(t) zeta*mu/(mu + nu) + (mu/(mu + nu))*sum(a_n./sqrt(lambda_n)) + ...
    sum((a_n.*(mu - Dw.*lambda_n).*exp(-t*Dw.*lambda_n))./(sqrt(lambda_n).*(Dw.*lambda_n - mu - nu))) -...
    (exp(-t*(nu+mu))/(mu+nu))*(zeta*mu - nu*Dw*sum(a_n.*sqrt(lambda_n)./(Dw*lambda_n - mu - nu)));

%% create a matrix for plotting

for   i = 1:length(X)
    xx = X(i);
    for j = 1:length(T)
        tt = T(j);
        W(j,i)  = w(xx,tt);   
    end
    i
end
W=W'

%% Plots
 hold on;
Rd = [255,237,160;254,217,118;254,204,92;254,178,76;253,141,60;252,78,42;240,59,32;227,26,28;189,0,38;177,0,38;128,0,38];
Rd = Rd/255;
plot(X, W(:,1),'--','LineWidth',2,'Color',Rd(6,:));
plot(X, W(:,21),'--','LineWidth',2,'Color',Rd(6,:))
plot(X, W(:,201),'--','LineWidth',2,'Color',Rd(6,:))

figure;
plot(X, W)
% ylim([0 1]);
ylabel('uncommitted bees','interpreter','latex');
xlabel('position in hive','interpreter','latex');
set(gca,'fontsize',20);

figure;
fplot(v, [0 100]);
hold on;
fplot(u, [0 100]);
plot(T,trapz(X,W))
legend('wagglers','foragers')
ylabel('Bees','interpreter','latex');
xlabel('time','interpreter','latex');
set(gca,'fontsize',30);

end 

