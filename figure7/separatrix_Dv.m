function [V,T]=separatrix_Dv

v1 = @(D,beta,lambda,mu,v10,t) ((D*(v10*beta*lambda - 2*v10*beta*mu +8*v10*D^2 -...
    4*v10*D*(beta+lambda-2*mu) - 2*v10*lambda*mu + 2*v10*mu^2+ beta*lambda))/...
    (2*(2*D-lambda)*(2*D+mu)*(-beta+2*D+mu)))*exp(-t*(2*D+mu)) + ...
    (((D-lambda)*(v10*beta*lambda +2*v10*beta*mu - 2*v10*lambda*mu - ...
    2*v10*mu^2 - beta*lambda ))/(2*(2*D-lambda)*(lambda+mu)*(beta-lambda-mu)))*exp(-t*(lambda+mu)) - ...
    ((lambda*(v10-1)*(beta-D-mu))/(2*(beta-lambda-mu)*(beta-2*D-mu)))*exp(-t*beta)+...
    (lambda*(v10+1)*(D+mu))/(2*(2*D + mu)*(lambda+mu));

params.beta = 1;
params.theta = 0.1;
params.Dv = 0.66;
initial.v1 = 0.15;

list_lambda = linspace(0,.4,50);
list_mu = linspace(0,.5,51);

for i = 1:length(list_lambda)
    params.lambda = list_lambda(i);
    
    for j = 1:length(list_mu)
        params.mu =list_mu(j);
        syms t
        fun = v1(params.Dv,params.beta,params.lambda,params.mu,initial.v1,t) - params.theta ;
        
        tt= vpasolve(fun,t);
        tt = double(tt);
        a=params.lambda*(params.Dv+params.mu)*(1+initial.v1 -(1-initial.v1)*...
            exp(-params.beta*tt) )/(2*(2*params.Dv+params.mu)*(params.lambda+params.mu));
        
        if isempty(tt) || tt<0 || ~isreal(tt) ||  a>= params.theta
            V(i,j)= 0;  % recruitment continues
            T(i,j) = nan;
        else
            V(i,j)= 1;  % recruitment stops
            T(i,j) = tt;
        end
    end
    i
end

% save('TV_Dv.mat','list_mu','list_lambda','V','T');

figure;
colormap(hot);
pcolor(list_mu,list_lambda,V); colorbar; shading flat;
set(gca,'fontsize',25);
xlabel('$\mu$','fontsize',25,'interpreter','latex');
ylabel('$\nu$','fontsize',25,'interpreter','latex');


end
