function [J,J_num,list_mu,list_nu] = pdeDvzeroFY

% calculate the foraging yield in the continuum limit when Dv is zero
% Figure 10.b

% define constants here
beta = 1;
Dw = 1;
L = 10;
zeta = .15;
T = 100;

N=0:100;

list_nu = [0.1 1 10];
list_mu = linspace(0,10,501);

options = optimoptions('fsolve','Display','off');

for i = 1:length(list_nu)
    nu = list_nu(i);
    for j = 1:length(list_mu)
        mu = list_mu(j);
        
        % define eigenvalues and coefficient here
        fl = @(x) tan(L*sqrt(x)) - beta./(Dw*sqrt(x));
        lambda  = @(n) fsolve(fl,(n*pi/L).^2+0.0001,options);
        A = lambda(N);
        A=(round(A*1000))/1000;
        lambda_n =unique(A);
        
        a_n = 2*(1-zeta)*beta.^2./((L.*sqrt(lambda_n)).*(L.*beta^2 + Dw*beta+ L.*Dw.^2.*lambda_n));

        J(i,j) = zeta*T*(2*mu + nu)/(2*(mu + nu)) + (T*(2*mu + nu)/(2*(mu + nu)))*sum(a_n./sqrt(lambda_n)) + ...
            (1/(2*Dw))*sum((nu.*a_n.*(1-exp(-T*Dw.*lambda_n)))./(lambda_n.^(3/2).*(Dw.*lambda_n - mu - nu))) +...
            sum((a_n.*(1-exp(-T*Dw*lambda_n)).*(mu - Dw.*lambda_n))./(Dw.*lambda_n.^(3/2).*(Dw.*lambda_n - mu - nu))) + ...
            ((1-exp(-T*(nu+mu)))/(2*(mu+nu).^2))*(-zeta*mu + nu*Dw*sum(a_n.*sqrt(lambda_n)./(Dw*lambda_n - mu - nu)));
       
        J_num(i,j) = Dvzerodiffconthive(beta,Dw,nu,mu,zeta,L,T);
    end
    i
end
Rd = [255,237,160;254,217,118;254,204,92;254,178,76;253,141,60;252,78,42;240,59,32;227,26,28;189,0,38;177,0,38;128,0,38];
Rd = Rd/255;
Bl = [222,235,247;198,219,239;189,215,231;158,202,225;107,174,214;66,146,198;49,130,189;33,113,181;8,81,156;8,69,148;8,48,107];
Bl = Bl/255;
figure; hold on;
plot(list_mu,J_num,'LineWidth',5,'Color',Bl(6,:));
plot(list_mu,J,'--','LineWidth',2,'Color',Rd(6,:));
xlabel('$\mu$','interpreter','latex');
ylabel('Foraging yield','interpreter','latex');
set(gca,'fontsize',30); box off;

end