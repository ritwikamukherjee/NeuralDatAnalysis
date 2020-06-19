cd 'C:\Users\rmukhe03\Google Drive\EMG_RHD data\TrackingData'

windows =40; %total number of windows
totaltime = 1; %seconds
windowsize = totaltime/windows;
%%
%A6contra
window_numberofelements=round(length(errorA6contra)/windows);
A6contrafilterederror=zeros(windows,1);

for i=1:length(A6contrafilterederror)
    A6contrafilterederror(i)=mean(errorA6contra(window_numberofelements*(i-1)+1:window_numberofelements*i));
end
A6contrafilterederror=[zeros(40,1);A6contrafilterederror] 
plot(A6contrafilterederror)
%%
%A6ipsi
window_numberofelements=round(length(errorA6ipsi)/windows);
A6ipsifilterederror=zeros(windows,1);

for i=1:length(errorA6ipsi(window_numberofelements:window_numberofelements:end))
    A6ipsifilterederror(i)=mean(errorA6ipsi(window_numberofelements*(i-1)+1:window_numberofelements*i));
end
if length(errorA6ipsi(window_numberofelements:window_numberofelements:end))==39
    A6ipsifilterederror(40)=A6ipsifilterederror(39);
end
A6ipsifilterederror=[zeros(40,1);A6ipsifilterederror] 
plot(A6ipsifilterederror)
%%
%A4contra
window_numberofelements=round(length(errorA4contra)/windows);
A4contrafilterederror=zeros(windows,1);

for i=1:length(errorA4contra(window_numberofelements:window_numberofelements:end))
    A4contrafilterederror(i)=mean(errorA4contra(window_numberofelements*(i-1)+1:window_numberofelements*i));
end
if length(errorA4contra(window_numberofelements:window_numberofelements:end))==39
    A4contrafilterederror(40)=A4contrafilterederror(39);
end
A4contrafilterederror=[zeros(40,1);A4contrafilterederror] 
plot(A4contrafilterederror)
%%
%A4ipsi
window_numberofelements=round(length(errorA4ipsi)/windows);
A4ipsifilterederror=zeros(windows,1);

for i=1:length(errorA4ipsi(window_numberofelements:window_numberofelements:end))
    A4ipsifilterederror(i)=mean(errorA4ipsi(window_numberofelements*(i-1)+1:window_numberofelements*i));
end
if length(errorA4ipsi(window_numberofelements:window_numberofelements:end))==39
    A4ipsifilterederror(40)=A4ipsifilterederror(39);
end
A4ipsifilterederror=[zeros(40,1);A4ipsifilterederror] 

cvA4contra=A4contrafilterederror(40:end)./(A4contrafiltered(40:end));
cvA6contra=A6contrafilterederror(40:end)./A6contrafiltered(40:end);
cvA4ipsi=A4ipsifilterederror(40:end)./abs(A4ipsifiltered(40:end));
cvA6ipsi=A6ipsifilterederror(40:end)./abs(A6ipsifiltered(40:end));

csvwrite('ErrorsfromTrajectories.csv', [cvA4contra,cvA4ipsi,cvA6contra,cvA6ipsi]);

Errorsfromfreqdistributions=csvread('Errorsfromfreqdistributions.csv');
Errorsfromtrajectories=csvread('ErrorsfromTrajectories.csv');

%%A4Contra
figure,
%plot((cvA4contra(2:end)))
scatter((11:40)'./40,Errorsfromtrajectories(12:end,1)./2,'ko'); hold on 
%plot(Errorsfromfreqdistributions(41:end,1));
scatter((11:40)'./40,Errorsfromfreqdistributions(51:end,1),'ks','filled');
legend('Kinematic data','EMG spike frequency')
set(gca, 'FontName', 'Arial')
%p =  3.5555e-05; tstat: -4.9091; df: 28; sd: 1.0820
       
%%A4Ipsi
figure,
scatter((11:40)'./40,Errorsfromtrajectories(12:end,2),'ko'); hold on 
scatter((11:40)'./40,Errorsfromfreqdistributions(51:end,2),'ks','filled');
legend('Kinematic data','EMG spike frequency')
set(gca, 'FontName', 'Arial')
%p =    7.3771e-06;  tstat:-5.4851; df: 28;  sd: 0.8690
      
%%A6Contra
figure,
scatter((11:40)'./40,Errorsfromtrajectories(12:end,3),'ko'); hold on 
scatter((11:40)'./40, Errorsfromfreqdistributions(51:end,3),'ks','filled');
legend('Kinematic data','EMG spike frequency')
set(gca, 'FontName', 'Arial')
%p = 1.5591e-09; tstat:  -9.2347; df: 25;  sd: 0.8966


%%A6Ipsi
figure,
scatter((11:40)'./40,Errorsfromtrajectories(12:end,4),'ko'); hold on 
scatter((11:40)'./40, Errorsfromfreqdistributions(51:end,4),'ks','filled');
legend('Kinematic data','EMG spike frequency')
set(gca, 'FontName', 'Arial')
%p =  9.0623e-11;  tstat: -10.0273; df: 28;   sd: 0.4585
minimumCVEMG=[0.7303 0.8882 0.4517 1.0681];
maximumCVEMG=[2.3094 4.2426  3.6056  3.3166];

maximumCVkinematics=[1.7282 1.9306  1.1953   4.4847];
minimumCVkinematics= [0.7455 0.4877 0.1649 0.6320];    
  


   
   

csvwrite('Errorsfromfreqdistributions.csv', [A4contraerror',A4ipsierror',A6contraerror',A6ipsierror']);
