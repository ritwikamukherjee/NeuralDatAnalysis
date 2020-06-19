%%%Binning rasters to plot probability of spikes
close all;
% % a=[0.5 2 2.3 5 6 7 10];
% % b=[0.75 1.5 2 4 8]; 
% % [time1,rate1,bin1]=firingrate(a,0.5,0) %binsize is 0.5 and smooth is 0
% % [time2,rate2,bin2]=firingrate(b,0.5,0) %binsize is 0.5 and smooth is 0
% [t1,r1,b1]=firingrate(m1.Ch2raster,0.06,0);
% [t2,r2,b2]=firingrate(m2.Ch2raster,0.06,0);
% 
% figure,
% raster(catuneven(2,m1.Ch2raster,m2.Ch2raster));
% figure,
% plot(t1(1:end-1),r1(1:end-1));
% hold on
% plot(t2(1:end-1),r2(1:end-1));
% 
% times=catuneven(2,t1(1:end-1),t2(1:end-1));
% rates=catuneven(2,r1(1:end-1),r2(1:end-1));
% plot(mean(rates,2));
%%%%%%%%%%%%%%
cd 'C:\Users\rmukhe03\Documents\EMG_Dataanalysis\Good'
m1=matfile('Insect24_Test1good.mat');
m2=matfile('Insect24_Test3good.mat');
m3=matfile('Insect24_Test4good.mat');
m4=matfile('Insect24_Test5good.mat');
m5=matfile('Insect24_Test6good.mat');
m6=matfile('Insect23_Test4good.mat');
m7=matfile('Insect23_Test3good.mat');
m8=matfile('Insect23_Test2good.mat');
m9=matfile('Insect23_Test1good.mat');
m10=matfile('Insect22_Test1good.mat');
m11=matfile('Insect21_Test1good.mat');
m12=matfile('Insect20_Test3good.mat');
m13=matfile('Insect20_Test2good.mat');
m14=matfile('Insect20_Test1good.mat');
m15=matfile('Insect19_Test2good.mat');
m16=matfile('Insect19_Test1good.mat');
m17=matfile('Insect18_Test1good.mat');
m18=matfile('Insect17_Test1good.mat');
m19=matfile('Insect17_Test1bgood.mat');
m20=matfile('Insect16_Test2bgood.mat');
m21=matfile('Insect16_Test2agood.mat');
m22=matfile('Insect16_Test1good.mat');
m23=matfile('Insect15_Test1good.mat');
m24=matfile('Insect15_Test2good.mat');
m25=matfile('Insect15_Test3good.mat');
m26=matfile('Insect15_Test4agood.mat');
m27=matfile('Insect15_Test4bgood.mat');
m28=matfile('Insect15_Test5good.mat');
m29=matfile('Insect14_Test1good.mat');
m30=matfile('Insect14_Test2good.mat');
m31=matfile('Insect13_Test2good.mat');
m32=matfile('Insect13_Test1good.mat');
m33=matfile('Insect12_Test8good.mat');
m34=matfile('Insect12_Test7bgood.mat');
m35=matfile('Insect12_Test7agood.mat');
m36=matfile('Insect12_Test6good.mat');
m37=matfile('Insect12_Test5good.mat');
m38=matfile('Insect12_Test4good.mat');
m39=matfile('Insect12_Test3good.mat');
m40=matfile('Insect12_Test2good.mat');
m41=matfile('Insect12_Test1good.mat');
m42=matfile('Insect11_Test10good.mat');
m43=matfile('Insect11_Test9good.mat');
m44=matfile('Insect11_Test8good.mat');
m45=matfile('Insect11_Test7good.mat');
m46=matfile('Insect11_Test6good.mat');
m47=matfile('Insect11_Test5good.mat');
m48=matfile('Insect11_Test4good.mat');
m49=matfile('Insect11_Test3good.mat');
m50=matfile('Insect11_Test2good.mat');
m51=matfile('Insect11_Test2agood.mat');
%m52=matfile('Insect11_Test1good.mat');
m53=matfile('Insect10_Test5good.mat');
m54=matfile('Insect10_Test4good.mat');
m55=matfile('Insect10_Test3good.mat');
m56=matfile('Insect10_Test2good.mat');

%From Daniel Caron
%%%%A6goodipsi
A6goodipsi= {m3.Ch2raster, m10.Ch3raster,...
             m11.Ch3raster, m14.Ch3raster,m15.Ch2raster,m16.Ch2raster,...
             m19.Ch2raster, m37.Ch2raster, m38.Ch2raster,m43.Ch2raster,...
             m46.Ch2raster,  m48.Ch2raster,  m50.Ch2raster,...
             m53.Ch2raster, m54.Ch2raster, m55.Ch2raster};

A4goodipsi= {m1.Ch4raster, m3.Ch4raster, m7.Ch3raster, m8.Ch3raster, ...
            m9.Ch3raster, m14.Ch2raster, m16.Ch4raster,...
             m46.Ch4raster, m47.Ch4raster, m48.Ch4raster, m49.Ch4raster, m50.Ch4raster, m51.Ch4raster};

