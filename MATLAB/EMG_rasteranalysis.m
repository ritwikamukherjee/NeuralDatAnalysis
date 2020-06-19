clear
cd 'C:\Users\rmukhe03\Documents'
filename='Insect21_Test1.mat';
goodfilename='Insect21_Test1good.mat';
importLabChart(filename,goodfilename);
load(goodfilename);
striketime=0.6; %from video in seconds
cd 'C:\Users\rmukhe03\Documents\neuromech-master'
%plot(t,Channel2)
%[spikeind,thresh]=findspikes(Channel2);%input the threshold for detencting spikes
%plot(t,Channel2,t(spikeind{1}),Channel2(spikeind{1}),'ro')%plotting the channel and the spikes alongside
%raster(t(spikeind{1}))
[spikeind,thresh]=findspikes([Channel2 Channel3 Channel4]);
raster(catuneven(2,t(spikeind{1}),t(spikeind{2}),t(spikeind{3}))) %plots the rasters together one below the other with length 0.1
plot(t,Channel6)
[~,peakind]=findpeaks(-Channel6,'MinPeakHeight',4000,'SortStr','descend')
t(peakind)
raster(catuneven(2,(t(spikeind{1})-t(peakind))/striketime,(t(spikeind{2})-t(peakind))/striketime,(t(spikeind{3})-t(peakind))/striketime))
