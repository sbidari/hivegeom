% 
% close all;
% clear all;


%% define colors here

C1 = [252,251,253;242,240,247;239,237,245;218,218,235;203,201,226;188,189,220;158,154,200;128,125,186;117,107,177;106,81,163;84,39,143;74,20,134;63,0,125];
C1 = C1/255;

C2 = [142,1,82;197,27,125;208,28,139;222,119,174;233,163,201;241,182,218;253,224,239;247,247,247;230,245,208;184,225,134;161,215,106;127,188,65;77,172,38;77,146,33;39,100,25];
C2 = C2/255;

%% Dw = 0
figure; hold on;
lev = [10 101];
load('sym/DwZero/data/symD3ptheta005.mat','D','list_beta','list_v1')
[B1,hfigc] = contour(list_v1,list_beta,D,lev);
set(hfigc,'LineWidth',5.0,'Color',C1(4,:));

load('sym/DwZero/data/symD3ptheta01.mat','D','list_beta','list_v1')
[B1,hfigc] = contour(list_v1,list_beta,D,lev);
set(hfigc,'LineWidth',5.0,'Color',C1(4,:));

load('sym/DwZero/data/symD3ptheta015.mat','D','list_beta','list_v1')
[B1,hfigc] = contour(list_v1,list_beta,D,lev);
set(hfigc,'LineWidth',5.0,'Color',C1(4,:));

%% Intermediate Dw values here -- Dw = 1

load('sym/DwOne/sym3pDw1_theta005.mat','D','list_beta','list_v2')
[B1,hfigc] = contour(list_v2,list_beta,D,lev);
set(hfigc,'LineWidth',5.0,'Color',C1(7,:));
% clabel(B1,hfigc,'FontSize',20);

load('sym/DwOne/sym3pDw1_theta01.mat','D','list_beta','list_v2')
[B1,hfigc] = contour(list_v2,list_beta,D,lev);
set(hfigc,'LineWidth',5.0,'Color',C1(7,:));
% clabel(B1,hfigc,'FontSize',20);

load('sym/DwOne/sym3pDw1_theta015.mat','D','list_beta','list_v2')
[B1,hfigc] = contour(list_v2,list_beta,D,lev);
set(hfigc,'LineWidth',5.0,'Color',C1(7,:));
% clabel(B1,hfigc,'FontSize',20);

%% Dw Infinity

load('sym/DwInfinite/data/DwInfsym3p_theta005.mat','D','list_beta','list_v1')
% lev = [ 50 101];
[B1,hfigc] = contour(list_v1,list_beta,D,lev);
set(hfigc,'LineWidth',5.0,'Color',C1(10,:));

load('sym/DwInfinite/data/DwInfsym3p_theta01.mat','D','list_beta','list_v1')
[B1,hfigc] = contour(list_v1,list_beta,D,lev);
set(hfigc,'LineWidth',5.0,'Color',C1(10,:));

load('sym/DwInfinite/data/DwInfsym3p_theta015.mat','D','list_beta','list_v1')
[B1,hfigc] = contour(list_v1,list_beta,D,lev);
set(hfigc,'LineWidth',5.0,'Color',C1(10,:));
set(gca,'fontsize',30);
xlabel('$v_1(0)$','fontsize',25,'interpreter','latex');
ylabel('$\beta$','fontsize',25,'interpreter','latex');


%% ASYM

%% Dw = 0

load('asym/DwZero/data/asym3ptheta005.mat','D','list_beta','list_v1')
[B1,hfigc] = contour(list_v1,list_beta,D,lev);
set(hfigc,'LineWidth',5.0,'Color',C2(6,:));

load('asym/DwZero/data/asym3ptheta01.mat','D','list_beta','list_v1')
[B1,hfigc] = contour(list_v1,list_beta,D,lev);
set(hfigc,'LineWidth',5.0,'Color',C2(6,:));

load('asym/DwZero/data/asym3ptheta015.mat','D','list_beta','list_v1')
[B1,hfigc] = contour(list_v1,list_beta,D,lev);
set(hfigc,'LineWidth',5.0,'Color',C2(6,:));

%% Intermediate Dw values here -- Dw = 1

load('asym/DwOne/Dw1asym3p_theta005.mat','D','list_beta','list_v1')
[B1,hfigc] = contour(list_v1,list_beta,D,lev);
set(hfigc,'LineWidth',5.0,'Color',C2(4,:));
% clabel(B1,hfigc,'FontSize',20);

load('asym/DwOne/Dw1asym3p_theta01.mat','D','list_beta','list_v1')
[B1,hfigc] = contour(list_v1,list_beta,D,lev);
set(hfigc,'LineWidth',5.0,'Color',C2(4,:));
% clabel(B1,hfigc,'FontSize',20);

load('asym/DwOne/Dw1asym3p_theta015.mat','D','list_beta','list_v1')
[B1,hfigc] = contour(list_v1,list_beta,D,lev);
set(hfigc,'LineWidth',5.0,'Color',C2(4,:));
% clabel(B1,hfigc,'FontSize',20);

%% Dw Infinity

load('asym/DwInfinite/data/Dwinfasym3p_theta005.mat','D','list_beta','list_v1')
% lev = [ 50 101];
[B1,hfigc] = contour(list_v1,list_beta,D,lev);
set(hfigc,'LineWidth',5.0,'Color',C2(3,:));

load('asym/DwInfinite/data/Dwinfasym3p_theta01.mat','D','list_beta','list_v1')
[B1,hfigc] = contour(list_v1,list_beta,D,lev);
set(hfigc,'LineWidth',5.0,'Color',C2(3,:));

load('asym/DwInfinite/data/Dwinfasym3p_theta015.mat','D','list_beta','list_v1')
[B1,hfigc] = contour(list_v1,list_beta,D,lev);
set(hfigc,'LineWidth',5.0,'Color',C2(3,:));
set(gca,'fontsize',30); ylim([0 5])
xlabel('$v_1(0)$','fontsize',25,'interpreter','latex');
ylabel('$\beta$','fontsize',25,'interpreter','latex');

ax1 = gca;  % Store handle to axes 1.
% Create smaller axes in top right, and plot on it
% Store handle to axes 2 in ax2.
ax2 = axes('Position',[0.6 0.67 0.25 0.25])
box on;
load('sym/DwZero/data/symD3ptheta01.mat','D','list_beta','list_v1')
colormap(hot);
pcolor(list_v1,list_beta,D); shading flat;
h=colorbar;
set(get(h,'title'),'string','$D_v$','interpreter','latex');


