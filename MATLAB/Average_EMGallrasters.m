%clear all %Centrl spike trains+ Findburst data+ Trajectory 
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

% A6ipsisite= {m1.Ch2raster, m2.Ch2raster, m3.Ch2raster, m4.Ch2raster, m5.Ch2raster, m10.Ch3raster,...
%              m11.Ch3raster, m12.Ch3raster,m13.Ch3raster,m14.Ch3raster,m15.Ch2raster,m16.Ch2raster,m17.Ch2raster,m18.Ch2raster,...
%              m19.Ch2raster, m37.Ch2raster, m38.Ch2raster, m39.Ch2raster, m40.Ch2raster, m41.Ch2raster, m42.Ch2raster, m43.Ch2raster,...
%              m44.Ch2raster, m45.Ch2raster, m46.Ch2raster, m47.Ch2raster, m48.Ch2raster, m49.Ch2raster, m50.Ch2raster, m51.Ch2raster,...
%              m53.Ch2raster, m54.Ch2raster, m55.Ch2raster, m56.Ch2raster};
A6goodipsi= {m3.Ch2raster, m10.Ch3raster,...
             m11.Ch3raster, m14.Ch3raster,m15.Ch2raster,m16.Ch2raster,...
             m19.Ch2raster, m37.Ch2raster, m38.Ch2raster,m43.Ch2raster,...
             m46.Ch2raster,  m48.Ch2raster,  m50.Ch2raster,...
             m53.Ch2raster, m54.Ch2raster, m55.Ch2raster};

%close all
% for i= 1:length(A6goodipsi)
%     [bc(i),bi(i)]=findbursts(A6goodipsi{i}, 'simple', 'interburstdur', 0.3, 'minspikes', 1);
%     figure,
%     raster(A6goodipsi{i});
%     if length(bc(i).on)==1
%         addplot([bc(i).on; bc(i).off], ones(2,3), 'b-') ;
%         addplot(bc(i).ctr(1), ones(1, 3), 'r*');
%     elseif length(bc(i).on)==2
%         addplot([bc(i).on; bc(i).off], ones(2,2), 'b-');
%         addplot(bc(i).ctr, ones(1, 2), 'r*');
%     else 
%         addplot([bc(i).on; bc(i).off], ones(2,1), 'b-');
%         addplot(bc(i).ctr, ones(1, 1), 'r*');
%     end
%     hold off
%     A6ipsiburston{i}=bc(i).on;
%     A6ipsiburstoff{i}=bc(i).off;
%     A6ipsiburstcentre{i}=bc(i).ctr;
%     A6ipsiburstnspike{i}=bc(i).nspike;
% end
% %%%%Average of bursts. Main burst
% starttime=zeros(size(A6ipsiburston));endtime=zeros(size(A6ipsiburston));firstburststarttime=zeros(size(A6ipsiburston)); 
% firstburstendtime=zeros(size(A6ipsiburston));secondburststarttime=zeros(size(A6ipsiburston));secondburstendtime=zeros(size(A6ipsiburston));
% for i=1:length(A6ipsiburston)
%     if length(A6ipsiburston{i})==1
%         starttime(i)= A6ipsiburston{i};
%         endtime(i)=A6ipsiburstoff{i};
%     elseif length(A6ipsiburston{i})==2
%         starttime(i)=A6ipsiburston{i}(2);
%         endtime(i)=A6ipsiburstoff{i}(2);
%         firstburststarttime(i)=A6ipsiburston{i}(1);
%         firstburstendtime(i)=A6ipsiburstoff{i}(1);
%     else starttime(i)=A6ipsiburston{i}(end);
%         endtime(i)=A6ipsiburstoff{i}(end);
%         secondburststarttime(i)=A6ipsiburston{i}(end-1);
%         secondburstendtime(i)=A6ipsiburstoff{i}(end-1);
%     end
% end
% meantimesA6ipsi=[mean(starttime) mean(endtime) mean(firstburststarttime) mean(firstburstendtime) mean(secondburststarttime) mean(secondburstendtime)];
% semA6ipsi=[std(starttime)./sqrt(size(starttime,2)); std(endtime)./sqrt(size(endtime,2)); std(firstburststarttime)./sqrt(size(firstburststarttime,2)); ...
%     std(firstburstendtime)./sqrt(size(firstburstendtime,2)); std(secondburststarttime)./sqrt(size(secondburststarttime,2)); std(secondburstendtime)./sqrt(size(secondburstendtime,2))]';
% str = '#92C5DE';
% purple = sscanf(str(2:end),'%2x%2x%2x',[1 3])/255;
% 

