clear all
cd 'C:\Users\rmukhe03\Google Drive\EMG_RHD data\TrackingData'
targets=xlsread('Tracks_Meantargets.xlsx')
figure,
boxplot([targets(:,1),targets(:,2)],'Notch','on','Labels',{'mu = 3.58','mu = 5.28'})

%%%%Also from strike trajectories and fitting it in a linear model
%%%Mean segment end point
RelativeSegmentChange=[0.4574, -0.6977; 0.1622, -0.19601];
Error=[0.2626, 0.1090; 0.1169, 0.1478];
ngroups = size(RelativeSegmentChange, 1);
nbars = size(RelativeSegmentChange, 2);
% Calculating the width for each bar group
groupwidth = min(0.8, nbars/(nbars + 1.5));
figure,
bar(RelativeSegmentChange)
hold on
for i = 1:nbars
    x = (1:ngroups) - groupwidth/2 + (2*i-1) * groupwidth / (2*nbars);
    errorbar(x, RelativeSegmentChange(:,i), Error(:,i), '.');
end
hold off

figure,
bar(RelativeSegmentChange);
hold on
errorbar(RelativeSegmentChange,Error,'.k');