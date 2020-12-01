function[list_beta,list_v1,D]=sym_criticalD_3patch

syms x real positive

list_beta = linspace(.1,10,51);
list_v1 = linspace(0.05,1/2,41);

opt = optimset('Display','off','TolFun',1e-16) %,'Algorithm','levenberg-marquardt');
init = 100;

for i = 1:length(list_beta)
    for j = 1:length(list_v1)
        
        params.beta = list_beta(i);
        initial.v1 = list_v1(j);
        params.theta = .05;

            fun = @(x) (1+2*initial.v1)/9 + (1/(9*params.beta)).*(2*(-9*initial.v1.*...
                x+params.beta+2*initial.v1*params.beta).*((2*x.*(-9*initial.v1.*...
                x+params.beta+2*initial.v1*params.beta))./(params.beta.*(initial.v1-1).*...
                (x-params.beta))).^(3*x./(params.beta-3.*x))) - params.theta;
        
            [d,r] = lsqnonlin(fun,init,0,100,opt);
            D(i,j) = d;    %if r<1e-8, init = d; end
            
%             d = vpasolve(fun(sym('x')),[0,100]);
% %             d = fsolve(fun,init,opt);
%                 if isempty(d)
%                     D(i,j) = NaN;
%                 elseif imag(d) ~= 0
%                       D(i,j) = NaN;
%                 else
%                     D(i,j) = d; %  init = d;
%                 end
        
    end
    i
end

figure;
colormap(hot);
hold on;
pcolor(list_v1,list_beta,D); shading flat; colorbar
% caxis([0 0.7]);
% [B1,hfigc] = contour(list_v1,list_beta,D);
% set(hfigc,'LineWidth',1.0,'Color', [0 0 0]);
set(gca,'fontsize',20);
xlabel('$v_1(0)$','fontsize',25,'interpreter','latex');
ylabel('$\beta$','fontsize',25,'interpreter','latex');

end