%%%%%%%
%py.average_houghton.average(py.list({py.list(m1.Ch2raster'), py.list(m2.Ch2raster')}),0.5) %WORKS
A=makeList(A6goodipsi);
Ahoughton=py.average_houghton.average(A,0.001);
%%%%%%%
% A4ipsisite= {m1.Ch4raster, m2.Ch4raster, m3.Ch4raster, m4.Ch4raster, m5.Ch4raster,m6.Ch3raster, m7.Ch3raster, m8.Ch3raster, ...
%             m9.Ch3raster, m10.Ch4raster,m11.Ch4raster, m12.Ch2raster,m13.Ch2raster,m14.Ch2raster,m15.Ch4raster,m16.Ch4raster,m17.Ch4raster,m18.Ch4raster,...
%              m19.Ch4raster, m37.Ch4raster, m38.Ch4raster, m39.Ch4raster, m40.Ch4raster, m41.Ch4raster, m42.Ch4raster, m43.Ch4raster, m44.Ch4raster, m45.Ch4raster,... 
%              m46.Ch4raster, m47.Ch4raster, m48.Ch4raster, m49.Ch4raster, m50.Ch4raster, m51.Ch4raster, m53.Ch3raster, m54.Ch3raster,...
%              m55.Ch3raster,m56.Ch3raster};
A4goodipsi= { m1.Ch4raster, m3.Ch4raster, m7.Ch3raster, m8.Ch3raster, ...
            m9.Ch3raster, m14.Ch2raster, m16.Ch4raster,...
             m46.Ch4raster, m47.Ch4raster, m48.Ch4raster, m49.Ch4raster, m50.Ch4raster, m51.Ch4raster};
         
%close all
% for i= 1:length(A4goodipsi)
%     [bc(i),bi(i)]=findbursts(A4goodipsi{i}, 'simple', 'interburstdur', 0.1, 'minspikes', 2);
%     figure,
%     raster(A4goodipsi{i});
%     if length(bc(i).on)==1
%         addplot([bc(i).on; bc(i).off], ones(2,3), 'b-') ;
%         addplot(bc(i).ctr(1), ones(1, 3), 'r*');
%     elseif length(bc(i).on)==2
%         addplot([bc(i).on; bc(i).off], ones(2,2), 'b-');
%         addplot(bc(i).ctr, ones(1, 2), 'r*');
%     else 
%         addplot([bc(i).on; bc(i).off], ones(2,1), 'b-');
%         addplot(bc(i).ctr, ones(1, 1), 'r*');
%     end
%     hold off
%     A4ipsiburston{i}=bc(i).on;
%     A4ipsiburstoff{i}=bc(i).off;
%     A4ipsiburstcentre{i}=bc(i).ctr;
%     A4ipsiburstnspike{i}=bc(i).nspike;
% end
% %%%%Average of bursts. Main burst
% starttime=zeros(size(A4ipsiburston));endtime=zeros(size(A4ipsiburston));firstburststarttime=zeros(size(A4ipsiburston)); 
% firstburstendtime=zeros(size(A4ipsiburston));secondburststarttime=zeros(size(A4ipsiburston));secondburstendtime=zeros(size(A4ipsiburston));
% for i=1:length(A4ipsiburston)
%     if length(A4ipsiburston{i})==1
%         starttime(i)= A4ipsiburston{i};
%         endtime(i)=A4ipsiburstoff{i};
%     elseif length(A4ipsiburston{i})==2
%         starttime(i)=A4ipsiburston{i}(2);
%         endtime(i)=A4ipsiburstoff{i}(2);
%         firstburststarttime(i)=A4ipsiburston{i}(1);
%         firstburstendtime(i)=A4ipsiburstoff{i}(1);
%     else starttime(i)=A4ipsiburston{i}(end);
%         endtime(i)=A4ipsiburstoff{i}(end);
%         secondburststarttime(i)=A4ipsiburston{i}(end-1);
%         secondburstendtime(i)=A4ipsiburstoff{i}(end-1);
%     end
% end
% 
% meantimesA4=[mean(starttime) mean(endtime) mean(firstburststarttime) mean(firstburstendtime) ]%mean(secondburststarttime) mean(secondburstendtime)];
% semA4=[std(starttime)./sqrt(size(starttime,2)); std(endtime)./sqrt(size(endtime,2)); std(firstburststarttime)./sqrt(size(firstburststarttime,2)); ...
%     std(firstburstendtime)./sqrt(size(firstburstendtime,2))]';%; std(secondburststarttime)./sqrt(size(secondburststarttime,2)); std(secondburstendtime)./sqrt(size(secondburstendtime,2))]';


