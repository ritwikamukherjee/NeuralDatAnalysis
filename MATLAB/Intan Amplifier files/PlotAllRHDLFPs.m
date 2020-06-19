
clear;
figidx=1;

Motif='abcde'

[filename dirname]=uigetfile('*.rhd');

% filename=filename(1:end-4);

% motif='abc';
% ref=6;

if exist([dirname '/' filename '.not.mat'])
    not=load([dirname '/' filename '.not.mat'])
    start=regexp(not.labels,Motif)
    idx=start(1)
    if length(start)>1
        idxstop=start(end)+start(2)-start(1);
    else
        idxstop=regexp(not.labels,Motif(end));
    end;

    idx=not.onsets(idx)*not.Fs/1000;
    idxstop=not.onsets(idxstop)*not.Fs/1000;
end;



high_f=250; %make Filters;
low_f=1;
nyq=30000/2;
[q r]=butter(8,[low_f/nyq high_f/nyq]);
    
% if (exist([filename '.not.mat'])==2)
%     noteinfo=load([filename '.not.mat']);
%     [starts stops]=regexp(noteinfo.labels,motif);
% end;

[amplifier_data,t_amplifier,Fs,filedata,song]=IntanRHDImportAll(dirname,filename);

if ~exist('idxstop')
    idx=1;
    idxstop=length(t_amplifier); 
end;

figure;

%           Fs=Fs/20;
          
% for j=1:length(stops)
    
%     [sound Fs,ChanNo]=ReadOKrankData(dirname,filename,1);

    
%     endidx=noteinfo.offsets(stops) * (Fs/1000); %.*Fs;
%     startidx=noteinfo.onsets(starts) * (Fs/1000); %.*Fs;       
       
    
%     sound=song(idx:idxstop);%
% 
%     
% %     hand=subplot(8+1,1,1);
%     figure(figidx)
%     hand=subplot(filedata.num_amplifier_channels+1,1,1);
%    
%     
% %     [refsig Fs,ChanNo]=ReadOKrankData(dirname,filename,ref);
%     
%     dt=1/Fs;
%     dt=dt*1000;
% %     time=0:dt:dt*length(sound)-dt;
% %     plot(time,sound);axis tight;
% 
%     [S,F,T,P] = spectrogram(sound,256,250,256,30000);
%     surf(T,F,10*log10(P),'edgecolor','none'); axis tight; 
%     view(0,90);
%     songXLims=xlim;
%     set(gca,'xtick',[],'ytick',[])
%     
%     figure(figidx+1);
%     handb=subplot(filedata.num_amplifier_channels+1,1,1);
%     surf(T,F,10*log10(P),'edgecolor','none'); axis tight; 
%     view(0,90);
%     songXLims=xlim;
%     set(gca,'xtick',[],'ytick',[])
%     


    for i=1:filedata.num_amplifier_channels

%         load(['AllSongsChan' num2str(i)]);
%         [data Fs]=ReadOKrankData(dirname,filename,i);
        data=amplifier_data(i,:);
        data=data(idx:idxstop); 
%         keyboard
%         data=filtfilt(q,r,data); 
%         decimate(data,150);
        
           data=decimate(data,10);
%         keyboard;
%         data=data-mean(data);
        lowf=25;
        highf=35;
        filtNyq=Fs/10/2;
        lowf=lowf/filtNyq;
        highf=highf/filtNyq;
        
        [b a]=butter(4,[lowf highf],'bandpass');
        data=filtfilt(b,a,data); 
%         a=find(data>150);
%         data(a)=0;
%         a=find(data<-150);
%         data(a)=0;
%         keyboard;
        nfft=round(Fs/10*8/1000);
        nfft = 2^nextpow2(nfft);
        spect_win = hanning(nfft);
        noverlap = round(0.9*length(spect_win)); %number of overlapping points    

%         [S,F,T,P]=spectrogram(data,spect_win,noverlap,nfft,Fs);
        [S,F,T,P]=spectrogram(data,256,250,256,3000);

    %     P=P./F;
%         subplot(8+1,1,i+1);
       figure(figidx)
        subplot(filedata.num_amplifier_channels+1,1,i+1);
        surf(T,F,P,'edgecolor','none'); axis tight; 
        view(0,90);
        ylim([0 150]); 
        set(gca,'xtick',[],'ytick',[]);
        
        figure(figidx+1)
%         axes(handb)
        subplot(filedata.num_amplifier_channels+1,1,i+1);
        plot(data); 
        set(gca,'xtick',[],'ytick',[]);

    end;
    set(gca,'xtickMode', 'auto')




