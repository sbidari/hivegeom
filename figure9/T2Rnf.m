function [time] = T2Rnf

a = 1.5;  % a related to total fraction of initial recruiting bees
% a = 0.3/h;  % a= 15/L;
L = 5;
list_B = linspace(0,5,51);
list_Dv = logspace(-2,log10(3),50);
Dw = 10;
theta = 0.1;

for i = 1:length(list_B)
    beta = list_B(i);
    for j = 1:length(list_Dv)
        Dv = list_Dv(j);
        [t,tot_rec,tot_w,tot_v] = diffconthivenf(beta,theta,Dw,Dv,L,a);
        pos =  find(tot_v >= 0.90);
        if isempty(pos)
            time(i,j)= NaN;
        else
            time(i,j)=t(pos(1));
        end
    end
    i
end

% save('Dw5T2RnfL5.mat','list_B','list_Dv','Dw','theta','time')

end