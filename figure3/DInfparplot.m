function[list_B,list_v1,Dv]=DInfparplot
% calculates the diffusion rate at which recruitment ceases

% syms x real positive

list_B = linspace(0.001,10,500);
list_v1 = [.12 .15 ];

opt = optimset('Display','off','tolfun',1e-12);
init = 100;
params.theta = 0.1;

for i = 1:length(list_B)
    for j = 1:length(list_v1)
        params.beta = list_B(i);
        initial.v1 = list_v1(j);
        
        % uncomment for Dw zero
%         fun = @(x) (1/9)*(2*initial.v1 + 1) + ((1-initial.v1)*(params.beta - x)/(9*x))*...
%             ((2*x*(2*initial.v1*params.beta - 9*initial.v1*x + params.beta))/...
%             (params.beta*(initial.v1-1)*(x-params.beta)))^(params.beta/(params.beta - 3*x))...
%             - params.theta;
        
        % uncomment for Dw infinity
        fun = @(x) 1/3 + (2*(params.beta - 9*initial.v1*x)/(3*params.beta))*...
            (6*x*(params.beta - 9*initial.v1*x)/(params.beta*(initial.v1-1)*...
            (3*x - params.beta)))^(9*x/(params.beta - 9*x)) - params.theta;
        
        
            [d,r] = lsqnonlin(fun,init,0,500,opt);
            Dv(i,j) = d; if r<1e-6, init = d; end
        
    end
    i
end

% save('Dv_Dwinftheta01.mat','Dv','list_B','list_v1')

Rd = [255,255,178;253,141,60;189,0,38];
Rd = Rd/255;
Gr = [199,233,192;65,171,93;0,68,27];
Gr = Gr/255;
Bl = [198,219,239;107,174,214;8,69,148];
Bl = Bl/255;
C = [Rd(3,:);Gr(3,:);Bl(3,:)];

figure; hold on;
co = get(gca,'ColorOrder'); 
set(gca, 'ColorOrder', C, 'NextPlot', 'replacechildren');
co = get(gca,'ColorOrder') ;
plot(list_B,Dv,'Linewidth',2); 
set(gca,'fontsize',25);
xlabel('$\beta$','fontsize',25,'interpreter','latex');
ylabel('$D_v$','fontsize',25,'interpreter','latex');
legend('$v_1(0) = .1$','$v_1(0) = .12$','$v_1(0) = .15$','interpreter','latex','Box','off')
end