%%%%%%%%
B=makeList(A4goodipsi);
Bhoughton=py.average_houghton.average(B,0.001);
%%%%%%%%
% A6contrasite= {m1.Ch3raster, m2.Ch3raster, m3.Ch3raster,m4.Ch3raster, m5.Ch3raster, m6.Ch4raster,  m7.Ch4raster,m8.Ch4raster,...
%              m9.Ch4raster, m10.Ch2raster, m11.Ch2raster, m12.Ch4raster, m13.Ch4raster,m14.Ch4raster,m15.Ch3raster,m16.Ch3raster,m18.Ch3raster,m19.Ch3raster,...
%              m20.Ch2raster, m21.Ch2raster,m22.Ch2raster,m23.Ch2raster,m24.Ch2raster,m25.Ch2raster,m26.Ch2raster,m27.Ch2raster,m28.Ch2raster,...
%              m29.Ch2raster,m30.Ch2raster, m31.Ch4raster, m32.Ch4raster, m33.Ch2raster, m34.Ch2raster, m35.Ch2raster, m36.Ch2raster};
A6goodcontra= {m1.Ch3raster, m7.Ch4raster,...
             m10.Ch2raster, m35.Ch2raster, m4.Ch3raster, m5.Ch3raster, m6.Ch4raster,m8.Ch4raster,m9.Ch4raster,m12.Ch4raster, m15.Ch3raster,m16.Ch3raster,...
            m22.Ch2raster,m23.Ch2raster,m28.Ch2raster,...
             m29.Ch2raster, m31.Ch4raster, m32.Ch4raster}; %m2.Ch3raster
