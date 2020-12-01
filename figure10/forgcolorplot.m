function [list_Dv,list_lambda,list_mu,TF,vfrac] = forgcolorplot
L = 2;  a = 1.5;  % a related to total fraction of initial recruiting bees
        % a = 0.3/h; 
beta = 1;
theta = 0.1;
Dw = 0;

list_Dv = linspace(0,5,61);
list_lambda = linspace(0,5,61);
list_mu = linspace(0,5,60);

TF = zeros(length(list_lambda),length(list_mu),length(list_Dv));
vfrac = zeros(length(list_lambda),length(list_mu),length(list_Dv));

parfor i = 1:61
    Dv = list_Dv(i);
    
    for k = 1:61
        lambda =list_lambda(k);
        
        for j = 1:60
            mu =list_mu(j);
            [tot_forg,tot_w,tot_v,u]= diffconthive(beta,theta,Dw,Dv,lambda,mu,L,a);
            TF(k,j,i) = tot_forg;
            vfrac(k,j,i) = tot_v(end)+u(end);
        end
    end
    i
end
save('FYL2.mat','list_Dv','list_lambda','list_mu','TF','vfrac')

end
