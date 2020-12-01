% Generates figure 2c. Shows how the values of parameters causing transient recruitment is dependent on other parameters

close all;
clear all;


%% define colors here

Rd = [255,255,178;253,141,60;189,0,38];
Rd = Rd/255;
Gr = [199,233,192;65,171,93;0,109,44];
Gr = Gr/255;
Bl = [198,219,239;107,174,214;8,69,148];
Bl = Bl/255;
C = [Rd(3,:);Gr(3,:);Bl(3,:)];


%% Dw = 0, infinity

load('/Users/subekshya/Dropbox/adaptivenets/hivegeom/code/step function/2 patch/DwZero/Dv_Dwzerotheta01.mat','Dv','list_beta','list_v1')
figure; 
co = get(gca,'ColorOrder'); 
set(gca, 'ColorOrder', Bl, 'NextPlot', 'replacechildren');
plot(list_beta,Dv(:,2),'Color',Bl(2,:),'Linewidth',5); hold on;
plot(list_beta,Dv(:,3),'Color',Bl(3,:),'Linewidth',5); 
set(gca,'fontsize',35);
ylabel('$D_v$','fontsize',35,'interpreter','latex');
xlabel('$\beta$','fontsize',35,'interpreter','latex');

load('/Users/subekshya/Dropbox/adaptivenets/hivegeom/code/step function/2 patch/DwInfinite/Dv_Dwinftheta01.mat','Dv','list_beta','list_v1')
plot(list_beta,Dv(:,2),'Color',Gr(2,:),'Linewidth',5); 
plot(list_beta,Dv(:,3),'Color',Gr(3,:),'Linewidth',5); 
set(gca,'fontsize',30);

