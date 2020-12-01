function [list_Dv,list_lambda,list_mu,TF] = forgcolorplot

params.beta = 1;
params.theta = 0.1;
params.Dw = 0;

initial.u = 0;         % initial foraging bees
initial.v1 = 0.15;          % initial recruitting bees
initial.v2 = 0; 
initial.w1 = (1-initial.v1-initial.v2-initial.u)/2;
initial.w2 = (1-initial.v1-initial.v2-initial.u)/2;

list_Dv = linspace(0,5,201);
list_lambda = linspace(0,5,201);
list_mu = linspace(0,5,201);

for i = 1:length(list_Dv)
    params.Dv = list_Dv(i);
    
    for k = 1:length(list_lambda)
        params.lambda =list_lambda(k);
        
        for j = 1:length(list_mu)
            params.mu =list_mu(j);
              TF(k,j,i) = twopatch(params,initial);
        end
    end
    i
end 

save('FV2patch.mat','TF','list_Dv','list_lambda','list_mu')
  
end 
