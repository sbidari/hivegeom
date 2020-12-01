function[list_Dv,list_v1,B]=DwInfparplot
% calculates the diffusion rate at which recruitment ceases

% syms x real positive

list_Dv = linspace(0.001,10,500);
list_v1 = [.1 .12 .15 ];

opt = optimset('Display','off','tolfun',1e-12);
init = 100;
params.theta = 0.1;

for i = 1:length(list_Dv)
    params.Dv = list_Dv(i);
    for j = 1:length(list_v1)
        
        initial.v1 = list_v1(j);
        
        % uncomment for Dv
%         fun = @(x) 1/2 + (1/(2*params.beta))*(params.beta-4*x*initial.v1)*...
%                 ((-8*x.^2*initial.v1+2*params.beta*x)/...
%                 (params.beta*(2*x-params.beta)*(initial.v1-1)))^(4*x/(params.beta-4*x)) - params.theta;
        
%         uncomment for beta
        fun = @(x) 1/2 + (1/(2*x))*(x-4*params.Dv*initial.v1)*...
                ((-8*params.Dv.^2*initial.v1+2*x*params.Dv)/...
                (x*(2*params.Dv-x)*(initial.v1-1)))^(4*params.Dv/(x-4*params.Dv)) - params.theta;
       
        [d,r] = lsqnonlin(fun,init,0,500,opt);
        B(i,j) = d; if r<1e-6, init = d; end
        
    end
    i
end

save('beta_Dwinftheta01.mat','B','list_Dv','list_v1')


Rd = [255,255,178;253,141,60;189,0,38];
Rd = Rd/255;
Gr = [199,233,192;65,171,93;0,109,44];
Gr = Gr/255;
Bl = [198,219,239;107,174,214;8,69,148];
Bl = Bl/255;
C = [Rd(2,:);Gr(2,:);Bl(2,:)];

% figure; 
yyaxis left;
hold on;
co = get(gca,'ColorOrder');
set(gca, 'ColorOrder', Gr, 'NextPlot', 'replacechildren');
co = get(gca,'ColorOrder') ;
plot(list_Dv,B,'Linewidth',4);
set(gca,'fontsize',25);
xlabel('$\beta$','fontsize',25,'interpreter','latex') %,'Color',[0 0 0]);
ylabel('$D_v$','fontsize',25,'interpreter','latex') %,'Color',[0 0 0]);
legend('$v_1(0) = .1$','$v_1(0) = .12$','$v_1(0) = .15$','interpreter','latex','Box','off')
end
