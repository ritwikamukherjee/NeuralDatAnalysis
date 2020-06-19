clear
cd 'C:\Users\rmukhe03\Documents\EMG_Dataanalysis\Good'
m1=matfile('Insect24_Test1good.mat');
m2=matfile('Insect24_Test3good.mat');
%Ch2=plotspikes(m1.Ch2raster)
%Ch4=plotspikes(m1.Ch4raster)
plotspikerate(m1.Ch2raster,'binsize',0.03,'smooth',0)