A6goodcontra= {m1.Ch3raster, m7.Ch4raster,...
             m10.Ch2raster, m35.Ch2raster, m4.Ch3raster, m5.Ch3raster, m6.Ch4raster,m8.Ch4raster,m9.Ch4raster,m12.Ch4raster, m15.Ch3raster,m16.Ch3raster,...
            m22.Ch2raster,m23.Ch2raster,m28.Ch2raster,...
             m29.Ch2raster, m31.Ch4raster, m32.Ch4raster}; %m2.Ch3raster

A4goodcontra = {m21.Ch4raster,m22.Ch4raster,m23.Ch4raster,m24.Ch4raster,m26.Ch4raster,...
             m29.Ch4raster,m30.Ch4raster,m31.Ch2raster, m33.Ch4raster, m34.Ch4raster, m36.Ch4raster};         
         
close all
windows =160; %total number of windows
totaltime = 2; %seconds
windowsize = totaltime/windows;
A4ipsifreq = zeros(length(A4goodipsi),windows);
A6ipsifreq = zeros(length(A6goodipsi),windows);
A4contrafreq = zeros(length(A4goodcontra),windows);
A6contrafreq = zeros(length(A6goodcontra),windows);

for i=1:length(A6goodipsi)
    nA6goodipsi{i}=A6goodipsi{i}+1;
  for j=1:windows
      A6ipsifreq(i,j) = sum(nA6goodipsi{i} >= (windowsize * j) & nA6goodipsi{i} < windowsize * (j+1));
  end
end
for i=1:length(A4goodipsi)
    nA4goodipsi{i}=A4goodipsi{i}+1;
  for j=1:windows
      A4ipsifreq(i,j) = sum(nA4goodipsi{i} >= (windowsize * j) & nA4goodipsi{i} < windowsize * (j+1));
  end
end
for i=1:length(A4goodcontra)
    nA4goodcontra{i}=A4goodcontra{i}+1;
  for j=1:windows
      A4contrafreq(i,j) = sum(nA4goodcontra{i} >= (windowsize * j) & nA4goodcontra{i} < windowsize * (j+1));
  end
end
for i=1:length(A6goodcontra)
    nA6goodcontra{i}=A6goodcontra{i}+1;
  for j=1:windows
      A6contrafreq(i,j) = sum(nA6goodcontra{i} >= (windowsize * j) & nA6goodcontra{i} < windowsize * (j+1));
  end
