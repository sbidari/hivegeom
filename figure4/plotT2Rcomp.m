

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

%% plots patch=2
figure; hold on;
lev = [ 1 3 ];
load('2pT2RnfDw0.mat','time','list_B','list_Dv')
[B1,hfigc] = contour(log10(list_Dv),list_B,log10(time),lev);
set(hfigc,'LineWidth',7.0,'Color',Rd(3,:));
% clabel(B1,hfigc)

load('2pT2RnfDw1.mat','time','list_B','list_Dv')
[B1,hfigc] = contour(log10(list_Dv),list_B,log10(time),lev);
set(hfigc,'LineWidth',7.0,'Color',Rd(8,:));

load('2pT2RnfDw5.mat','time','list_B','list_Dv')
[B1,hfigc] = contour(log10(list_Dv),list_B,log10(time),lev);
set(hfigc,'LineWidth',7.0,'Color',Rd(11,:));
set(gca,'fontsize',30);
ylabel('$\beta$','fontsize',30,'interpreter','latex');
xlabel('$D_v$','fontsize',30,'interpreter','latex');

%% plots patch=5

figure; hold on;
% lev = [ 1 3 ];
load('5pT2RnfDw0.mat','time','list_B','list_Dv')
[B1,hfigc] = contour(log10(list_Dv),list_B,log10(time),lev);
set(hfigc,'LineWidth',7.0,'Color',Bl(3,:));
% clabel(B1,hfigc)

load('5pT2RnfDw1.mat','time','list_B','list_Dv')
[B1,hfigc] = contour(log10(list_Dv),list_B,log10(time),lev);
set(hfigc,'LineWidth',7.0,'Color',Bl(8,:));

load('5pT2RnfDw5.mat','time','list_B','list_Dv')
[B1,hfigc] = contour(log10(list_Dv),list_B,log10(time),lev);
set(hfigc,'LineWidth',7.0,'Color',Bl(11,:));
set(gca,'fontsize',30);
ylabel('$\beta$','fontsize',30,'interpreter','latex');
xlabel('$D_v$','fontsize',30,'interpreter','latex');

%% plots patch=10

figure; hold on;
lev = [ 1 3 ];
load('10pT2RnfDw0.mat','time','list_B','list_Dv')
[B1,hfigc] = contour(log10(list_Dv),list_B,log10(time),lev);
set(hfigc,'LineWidth',7.0,'Color',Gr(3,:));

load('10pT2RnfDw1.mat','time','list_B','list_Dv')
[B1,hfigc] = contour(log10(list_Dv),list_B,log10(time),lev);
set(hfigc,'LineWidth',7.0,'Color',Gr(8,:));
% clabel(B1,hfigc)

load('10pT2RnfDw5.mat','time','list_B','list_Dv')
[B1,hfigc] = contour(log10(list_Dv),list_B,log10(time),lev);
set(hfigc,'LineWidth',7.0,'Color',Gr(11,:));
set(gca,'fontsize',30);
ylabel('$\beta$','fontsize',30,'interpreter','latex');
xlabel('$D_v$','fontsize',30,'interpreter','latex');


