
D = 0.66;
M = 0.2550;
L = 0.2150;

open('mu.fig'); load('TV_mu.mat')
[B1,hfigc]=contour(list_Dv,list_lambda,V);
set(hfigc,'LineWidth',2.0,'Color', [0.7,0.7,0.7]);
list_D = logspace(log10(0.099),log10(.5746),501);
a= (0.4*M*list_D + 0.2*M.^2)./(0.75*list_D - 0.2*M);
plot(list_D,a,'.','Color',[0.7,0.7,0.7])

open('Dv.fig'); load('TV_Dv.mat')
[B1,hfigc]=contour(list_mu,list_lambda,V);
set(hfigc,'LineWidth',2.0,'Color', [0.7,0.7,0.7]);
list_mu = linspace(.33,.795,100)
b=(0.4*list_mu*D + 0.2*list_mu.^2)./(0.75*D - 0.2*list_mu)
plot(list_mu,b,'LineWidth',3.0,'Color',[0.7,0.7,0.7])

open('lambda.fig'); load('TV_lambda.mat')
[B1,hfigc]=contour(list_Dv,list_mu(1:157),V(1:157,:));
set(hfigc,'LineWidth',2.0,'Color', [0.7,0.7,0.7]);
list_D = linspace(0,.63,501);
c = 0.5*(-L-2.*list_D + sqrt((0.3*list_D*L+0.4.*list_D.^2-0.4.*L.*list_D + 2.*list_D*L + 0.1*L^2)/0.1));
plot(list_D,c,'.','Color',[0.7,0.7,0.7])
