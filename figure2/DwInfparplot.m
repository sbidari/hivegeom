function[list_beta,list_v1,Dv]=DwInfparplot
% calculates the diffusion rate at which recruitment ceases

% syms x real positive

list_beta = linspace(0.001,10,500);
list_v1 = [.12 .15 ];

opt = optimset('Display','off','tolfun',1e-12);
init = 100;
params.theta = 0.1;

for i = 1:length(list_beta)
    params.beta = list_beta(i);
    for j = 1:length(list_v1)
        initial.v1 = list_v1(j);
        fun = @(x) 1/2 + (1/(2*params.beta))*(params.beta-4*x*initial.v1)*...
                ((-8*x.^2*initial.v1+2*params.beta*x)/...
                (params.beta*(2*x-params.beta)*(initial.v1-1)))^(4*x/(params.beta-4*x)) - params.theta;
       
        [d,r] = lsqnonlin(fun,init,0,500,opt);
        Dv(i,j) = d; if r<1e-6, init = d; end
        
    end
    i
end

save('Dv_Dwinftheta01.mat','Dv','list_beta','list_v1')

figure; 
plot(list_beta,Dv,'Linewidth',4);
set(gca,'fontsize',25);
xlabel('$\beta$','fontsize',25,'interpreter','latex') %,'Color',[0 0 0]);
ylabel('$D_v$','fontsize',25,'interpreter','latex') %,'Color',[0 0 0]);
legend('$v_1(0) = .12$','$v_1(0) = .15$','interpreter','latex','Box','off')
end
