function[]= optPlot_Dv

load('FV2patch.mat','TF','list_Dv','list_lambda','list_mu')

for i = 1:length(list_Dv)
maxValue = max(TF(:,:,i), [], 'all');
[rowsOfMaxes colsOfMaxes] = find(TF(:,:,i) == maxValue);
opt_forg(i) = maxValue;
opt_lambda(i) = list_lambda(rowsOfMaxes);
opt_mu(i) = list_mu(colsOfMaxes);
end 

max(opt_forg)
pos = find(opt_forg == max(opt_forg))
l = opt_lambda(pos)
m = opt_mu(pos)
d = list_Dv(pos)

figure;
hold on;
plot(list_Dv,opt_forg,'Color',[0.00,0.45,0.74],'LineWidth',5);
set(gca,'fontsize',30);
xlabel('$D_v,\lambda,\mu$','fontsize',25,'interpreter','latex');
ylabel('Foragers','fontsize',25,'interpreter','latex');

pos = find(opt_forg == max(opt_forg))
list_Dv(pos)
opt_forg(pos)
plot(list_Dv(pos),opt_forg(pos),'.','Color',[0.00,0.45,0.74],'MarkerSize',50);