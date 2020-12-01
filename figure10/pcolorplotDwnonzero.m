
% Dw non zero

load('FYL2.mat','vfrac','TF','list_Dv','list_lambda','list_mu')
ii = 6;   %Dv = 0.4167;     % L2
mm = 5;   %mu = .3390;        %L2
kk = 4;   %lambda =  0.25;      %L2
  
TF_Dv = squeeze(TF(:,:,ii));
figure; hold on;
colormap(hot);
pcolor(list_mu,list_lambda,TF_Dv); shading flat; colorbar
set(gca,'fontsize',30); xlim([0 1]); ylim([0 1]);
% caxis([5 37]);
xlabel('$\mu$','fontsize',30,'interpreter','latex');
ylabel('$\nu$','fontsize',30,'interpreter','latex');
plot(list_mu(mm),list_lambda(kk),'.','MarkerSize',20,'Color',[.7,.7,.7])

TF_mu = squeeze(TF(:,mm,:));
figure; hold on;
colormap(hot);
pcolor(list_Dv,list_lambda,TF_mu); shading flat; colorbar
set(gca,'fontsize',30); xlim([0 1]); ylim([0 1]);
% caxis([5 37]);
xlabel('$D_v$','fontsize',30,'interpreter','latex');
ylabel('$\nu$','fontsize',30,'interpreter','latex');
plot(list_Dv(ii),list_lambda(kk),'.','MarkerSize',20,'Color',[.7,.7,.7])

TF_lambda = squeeze(TF(kk,:,:));
figure; hold on;
colormap(hot);
pcolor(list_Dv,list_mu,TF_lambda); shading flat; colorbar
set(gca,'fontsize',30); xlim([0 1]); ylim([0 1]);
% caxis([5 37]);
xlabel('$D_v$','fontsize',30,'interpreter','latex');
ylabel('$\mu$','fontsize',30,'interpreter','latex');
plot(list_Dv(ii),list_mu(mm),'.','MarkerSize',20,'Color',[.7,.7,.7])