end
str = '#F4A582';
orange = sscanf(str(2:end),'%2x%2x%2x',[1 3])/255;
str = '#92C5DE';
purple = sscanf(str(2:end),'%2x%2x%2x',[1 3])/255;
str = '#B2182B';
darkorange = sscanf(str(2:end),'%2x%2x%2x',[1 3])/255;
str = '#2166AC';
darkpurple = sscanf(str(2:end),'%2x%2x%2x',[1 3])/255;
%%%%
%%A6ipsi stuff
A6ipsifreq = A6ipsifreq;%/windowsize;
nA6ipsifreq=A6ipsifreq>0;
nA6ipsierror=std(nA6ipsifreq);
semA6ipsi=nA6ipsierror./sqrt(length(A6goodipsi)-1);
% figure,
% plot((-1+windowsize*.5):windowsize:(1-windowsize*.5), mean(A6ipsifreq));
% figure,
% plot((-1+windowsize*.5):windowsize:(1-windowsize*.5), mean(nA6ipsifreq));
figure,
bar(((-1+windowsize*.5):windowsize:(1-windowsize*.5)), mean(A6ipsifreq));
figure,
bar(((-1+windowsize*.5):windowsize:(1-windowsize*.5)), mean(nA6ipsifreq),'FaceColor',purple,'EdgeColor',purple);
hold on
er=errorbar((-1+windowsize*.5):windowsize:(1-windowsize*.5), mean(nA6ipsifreq),nA6ipsierror./sqrt(length(A6goodipsi)-1));
er.Color=[0.5 0.5 0.5];
er.LineStyle = 'none';  
%%%%%
%A4ipsi stuff
nA4ipsifreq=A4ipsifreq>0;
nA4ipsierror=std(nA4ipsifreq);
semA4ipsi=nA4ipsierror./sqrt(length(A4goodipsi)-1);
% figure,
% plot((-1+windowsize*.5):windowsize:(1-windowsize*.5), mean(A4ipsifreq));
% figure,
% plot((-1+windowsize*.5):windowsize:(1-windowsize*.5), mean(nA4ipsifreq));
figure,
bar(((-1+windowsize*.5):windowsize:(1-windowsize*.5)), mean(A4ipsifreq));
figure,
bar(((-1+windowsize*.5):windowsize:(1-windowsize*.5)), mean(nA4ipsifreq),'FaceColor',purple,'EdgeColor',purple);
hold on
er=errorbar((-1+windowsize*.5):windowsize:(1-windowsize*.5), mean(nA4ipsifreq),nA4ipsierror./sqrt(length(A4goodipsi)-1));
er.Color=[0.5 0.5 0.5];
er.LineStyle = 'none'; 
%%%%%%
%A4contra stuff
nA4contrafreq=A4contrafreq>0;
nA4contraerror=std(nA4contrafreq);
semA4contra=nA4contraerror./sqrt(length(A4goodcontra)-1);
% figure,
% plot((-1+windowsize*.5):windowsize:(1-windowsize*.5), mean(A4contrafreq));
% figure,
% plot((-1+windowsize*.5):windowsize:(1-windowsize*.5), mean(nA4contrafreq));
figure,
bar(((-1+windowsize*.5):windowsize:(1-windowsize*.5)), mean(A4contrafreq));
figure,
bar(((-1+windowsize*.5):windowsize:(1-windowsize*.5)), mean(nA4contrafreq),'FaceColor',orange,'EdgeColor',orange);
hold on
er=errorbar((-1+windowsize*.5):windowsize:(1-windowsize*.5), mean(nA4contrafreq),nA4contraerror./sqrt(length(A4goodcontra)-1));
er.Color=[0.5 0.5 0.5];
er.LineStyle = 'none'; 
%%%%%%%%%
%A6 contra stuff
A6contrafreq = A6contrafreq;%/windowsize;
nA6contrafreq=A6contrafreq>0;
nA6contraerror=std(nA6contrafreq);
semA6contra=nA6contraerror./sqrt(length(A6goodcontra)-1);
% figure,
% plot((-1+windowsize*.5):windowsize:(1-windowsize*.5), mean(A6contrafreq));
% figure,
% plot((-1+windowsize*.5):windowsize:(1-windowsize*.5), mean(nA6contrafreq));
figure,
bar(((-1+windowsize*.5):windowsize:(1-windowsize*.5)), mean(A6contrafreq));
figure,
bar(((-1+windowsize*.5):windowsize:(1-windowsize*.5)), mean(nA6contrafreq),'FaceColor',orange,'EdgeColor',orange);
hold on
er=errorbar((-1+windowsize*.5):windowsize:(1-windowsize*.5), mean(nA6contrafreq),nA6contraerror./sqrt(length(A6goodcontra)-1));
er.Color=[0.5 0.5 0.5];
er.LineStyle = 'none';  

%%%%Do it for all segments. Find the most change and that is the beginning
%%%%of the burst. A4ipsi= (0.1188,-0.2308);A6ipsi = (0.1937,0.1875);A4contra=
%%%%(-0.3187,0.1818); A6contra=(-0.06875,0)

% meanA4ipsi=mean(nA4ipsifreq);time=(-1+windowsize*.5):windowsize:(1-windowsize*.5);
% for i=1:(length(mean(nA4ipsifreq))-1)
%     diff(i)=meanA4ipsi(i+1)-meanA4ipsi(i);
%     difference{i}=[time(i+1) diff(i)]; 
% end
% figure,
% plot(time(1:end-1),diff)
% for i=1:length(diff)-1
%     d(i)=diff(i+1)-diff(i);
% end
% figure,
% plot(time(1:end-2),d)
[c1]=find(round(time,4)==0.1188);
[c2]=find(round(time,4)== -0.3188);
[c3]=find(round(time,4)==0.1937);
[c4]=find(round(time,4)== -0.0687);

%Bargraph comparing phasic shift
% %categories=categorical({'A4contra' 'A6contra';'A4ipsi' 'A6ipsi'});
segments=[0.1188; -0.3187 ; 0.1937; -0.06875];%[A4ipsi(0.05625,0.4615), A4contra (-0.3187 ,0.2727); A6ipsi(0.2188,0.375) A6contra (-0.04375,0.222)]
spikes=[mean(A4ipsifreq(:,c1)) mean(A4contrafreq(:,c2)) mean(A6ipsifreq(:,c3)) mean(A6contrafreq(:,c4))];
sem=[semA4ipsi(c1) semA4contra(c2);semA6ipsi(c3) semA6contra(c4)];
figure,
y = 1;
line([-0.5,1],[y,y])
hold on
plot(segments(1),1,'*k',segments(3),1,'*k');
hold on
plot(segments(2),1,'*b',segments(4),1,'*b');
hold off
% figure,
% %plot(segments,'*')
% %hold on
% herrorbar(segments,[1-0.14 1+0.14; 2-0.14 2+0.14],sem,'*k'); 
% hold off
%  %er.LineStyle = 'none';  
% axis([0.5 2.5 -0.5 0])
% %%%statistics
% statmatrix=[segments sem];
% statmatrix={A4ipsifreq(:,c1) A4contrafreq(:,c2) A6ipsifreq(:,c3) A6contrafreq(:,c4)};
% % % %%%%%%%%%
