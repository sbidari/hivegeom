
load('/Users/subekshya/Dropbox/adaptivenets/hivegeom/code/step function/2 patch/OptForage/FV2patch.mat','TF','list_Dv','list_lambda','list_mu')
ii= 133;    mm = 52; kk = 44;

TF_Dv = squeeze(TF(:,:,ii));
figure;
colormap(hot);
hold on;
pcolor(list_mu,list_lambda,TF_Dv); shading flat; colorbar
set(gca,'fontsize',25);
caxis([10 36]);
xlabel('$\mu$','fontsize',25,'interpreter','latex');
ylabel('$\lambda$','fontsize',25,'interpreter','latex');
plot(list_mu(mm),list_lambda(kk),'.','MarkerSize',30,'Color',[.7,.7,.7])

TF_mu = squeeze(TF(:,mm,:));
figure;
colormap(hot);
hold on;
pcolor(list_Dv,list_lambda,TF_mu); shading flat; colorbar
set(gca,'fontsize',25);
caxis([10 36]);
xlabel('$D_v$','fontsize',25,'interpreter','latex');
ylabel('$\lambda$','fontsize',25,'interpreter','latex');
plot(list_Dv(ii),list_lambda(kk),'.','MarkerSize',30,'Color',[.7,.7,.7])

TF_lambda = squeeze(TF(kk,:,:));
figure;
colormap(hot);
hold on;
pcolor(list_Dv,list_mu,TF_lambda); shading flat; colorbar
set(gca,'fontsize',25);
caxis([10 36]);
xlabel('$D_v$','fontsize',25,'interpreter','latex');
ylabel('$\mu$','fontsize',25,'interpreter','latex');
plot(list_Dv(ii),list_mu(mm),'.','MarkerSize',30,'Color',[.7,.7,.7])