%close all
% for i= 1:length(A6goodcontra)
%     [bc(i),bi(i)]=findbursts(A6goodcontra{i}, 'simple', 'interburstdur', 0.35, 'minspikes', 4);
% end
% %%%Customise some of them separately
% [bc(5),bi(5)]=findbursts(A6goodcontra{5}, 'simple', 'interburstdur', 0.2, 'minspikes', 1);
% [bc(7),bi(7)]=findbursts(A6goodcontra{7}, 'simple', 'interburstdur', 0.2, 'minspikes', 4);
% [bc(8),bi(8)]=findbursts(A6goodcontra{8}, 'simple', 'interburstdur', 0.25, 'minspikes', 1);
% [bc(9),bi(9)]=findbursts(A6goodcontra{9}, 'simple', 'interburstdur', 0.22, 'minspikes', 1);
% [bc(11),bi(11)]=findbursts(A6goodcontra{11}, 'simple', 'interburstdur', 0.06, 'minspikes', 1);
% [bc(12),bi(12)]=findbursts(A6goodcontra{12}, 'simple', 'interburstdur', 0.3, 'minspikes', 1);
% [bc(13),bi(13)]=findbursts(A6goodcontra{13}, 'simple', 'interburstdur', 0.095, 'minspikes', 1);
% [bc(14),bi(14)]=findbursts(A6goodcontra{14}, 'simple', 'interburstdur', 0.09, 'minspikes', 1);
% [bc(15),bi(15)]=findbursts(A6goodcontra{15}, 'simple', 'interburstdur', 0.06, 'minspikes', 1);
% [bc(16),bi(16)]=findbursts(A6goodcontra{16}, 'simple', 'interburstdur', 0.06, 'minspikes', 1);
% [bc(18),bi(18)]=findbursts(A6goodcontra{18}, 'simple', 'interburstdur', 0.01, 'minspikes', 1);
% 
% for i=1:length(A6goodcontra)
%     figure,
%     raster(A6goodcontra{i});
%     if length(bc(i).on)==1
%         addplot([bc(i).on; bc(i).off], ones(2,3), 'b-') ;
%         addplot(bc(i).ctr(1), ones(1, 3), 'r*');
%     elseif length(bc(i).on)==2
%         addplot([bc(i).on; bc(i).off], ones(2,2), 'b-');
%         addplot(bc(i).ctr, ones(1, 2), 'r*');
%     elseif length(bc(i).on)==3 
%         addplot([bc(i).on; bc(i).off], ones(2,1), 'b-');
%         addplot(bc(i).ctr, ones(1, 1), 'r*');
%     else 
%         addplot([bc(i).on; bc(i).off], ones(2,1), 'b-');
%         addplot(bc(i).ctr, ones(1, 1), 'r*');
%     end
%     hold off
%     A6contraburston{i}=bc(i).on;
%     A6contraburstoff{i}=bc(i).off;
%     A6contraburstcentre{i}=bc(i).ctr;
%     A6contraburstnspike{i}=bc(i).nspike;
% end
% %%%%Average of bursts. Main burst
% firstburststarttime=zeros(size(A6contraburston)); firstburstendtime=zeros(size(A6contraburston));
% secondburststarttime=zeros(size(A6contraburston));secondburstendtime=zeros(size(A6contraburston));
% thirdburststarttime=zeros(size(A6contraburston));thirdburstendtime=zeros(size(A6contraburston));
% 
% firstburststarttime = [A6contraburston{1}(1), A6contraburston{3}(1),...
%    A6contraburston{4}(2),A6contraburston{5}(1),A6contraburston{6},A6contraburston{7}(1),A6contraburston{8}(2),A6contraburston{9}(1),...
%    A6contraburston{10}(1),A6contraburston{11}(2),A6contraburston{12},A6contraburston{13}(3),A6contraburston{14}(3),...
%    A6contraburston{15}(2),A6contraburston{16}(1)]; %starting at 0.2 seconds on average
% firstburstendtime = [A6contraburstoff{1}(1), A6contraburstoff{3}(1),...
%    A6contraburstoff{4}(2),A6contraburstoff{5}(1),A6contraburstoff{6},A6contraburstoff{7}(1),A6contraburstoff{8}(2),A6contraburstoff{9}(1),...
%    A6contraburstoff{10}(1),A6contraburstoff{11}(2),A6contraburstoff{12},A6contraburstoff{13}(3),A6contraburstoff{14}(3),...
%    A6contraburstoff{15}(2),A6contraburstoff{16}(1)];
% 
% secondburststarttime = [A6contraburston{1}(2), A6contraburston{2}(2), A6contraburston{3}(2),...
%    A6contraburston{4}(3),A6contraburston{8}(3),A6contraburston{9}(2),A6contraburston{10}(2),A6contraburston{11}(4),...
%    A6contraburston{14}(5),A6contraburston{15}(5),A6contraburston{15}(6),A6contraburston{16}(4),...
%    A6contraburston{16}(3),A6contraburston{17},A6contraburston{18}]; %starting near 0.9 seconds
% secondburstendtime = [A6contraburstoff{1}(2), A6contraburstoff{2}(2), A6contraburstoff{3}(2),...
%    A6contraburstoff{4}(3),A6contraburstoff{8}(3),A6contraburstoff{9}(2),A6contraburstoff{10}(2),A6contraburstoff{11}(4),...
%    A6contraburstoff{14}(5),A6contraburstoff{15}(5),A6contraburstoff{15}(6),A6contraburstoff{16}(4),...
%    A6contraburstoff{16}(3),A6contraburstoff{17},A6contraburstoff{18}]; %starting near 0.9 seconds
% 
% thirdburststarttime = [A6contraburston{2}(1),A6contraburston{9}(1), A6contraburston{14}(1)]; %starting near -0.2 seconds
% thirdburstendtime = [A6contraburstoff{2}(1),A6contraburstoff{9}(1), A6contraburstoff{14}(1)]; %starting near -0.2 seconds
% 
% 
% meantimesA6contra=[mean(firstburststarttime) mean(firstburstendtime) mean(secondburststarttime) mean(secondburstendtime) mean(thirdburststarttime) mean(thirdburstendtime)];
% semA6contra=[std(firstburststarttime)./sqrt(size(firstburststarttime,2)); std(firstburstendtime)./sqrt(size(firstburstendtime,2)); std(secondburststarttime)./sqrt(size(secondburststarttime,2)); ...
%     std(secondburstendtime)./sqrt(size(secondburstendtime,2)); std(thirdburststarttime)./sqrt(size(thirdburststarttime,2)); std(thirdburstendtime)./sqrt(size(thirdburstendtime,2))]';

