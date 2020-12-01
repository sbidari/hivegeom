function [V,T]=separatrix_lambda

v1 = @(D,beta,lambda,mu,v10,t) ((D*(v10*beta*lambda - 2*v10*beta*mu +8*v10*D^2 -...
    4*v10*D*(beta+lambda-2*mu) - 2*v10*lambda*mu + 2*v10*mu^2+ beta*lambda))/...
    (2*(2*D-lambda)*(2*D+mu)*(-beta+2*D+mu)))*exp(-t*(2*D+mu)) + ...
    (((D-lambda)*(v10*beta*lambda +2*v10*beta*mu - 2*v10*lambda*mu - ...
    2*v10*mu^2 - beta*lambda ))/(2*(2*D-lambda)*(lambda+mu)*(beta-lambda-mu)))*exp(-t*(lambda+mu)) - ...
    ((lambda*(v10-1)*(beta-D-mu))/(2*(beta-lambda-mu)*(beta-2*D-mu)))*exp(-t*beta)+...
    (lambda*(v10+1)*(D+mu))/(2*(2*D + mu)*(lambda+mu));

params.beta = 1;
params.theta = 0.1;
params.lambda = 0.2150;
initial.v1 = 0.15;

list_Dv = linspace(0,1,200);
list_mu = linspace(0,1,201);

for i = 1:length(list_mu)
    params.mu = list_mu(i);
    
    for j = 1:length(list_Dv)
        params.Dv =list_Dv(j);
        syms t
        fun =  v1(params.Dv,params.beta,params.lambda,params.mu,initial.v1,t) - params.theta ;
        tt= vpasolve(fun,t);
        a=params.lambda*params.Dv*(1+initial.v1)/(2*(2*params.Dv+params.mu)*(params.lambda+params.mu));
        
        if  isempty(tt) || tt<0 || ~isreal(tt) ||  a>= 0.11
            V(i,j)= 0;
            T(i,j) = nan;
        else
            V(i,j)= 1;
            T(i,j) = tt;
        end
    end
    i
end

% save('TV_lambda.mat','list_mu','list_Dv','V','T');

end
