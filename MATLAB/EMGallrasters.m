clear all
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

figure
A6ipsi = raster(catuneven(2, m3.Ch2raster, m10.Ch3raster,...
             m11.Ch3raster, m14.Ch3raster,m15.Ch2raster,m16.Ch2raster,...
             m19.Ch2raster, m37.Ch2raster, m38.Ch2raster,m43.Ch2raster,...
               m46.Ch2raster,  m48.Ch2raster,  m50.Ch2raster,...
             m53.Ch2raster, m54.Ch2raster, m55.Ch2raster));%A6 ipsi Profile. #m1.Ch2raster,#m2.Ch2raster,#m4.Ch2raster, #m5.Ch2raster, #m12.Ch3raster,
                 %#m13.Ch3raster,#m17.Ch2raster, #m18.Ch2raster,#m41.Ch2raster, #m42.Ch2raster,# m39.Ch2raster, #m40.Ch2raster, m44.Ch2raster, #m47.Ch2raster,#m49.Ch2raster, #m51.Ch2raster,#m45.Ch2raster,#m56.Ch2raster
hold on
plot(0,0.5,'r^','MarkerSize',5,...
    'MarkerEdgeColor','red',...
    'MarkerFaceColor','red');
x2=[0.4526 0.8313 0.8477];
y2=[0.5 0.5 0.5];
plot(x2,y2,'b^','MarkerSize',5,'MarkerEdgeColor','b','MarkerFaceColor','b');
text(0.025,0.5,'Start of strike');
set(gca,'ytick',[1:length(A6ipsi)]);
hold off

figure
A6contra = raster(catuneven(2, m1.Ch3raster, m2.Ch3raster, m4.Ch3raster, m5.Ch3raster, m6.Ch4raster,  m7.Ch4raster,m8.Ch4raster,...
             m9.Ch4raster, m10.Ch2raster, m12.Ch4raster, m15.Ch3raster,m16.Ch3raster,...
            m22.Ch2raster,m23.Ch2raster,m28.Ch2raster,...
             m29.Ch2raster, m31.Ch4raster, m32.Ch4raster, m35.Ch2raster));%A6 contra Profile
         %#m3.Ch3raster,#m11.Ch2raster, #m13.Ch4raster,#m14.Ch4raster,#m18.Ch3raster,#m19.Ch3raster, m20.Ch2raster#m21.Ch2raster,#m26.Ch2raster,m24.Ch2raster,m25.Ch2raster,#m27.Ch2raster,#m30.Ch2raster,#m33.Ch2raster, #m34.Ch2raster,#m36.Ch2raster 
hold on
plot(0,0.5,'r^','MarkerSize',5,...
    'MarkerEdgeColor','red',...
    'MarkerFaceColor','red');
x2=[0.4526 0.8313 0.8477];
y2=[0.5 0.5 0.5];
plot(x2,y2,'b^','MarkerSize',5,'MarkerEdgeColor','b','MarkerFaceColor','b');
text(0.025,0.5,'Start of strike');
set(gca,'ytick',[1:length(A6contra)]);
hold off

figure
A4ipsi = raster(catuneven(2, m1.Ch4raster, m3.Ch4raster, m7.Ch3raster, m8.Ch3raster, ...
            m9.Ch3raster, m14.Ch2raster, m16.Ch4raster,...
             m46.Ch4raster, m47.Ch4raster, m48.Ch4raster, m49.Ch4raster, m50.Ch4raster, m51.Ch4raster));%A4 ipsi profile, #m2.Ch4raster,#m4.Ch4raster, #m5.Ch4raster,#m6.Ch3raster, #m11.Ch4raster,
        %#m10.Ch4raster, #m12.Ch2raster, #m13.Ch2raster,#m15.Ch4raster,#m18.Ch4raster,m37.Ch4raster,#m17.Ch4raster,#m19.Ch4raster, #m38.Ch4raster, #m39.Ch4raster,#m41.Ch4raster, #m40.Ch4raster, #m42.Ch4raster, #m43.Ch4raster, #m44.Ch4raster,# m45.Ch4raster,
        %#m53.Ch3raster,# m54.Ch3raster,# m55.Ch3raster,#m56.Ch3raster
hold on
plot(0,0.5,'r^','MarkerSize',5,...
    'MarkerEdgeColor','red',...
    'MarkerFaceColor','red');
x1=[0.2466 0.4954 0.7847];
y1=[2.5 2.5 2.5];
plot(x1,y1,'k^','MarkerSize',5,'MarkerEdgeColor','k','MarkerFaceColor','k');
text(0.025,0.5,'Start of strike');
set(gca,'ytick',[1:length(A4ipsi)]);
hold off


figure
A4contra = raster(catuneven(2,m21.Ch4raster,m22.Ch4raster,m23.Ch4raster,m24.Ch4raster,m26.Ch4raster,...
             m29.Ch4raster,m30.Ch4raster,m31.Ch2raster, m33.Ch4raster, m34.Ch4raster, m36.Ch4raster)); %A4 contra profile
               %#m20.Ch4raster, #m25.Ch4raster,#m27.Ch4raster,#m28.Ch4raster,#m32.Ch2raster, #m35.Ch4raster
hold on
plot(0,0.5,'r^','MarkerSize',5,...
    'MarkerEdgeColor','red',...
    'MarkerFaceColor','red');
x1=[0.2466 0.4954 0.7847];
y1=[2.5 2.5 2.5];
plot(x1,y1,'k^','MarkerSize',5,'MarkerEdgeColor','k','MarkerFaceColor','k');
text(0.025,0.5,'Start of strike');
set(gca,'ytick',[1:length(A4contra)]);
hold off