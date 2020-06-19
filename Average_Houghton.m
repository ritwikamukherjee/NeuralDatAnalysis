clear all
cd 'C:\Users\rmukhe03\Documents\EMG_Dataanalysis\Good'
m1=matfile('Insect24_Test1good.mat');
m2=matfile('Insect24_Test3good.mat');
a = {catuneven(2, m1.Ch2raster, m2.Ch2raster)};
b = size(a{1});
spiketrains=zeros(b(2),b(1))'
for i = 1:length(spiketrains)
spiketrains(i,1)=a{1}(i)
end
for i = 1:length(spiketrains)
spiketrains(i,2)=a{1}(i+41)
end
EMGlist= py.list({py.list(m1.Ch2raster'),py.list(m2.Ch2raster')});
%EMGlist = {m1.Ch2raster', m2.Ch2raster'};
%pythonlist=py.list(EMGlist)
%spiketrainlist=py.list(spiketrains(:,1)')
%spiketrain='[[1,2,3],[34,22,34]]';
% % % % % % % a = 20 %just an example
% % % % % % % omtrek = 44
% % % % % % % py.example.squared(20,44)
%py.average_houghton.average([[12,13,14],[23,25,56]],0.5)
%py.average.average(py.list({py.list({12,13,14}), py.list({24,26,28})}),0.5) %WORKS! MATLAB needs to pass Python list and tuple data to your python class.
py.average_houghton.average(py.list({py.list(m1.Ch2raster'), py.list(m2.Ch2raster')}),0.5) %WORKS


