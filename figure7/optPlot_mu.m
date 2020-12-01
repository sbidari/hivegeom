function[]= optPlot_mu

load('FV2patch.mat','TF','list_Dv','list_lambda','list_mu')

for i = 1:length(list_mu)
    A = squeeze(TF(:,i,:));
    maxValue = max(A, [], 'all');
    opt_forg(i) = maxValue;
end 

plot(list_mu,opt_forg,'LineWidth',5,'Color',[0.93,0.69,0.13]);
pos = find(opt_forg == max(opt_forg))
list_mu(pos)
opt_forg(pos)
plot(list_mu(pos),opt_forg(pos),'.','Color',[0.93,0.69,0.13],'MarkerSize',50);