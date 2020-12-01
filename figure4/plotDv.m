
close all;
clear all;


% define colors here

Rd = [255,245,240;254,229,217;254,224,210;252,187,161;252,174,145;252,146,114;251,106,74;239,59,44;222,45,38;203,24,29;165,15,21;153,0,13;103,0,13];
Rd = Rd/255;

Bl = [247,251,255;239,243,255;222,235,247;198,219,239;189,215,231;158,202,225;107,174,214;66,146,198;49,130,189;33,113,181;8,81,156;8,69,148;8,48,107];
Bl = Bl/255;

Gr = [247,252,245;237,248,233;229,245,224;199,233,192;186,228,179;161,217,155;116,196,118;65,171,93;49,163,84;35,139,69;0,109,44;0,90,50;0,68,27];
Gr = Gr/255;

% Dw
figure; 

load('/Users/subekshya/Dropbox/critDzeroB01.mat','D','listN')
semilogy(listN,D,'LineWidth',5.0,'Color',Rd(3,:));
hold on;
load('/Users/subekshya/Dropbox/critDoneB01.mat','D','listN')
semilogy(listN,D,'LineWidth',5.0,'Color',Rd(6,:));
load('/Users/subekshya/Dropbox/critDinfB01.mat','D','listN')
semilogy(listN,D,'LineWidth',5.0,'Color',Rd(9,:));

load('/Users/subekshya/Dropbox/critDzero.mat','D','listN')
semilogy(listN,D,'LineWidth',5.0,'Color',Bl(3,:));
load('/Users/subekshya/Dropbox/critDone.mat','D','listN')
semilogy(listN,D,'LineWidth',5.0,'Color',Bl(6,:));
load('/Users/subekshya/Dropbox/critDinf.mat','D','listN')
semilogy(listN,D,'LineWidth',5.0,'Color',Bl(9,:));

load('/Users/subekshya/Dropbox/critDzeroB5.mat','D','listN')
semilogy(listN,D,'LineWidth',5.0,'Color',Gr(3,:));
load('/Users/subekshya/Dropbox/critDoneB5.mat','D','listN')
semilogy(listN,D,'LineWidth',5.0,'Color',Gr(6,:));
load('/Users/subekshya/Dropbox/critDinfB5.mat','D','listN')
semilogy(listN,D,'LineWidth',5.0,'Color',Gr(9,:));

set(gca,'fontsize',30);
xlabel('$N$','fontsize',25,'interpreter','latex');
ylabel('$\hat{D_v}$','fontsize',25,'interpreter','latex');
