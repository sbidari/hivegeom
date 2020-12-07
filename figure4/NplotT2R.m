%Figure 4.b 

close all;
clear all;


% define colors here

Rd = [255,245,240;254,229,217;254,224,210;252,187,161;252,174,145;252,146,114;251,106,74;239,59,44;222,45,38;203,24,29;165,15,21;153,0,13;103,0,13];
Rd = Rd/255;

Bl = [247,251,255;239,243,255;222,235,247;198,219,239;189,215,231;158,202,225;107,174,214;66,146,198;49,130,189;33,113,181;8,81,156;8,69,148;8,48,107];
Bl = Bl/255;

Gr = [247,252,245;237,248,233;229,245,224;199,233,192;186,228,179;161,217,155;116,196,118;65,171,93;49,163,84;35,139,69;0,109,44;0,90,50;0,68,27];
Gr = Gr/255;

% initial.v1 = 0.1;
% params.theta = 0.05;

figure; 
load('T2RnfDwinf.mat','listN','time','minT','list_Dv')
semilogy(listN,minT,'LineWidth',5.0,'Color',Bl(9,:));
hold on;
load('T2RnfDw1.mat','listN','time','minT','list_Dv')
semilogy(listN,minT,'LineWidth',5.0,'Color',Bl(6,:));
load('T2RnfDw0.mat','listN','time','minT','list_Dv')
semilogy(listN,minT,'LineWidth',5.0,'Color',Bl(3,:));

load('B01T2RnfDwinf.mat','listN','time','minT','list_Dv')
semilogy(listN,minT,'LineWidth',5.0,'Color',Rd(9,:));
load('B01T2RnfDw1.mat','listN','time','minT','list_Dv')
semilogy(listN,minT,'LineWidth',5.0,'Color',Rd(6,:));
load('B01T2RnfDw0.mat','listN','time','minT','list_Dv')
semilogy(listN,minT,'LineWidth',5.0,'Color',Rd(3,:));

load('B5T2RnfDwinf.mat','listN','time','minT','list_Dv')
semilogy(listN,minT,'LineWidth',5.0,'Color',Gr(9,:));
load('B5T2RnfDw1.mat','listN','time','minT','list_Dv')
semilogy(listN,minT,'LineWidth',5.0,'Color',Gr(6,:));
load('B5T2RnfDw0.mat','listN','time','minT','list_Dv')
semilogy(listN,minT,'LineWidth',5.0,'Color',Gr(3,:));


set(gca,'fontsize',30);
xlabel('$N$','fontsize',25,'interpreter','latex');
ylabel('$T_{90}$','fontsize',25,'interpreter','latex');

N= 1:10;
plot(N,-(1/.1)*log(0.1/(.9))*ones(length(N),1),'--','Color',Rd(6,:),'Linewidth',2)
plot(N,-(N/.1).*log(0.1/(.9)),'--','Color',Rd(6,:),'Linewidth',2)
plot(N,-(1/1)*log(0.1/(.9))*ones(length(N),1),'--','Color',Bl(6,:),'Linewidth',2)
plot(N,-(N/1)*log(0.1/(.9)),'--','Color',Bl(6,:),'Linewidth',2)
plot(N,-(N/5)*log(0.1/(.9)),'--','Color',Gr(6,:),'Linewidth',2)
plot(N,-(1/5)*log(0.1/(.9))*ones(length(N),1),'--','Color',Gr(6,:),'Linewidth',2)

