function[list_beta,list_v1,D]=criticalD
% calculates the diffusion rate at which recruitment ceases

% syms x real positive

list_beta = linspace(.1,10,500);
list_v1 = linspace(0.15,.5,100);

opt = optimset('Display','off','tolfun',1e-12);
init = 100;

for i = 1:length(list_beta)
    for j = 1:length(list_v1)
        
        params.beta = list_beta(i);
        initial.v1 = list_v1(j);
        initial.w1 = (1-initial.v1)/2;
        params.theta = 0.15;
        
        fun = @(x) (initial.v1 + initial.w1)/2 + (1/(2*params.beta))*(params.beta*...
            (initial.v1 + initial.w1) - 2*x*initial.v1)*((2*x^2*initial.v1 - ...
            params.beta*x*(initial.v1 + initial.w1))/(params.beta*initial.w1*...
            (x - params.beta)))^(2*x/(params.beta - 2*x)) - params.theta;
        
            [d,r] = lsqnonlin(fun,init,0,100,opt);
            D(i,j) = d; if r<1e-6, init = d; end
        
%         d = vpasolve(fun(sym('x')),[0,100]);
%         init = d;
%         if isempty(d)
%             D(i,j)= NaN;
%         else
%             D(i,j)=d;
%         end
    end
    i
end

figure;
colormap(hot);
hold on;
pcolor(list_v1,list_beta,D); shading flat; colorbar
% [B1,hfigc] = contour(list_v1,list_beta,D);
% set(hfigc,'LineWidth',1.0,'Color', [0 0 0]);
set(gca,'fontsize',25);
xlabel('$v_1(0)$','fontsize',25,'interpreter','latex');
ylabel('$\beta$','fontsize',25,'interpreter','latex');

end