%%%%%%%%%
C=makeList(A6goodcontra);
Choughton=py.average_houghton.average(C,0.001);
%%%%%%%%%



% A4contrasite= {m20.Ch4raster, m21.Ch4raster,m22.Ch4raster,m23.Ch4raster,m24.Ch4raster,m25.Ch4raster,m26.Ch4raster,m27.Ch4raster,m28.Ch4raster,...
%              m29.Ch4raster,m30.Ch4raster,m31.Ch2raster, m32.Ch2raster, m33.Ch4raster, m34.Ch4raster, m35.Ch4raster, m36.Ch4raster};
A4goodcontra = {m21.Ch4raster,m22.Ch4raster,m23.Ch4raster,m24.Ch4raster,m26.Ch4raster,...
             m29.Ch4raster,m30.Ch4raster,m31.Ch2raster, m33.Ch4raster, m34.Ch4raster, m36.Ch4raster};
%close all
% for i= 1:length(A4goodcontra)
%     [bc(i),bi(i)]=findbursts(A4goodcontra{i}, 'simple', 'interburstdur', 0.05, 'minspikes', 1);
% end
% [bc(2),bi(2)]=findbursts(A4goodcontra{2}, 'simple', 'interburstdur', 0.03, 'minspikes', 1);
% [bc(4),bi(4)]=findbursts(A4goodcontra{4}, 'simple', 'interburstdur', 0.06, 'minspikes', 1);
% [bc(6),bi(6)]=findbursts(A4goodcontra{6}, 'simple', 'interburstdur', 0.02, 'minspikes', 1);
% [bc(7),bi(7)]=findbursts(A4goodcontra{7}, 'simple', 'interburstdur', 0.02, 'minspikes', 1);
% [bc(8),bi(8)]=findbursts(A4goodcontra{8}, 'simple', 'interburstdur', 0.021, 'minspikes', 1);
% [bc(10),bi(10)]=findbursts(A4goodcontra{10}, 'simple', 'interburstdur', 0.028, 'minspikes', 1);
% [bc(11),bi(11)]=findbursts(A4goodcontra{11}, 'simple', 'interburstdur', 0.03, 'minspikes', 1);
% 
% for i=1:length(A4goodcontra)
%     figure,
%     raster(A4goodcontra{i});
%     if length(bc(i).on)==1
%         addplot([bc(i).on; bc(i).off], ones(2,3), 'b-') ;
%         addplot(bc(i).ctr(1), ones(1, 3), 'r*');
%     elseif length(bc(i).on)==2
%         addplot([bc(i).on; bc(i).off], ones(2,2), 'b-');
%         addplot(bc(i).ctr, ones(1, 2), 'r*');
%     elseif length(bc(i).on)==3 
%         addplot([bc(i).on; bc(i).off], ones(2,1), 'b-');
%         addplot(bc(i).ctr, ones(1, 1), 'r*');
%     else 
%         addplot([bc(i).on; bc(i).off], ones(2,1), 'b-');
%         addplot(bc(i).ctr, ones(1, 1), 'r*');
%     end
%     hold off
%     A4contraburston{i}=bc(i).on;
%     A4contraburstoff{i}=bc(i).off;
%     A4contraburstcentre{i}=bc(i).ctr;
%     A4contraburstnspike{i}=bc(i).nspike;
% end
% 
% %%%%Average of bursts. Main burst
% firstburststarttime=zeros(size(A4contraburston)); firstburstendtime=zeros(size(A4contraburston));
% secondburststarttime=zeros(size(A4contraburston));secondburstendtime=zeros(size(A4contraburston));
% thirdburststarttime=zeros(size(A4contraburston));thirdburstendtime=zeros(size(A4contraburston));
% fourthburststarttime=zeros(size(A4contraburston));fourthburstendtime=zeros(size(A4contraburston));
% 
% firstburststarttime = [A4contraburston{1}(1), A4contraburston{2}(1), A4contraburston{3}(2),...
%    A4contraburston{5}(3),A4contraburston{11}(2)]; %starting at 0.5 seconds on average
% firstburstendtime = [A4contraburstoff{1}(1), A4contraburstoff{2}(1), A4contraburstoff{3}(2),...
%    A4contraburstoff{5}(3),A4contraburstoff{11}(2)];
% 
% secondburststarttime = [A4contraburston{3}(1),A4contraburston{4}(2),A4contraburston{5}(2),...
%    A4contraburston{6}(3), A4contraburston{6}(4),A4contraburston{7}(4),A4contraburston{8}(3),A4contraburston{8}(4),A4contraburston{9}(3),...
%    A4contraburston{11}(1)]; %starting near 0 seconds
% secondburstendtime = [A4contraburstoff{3}(1),A4contraburstoff{4}(2),A4contraburstoff{5}(2),...
%    A4contraburstoff{6}(3), A4contraburston{6}(4),A4contraburstoff{7}(4),A4contraburstoff{8}(3),A4contraburston{8}(4),A4contraburstoff{9}(3),...
%    A4contraburstoff{11}(1)]; %starting near 0 seconds
% 
% thirdburststarttime = [A4contraburston{1}(3),A4contraburston{2}(3),A4contraburston{4}(3),A4contraburston{5}(4),...
%    A4contraburston{8}(5)]; %starting near 0.7 seconds
% thirdburstendtime = [A4contraburstoff{1}(3),A4contraburstoff{2}(3),A4contraburstoff{4}(3),A4contraburstoff{5}(4),...
%    A4contraburstoff{8}(5)]; %starting near 0.7 seconds
% 
% fourthburststarttime = [A4contraburston{4}(1),A4contraburston{5}(1),A4contraburston{6}(1),A4contraburston{7}(1),...
%    A4contraburston{7}(2),A4contraburston{8}(2),A4contraburston{9}(2),A4contraburston{9}(1)]; %starting near -0.5 seconds
% fourthburstendtime = [A4contraburstoff{4}(1),A4contraburstoff{5}(1),A4contraburstoff{6}(1),A4contraburstoff{7}(1),...
%    A4contraburstoff{7}(2),A4contraburstoff{8}(2),A4contraburstoff{9}(2),A4contraburstoff{9}(1)]; %starting near -0.5 seconds
% 
% fifthburststarttime = [A4contraburston{1}(3),A4contraburston{9}(5),A4contraburston{10}(1),A4contraburston{10}(2),A4contraburston{11}(3)]; %starting near 0.9 seconds
% fifthburstendtime = [A4contraburstoff{1}(3),A4contraburstoff{9}(5),A4contraburston{10}(1),A4contraburstoff{10}(2),A4contraburstoff{11}(3)]; %starting near 0.9 seconds
% 
% 
% meantimesA4contra=[mean(fifthburststarttime) mean(fifthburstendtime) mean(fourthburststarttime) mean(fourthburstendtime) mean(secondburststarttime) mean(secondburstendtime) mean(firstburststarttime) mean(thirdburstendtime)];
% semA4contra=[std(fifthburststarttime)./sqrt(size(fifthburststarttime,2)); std(fifthburstendtime)./sqrt(size(fifthburstendtime,2)); std(fourthburststarttime)./sqrt(size(fourthburststarttime,2)); ...
%     std(fourthburstendtime)./sqrt(size(fourthburstendtime,2));...
%     std(secondburststarttime)./sqrt(size(secondburststarttime,2));std(secondburstendtime)./sqrt(size(secondburstendtime,2));...
%     std(firstburststarttime)./sqrt(size(firstburststarttime,2));std(thirdburstendtime)./sqrt(size(thirdburstendtime,2))]';
% 
% %%%FIGURE
% str = '#92C5DE';
% purple = sscanf(str(2:end),'%2x%2x%2x',[1 3])/255;
% str = '#F4A582';
% orange = sscanf(str(2:end),'%2x%2x%2x',[1 3])/255;
% 
% figure,
% rectangle('Position',[meantimesA6ipsi(1) 0.75 meantimesA6ipsi(2)-meantimesA6ipsi(1) 0.50],'FaceColor',purple)
% axis([-0.5 1 0 5])
% hold on
% rectangle('Position',[meantimesA6ipsi(3) 0.75 meantimesA6ipsi(4)-meantimesA6ipsi(3) 0.50],'FaceColor',purple)
% % hold on
% % rectangle('Position',[meantimesA6ipsi(5) 0.75 meantimesA6ipsi(6)-meantimesA6ipsi(5) 0.50],'FaceColor',purple)
% hold on
% herrorbar(meantimesA6ipsi(1:4),repmat(1,1,4),semA6ipsi(1:4),'*k')
% hold on
% 
% rectangle('Position',[meantimesA6contra(1) 1.75 meantimesA6contra(2)-meantimesA6contra(1) 0.50],'FaceColor',orange)%second
% axis([-0.5 1 0 3])
% hold on
% rectangle('Position',[meantimesA6contra(3) 1.75 meantimesA6contra(4)-meantimesA6contra(3) 0.50],'FaceColor',orange)%last
% hold on
% rectangle('Position',[meantimesA6contra(5) 1.75 meantimesA6contra(6)-meantimesA6contra(5) 0.50],'FaceColor',orange)%first
% hold on
% semA6contra=[0.0469 0.0386 0.09 0.1 0.1880 0.1529];
% herrorbar(meantimesA6contra,repmat(2,1,6),semA6contra,'*k')
% hold off
% 
% figure,
% rectangle('Position',[meantimesA4(1) 0.75 meantimesA4(2)-meantimesA4(1) 0.50],'FaceColor',purple)
% axis([-0.5 1 0 3])
% hold on
% rectangle('Position',[meantimesA4(3) 0.75 meantimesA4(4)-meantimesA4(3) 0.50],'FaceColor',purple)
% hold on
% herrorbar(meantimesA4,repmat(1,1,4),semA4,'*k')
% 
% rectangle('Position',[meantimesA4contra(1) 1.75 meantimesA4contra(2)-meantimesA4contra(1) 0.50],'FaceColor',orange)%last rectangle
% axis([-0.5 1 0 3])
% hold on
% rectangle('Position',[meantimesA4contra(3) 1.75 meantimesA4contra(4)-meantimesA4contra(3) 0.50],'FaceColor',orange)%first
% hold on
% rectangle('Position',[meantimesA4contra(5) 1.75 meantimesA4contra(6)-meantimesA4contra(5) 0.50],'FaceColor',orange)%second
% hold on
% rectangle('Position',[meantimesA4contra(7) 1.75 meantimesA4contra(8)-meantimesA4contra(7) 0.50],'FaceColor',orange)%third
% hold on
% herrorbar(meantimesA4contra,repmat(2,1,8),semA4contra,'*k')
% hold off
% 
% %Bargraph comparing phasic shift
% categories=categorical({'A4contra' 'A6contra';'A4ipsi' 'A6ipsi'});
% segments=[meantimesA4contra(3) meantimesA6contra(5); meantimesA4(3) meantimesA6ipsi(3)];
% sem=[semA4contra(3) semA6contra(5); semA4(3) semA6ipsi(3)];
% barh(segments)
% hold on
% herrorbar(segments,[1-0.15 1+0.15; 2-0.15 2+0.15],sem,'*k'); 
% hold off
% %er.LineStyle = 'none';  
% axis([0.5 2.5 -0.5 0])
% %%%%%%%%%

