function[]= optPlot_lambda

load('FV2patch.mat','TF','list_Dv','list_lambda','list_mu')

for i = 1:length(list_lambda)
    A = squeeze(TF(i,:,:));
    maxValue = max(A, [], 'all');
    opt_forg(i) = maxValue;   
end

plot(list_lambda,opt_forg,'LineWidth',5,'Color',[0.85,0.33,0.10]);
pos = find(opt_forg == max(opt_forg))
list_lambda(pos)
opt_forg(pos)
plot(list_lambda(pos),opt_forg(pos),'.','Color',[0.85,0.33,0.10],'MarkerSize',50);