
% Generates figure 2d,e

close all;
clear all;


%% define colors here

C1 = [252,251,253;242,240,247;239,237,245;218,218,235;203,201,226;188,189,220;158,154,200;128,125,186;117,107,177;106,81,163;84,39,143;74,20,134;63,0,125];
C1 = C1/255;

Rd = [255,255,204;255,255,178;255,237,160;254,217,118;254,204,92;254,178,76;253,141,60;252,78,42;240,59,32;227,26,28;189,0,38;177,0,38;128,0,38];
Rd = Rd/255;

Bl = [247,251,255;239,243,255;222,235,247;198,219,239;189,215,231;158,202,225;107,174,214;66,146,198;49,130,189;33,113,181;8,81,156;8,69,148;8,48,107];
Bl = Bl/255;

Gr = [247,252,245;237,248,233;229,245,224;199,233,192;186,228,179;161,217,155;116,196,118;65,171,93;49,163,84;35,139,69;0,109,44;0,90,50;0,68,27];
Gr = Gr/255;

%% Dw = 0

load('DwZero/data/2ptheta005.mat','D','list_beta','list_v1')
figure; hold on;
lev = [10 101];
[B1,hfigc] = contour(list_v1,list_beta,D,lev);
set(hfigc,'LineWidth',5.0,'Color',C1(4,:));

load('DwZero/data/2ptheta01.mat','D','list_beta','list_v1')
[B1,hfigc] = contour(list_v1,list_beta,D,lev);
set(hfigc,'LineWidth',5.0,'Color',C1(4,:));

load('DwZero/data/2ptheta015.mat','D','list_beta','list_v1')
[B1,hfigc] = contour(list_v1,list_beta,D,lev);
set(hfigc,'LineWidth',5.0,'Color',C1(4,:));

%% Intermediate Dw values here -- Dw = 1

load('DwOne/Dw1_2ptheta005.mat','D','list_beta','list_v1')
[B1,hfigc] = contour(list_v1,list_beta,D,lev);
set(hfigc,'LineWidth',5.0,'Color',C1(7,:));
% clabel(B1,hfigc,'FontSize',20);

load('DwOne/Dw1_2ptheta01.mat','D','list_beta','list_v1')
[B1,hfigc] = contour(list_v1,list_beta,D,lev);
set(hfigc,'LineWidth',5.0,'Color',C1(7,:));
% clabel(B1,hfigc,'FontSize',20);

load('DwOne/Dw1_2ptheta015.mat','D','list_beta','list_v1')
[B1,hfigc] = contour(list_v1,list_beta,D,lev);
set(hfigc,'LineWidth',5.0,'Color',C1(7,:));
% clabel(B1,hfigc,'FontSize',20);

%% Dw Infinity

load('DwInfinite/data/DInf2ptheta005.mat','D','list_beta','list_v1')
% lev = [ 50 101];
[B1,hfigc] = contour(list_v1,list_beta,D,lev);
set(hfigc,'LineWidth',5.0,'Color',C1(10,:));

load('DwInfinite/data/DInf2ptheta01.mat','D','list_beta','list_v1')
[B1,hfigc] = contour(list_v1,list_beta,D,lev);
set(hfigc,'LineWidth',5.0,'Color',C1(10,:));

load('DwInfinite/data/DInf2ptheta015.mat','D','list_beta','list_v1')
[B1,hfigc] = contour(list_v1,list_beta,D,lev);
set(hfigc,'LineWidth',5.0,'Color',C1(10,:));
set(gca,'fontsize',30); ylim([0 5]);
xlabel('$v_1(0)$','fontsize',25,'interpreter','latex');
ylabel('$\beta$','fontsize',25,'interpreter','latex');
ax1 = gca;  % Store handle to axes 1.
% Create smaller axes in top right, and plot on it
% Store handle to axes 2 in ax2.
ax2 = axes('Position',[.7 .7 .2 .2]);
box on;
load('DwZero/data/2ptheta01.mat','D','list_beta','list_v1')
colormap(hot);
pcolor(list_v1,list_beta,D); shading flat;
h=colorbar;
set(get(h,'title'),'string','$D_v$','interpreter','latex');

%% T2R90 figure

load('DwZero/data/T2R90_2ptheta005.mat','time','list_beta','list_v1')
figure; hold on;
lev = [0 1];
[B1,hfigc] = contour(list_v1,list_beta,log10(time),lev);
set(hfigc,'LineWidth',5.0,'Color',Rd(4,:));

load('DwZero/data/T2R90_2ptheta01.mat','time','list_beta','list_v1')
[B1,hfigc] = contour(list_v1,list_beta,log10(time),lev);
set(hfigc,'LineWidth',5.0,'Color',Bl(4,:));

load('DwZero/data/T2R90_2ptheta015.mat','time','list_beta','list_v1')
[B1,hfigc] = contour(list_v1,list_beta,log10(time),lev);
set(hfigc,'LineWidth',5.0,'Color',Gr(4,:));

%% Intermediate Dw values here -- Dw = 1

load('DwOne/T2R90Dw1_2ptheta005.mat','time','list_beta','list_v1')
[B1,hfigc] = contour(list_v1,list_beta,log10(time),lev);
set(hfigc,'LineWidth',5.0,'Color', Rd(7,:));
% clabel(B1,hfigc,'FontSize',20);

load('DwOne/T2R90Dw1_2ptheta01.mat','time','list_beta','list_v1')
[B1,hfigc] = contour(list_v1,list_beta,log10(time),lev);
set(hfigc,'LineWidth',5.0,'Color',Bl(7,:));
% clabel(B1,hfigc,'FontSize',20);

load('DwOne/T2R90Dw1_2ptheta015.mat','time','list_beta','list_v1')
[B1,hfigc] = contour(list_v1,list_beta,log10(time),lev);
set(hfigc,'LineWidth',5.0,'Color',Gr(7,:));
% clabel(B1,hfigc,'FontSize',20);

%%  Dw = infinity

load('DwInfinite/data/T2R90DwInf_2ptheta005.mat','time','list_beta','list_v1')
[B1,hfigc] = contour(list_v1,list_beta,log10(time),lev);
set(hfigc,'LineWidth',5.0,'Color', Rd(10,:));

load('DwInfinite/data/T2R90DwInf_2ptheta01.mat','time','list_beta','list_v1')
[B1,hfigc] = contour(list_v1,list_beta,log10(time),lev);
set(hfigc,'LineWidth',5.0,'Color', Bl(10,:));

load('DwInfinite/data/T2R90DwInf_2ptheta015.mat','time','list_beta','list_v1')
[B1,hfigc] = contour(list_v1,list_beta,log10(time),lev);
set(hfigc,'LineWidth',5.0,'Color', Gr(10,:));
set(gca,'fontsize',30); ylim([0 5]);
xlabel('$v_1(0)$','fontsize',25,'interpreter','latex');
ylabel('$\beta$','fontsize',25,'interpreter','latex');
ax1 = gca;  % Store handle to axes 1.
% Create smaller axes in top right, and plot on it
% Store handle to axes 2 in ax2.
ax2 = axes('Position',[.7 .7 .2 .2])
box on;
load('DwZero/data/T2R90_2ptheta01.mat','time','list_beta','list_v1')
colormap(hot);
pcolor(list_v1,list_beta,log10(time)); shading flat;
h=colorbar;
set(get(h,'title'),'string','$\log_{10}(T_{90})$','interpreter','latex');