D=makeList(A4goodcontra);
Dhoughton=py.average_houghton.average(D,0.001);
Acell=cell(Ahoughton); %A6 ipsi
Bcell=cell(Bhoughton);  %A4 ipsi
Ccell=cell(Choughton); %A6 contra
Dcell=cell(Dhoughton);%A4 contra
figure
allsites = raster(catuneven(2,cell2mat(Acell)',cell2mat(Ccell)', cell2mat(Bcell)', cell2mat(Dcell)'));
raster1=catuneven(2,cell2mat(Acell)',cell2mat(Ccell)');
raster2=catuneven(2,cell2mat(Bcell)',cell2mat(Dcell)');
% hold on
% x1=[0.2466 0.4954 0.7847];
% y1=[2.5 2.5 2.5];
% x2=[0.4526 0.8313 0.8477];
% y2=[0.5 0.5 0.5];
% plot(0,0.5,'r^','MarkerSize',5,'MarkerEdgeColor','red','MarkerFaceColor','red')
% plot(x1,y1,'k^','MarkerSize',5,'MarkerEdgeColor','k','MarkerFaceColor','k')
% plot(x2,y2,'b^','MarkerSize',5,'MarkerEdgeColor','b','MarkerFaceColor','b')
% text(0.025,0.5,'Start of strike');
% set(gca,'ytick',[1:length(allsites)]);
% hold off

