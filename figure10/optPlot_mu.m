function[]= optPlot_mu

load('FYL2.mat','TF','list_Dv','list_lambda','list_mu')

for i = 1:length(list_mu)
    A = squeeze(TF(:,i,:));
    maxValue = max(A, [], 'all');
    [rowsOfMaxes colsOfMaxes] = find(A == maxValue);
    opt_forg(i) = maxValue;
    opt_lambda(i) = list_lambda(rowsOfMaxes);
    opt_Dv(i) = list_Dv(colsOfMaxes);
end

plot(list_mu,opt_forg,'LineWidth',5,'Color',[0.93,0.69,0.13]);
hold on;
pos = find(opt_forg == max(opt_forg));
list_mu(pos);
opt_forg(pos);
plot(list_mu(pos),opt_forg(pos),'.','Color',[0.93,0.69,0.13],'MarkerSize',50);