normA6contra=(mean(A6contra,2)-min(abs(mean(A6contra,2))))/(max(abs(mean(A6contra,2)))-min(abs(mean(A6contra,2))));
normA6ipsi=(mean(A6ipsi,2)-min(abs(mean(A6ipsi,2))))/(max(abs(mean(A6ipsi,2)))-min(abs(mean(A6ipsi,2))));
normA4contra=(mean(A4contra,2)-min(abs(mean(A4contra,2))))/(max(abs(mean(A4contra,2)))-min(abs(mean(A4contra,2))));
normA4ipsi=(mean(A4ipsi,2)-min(abs(mean(A4ipsi,2))))/(max(abs(mean(A4ipsi,2)))-min(abs(mean(A4ipsi,2))));
normA6contraerror=std(A6contra,0,2).*(normA6contra./mean(A6contra,2));
normA4contraerror=std(A4contra,0,2).*(normA4contra./mean(A4contra,2));
normA6ipsierror=std(A6ipsi,0,2).*(normA6ipsi./mean(A6ipsi,2));
normA4ipsierror=std(A4ipsi,0,2).*(normA4ipsi./mean(A4ipsi,2));

str = '#d2d2d2';
gray = sscanf(str(2:end),'%2x%2x%2x',[1 3])/255;
% str = '#b1b5ba';
% bluegray = sscanf(str(2:end),'%2x%2x%2x',[1 3])/255;
figure
%plot(A6contrax',1.5+smooth(normA6contra),'Color',gray, 'LineWidth',1.8);
boundedline(A6contrax',1.5+smooth(normA6contra),normA6contraerror,'alpha');
hold on
%plot(A6ipsix',1.5+smooth(normA6ipsi),'Color',gray,'LineWidth',1.8)
boundedline(A6ipsix',1.5+smooth(normA6ipsi),normA6ipsierror,'alpha');
hold on
A6sites = raster(catuneven(2,cell2mat(Acell)',cell2mat(Ccell)'),[0 3],'LineWidth',1);
hold off


figure,
%plot(A4contrax',1.5+smooth(normA4contra),'Color',gray,'LineWidth',1.8);
boundedline(A4contrax',1.5+smooth(normA4contra),normA4contraerror,'alpha');
hold on
%plot(A4ipsix',1.5+smooth(normA4ipsi),'Color',gray,'LineWidth',1.8);
boundedline(A4ipsix',1.5+smooth(normA4ipsi),normA4ipsierror,'alpha');
hold on
A4sites=raster(catuneven(2,cell2mat(Bcell)', cell2mat(Dcell)'),[0 3],'LineWidth',1);
hold off


