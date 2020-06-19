cd 'C:\Users\rmukhe03\Google Drive\EMG_RHD data\TrackingData'
A= xlsread('A4GoodIpsi.xlsx');
for i=1:size(A,2)
    A(:,i)=A(:,i)-A(1,i);
    R1=A(:,i);
    %R1=(R1-min(abs(R1)))/(max(abs(R1))-min(abs(R1)));
    X1{i}=R1(~isnan(R1));
end
[maxcellsize,maxcellind] = max(cellfun(@numel,X1));
for i=1:size(X1,2)
    [V(:,size(X1,2)+1),V(:,i)] = GL_Matchvectors(cell2mat(X1(maxcellind)), cell2mat(X1(i)));
end
V(:,size(X1,2)+1)=[];
A4ipsi=V;
figure,
plot(A4ipsi)
hold on
%%%%%%
B= xlsread('A4GoodContra.xlsx');
for i=1:size(B,2)
    B(:,i)=B(:,i)-B(1,i);
    R2=B(:,i);
    %R2=(R2-min(abs(R2)))/(max(abs(R2))-min(abs(R2)));
    X2{i}=R2(~isnan(R2));
end
[maxcellsize,maxcellind] = max(cellfun(@numel,X2));
for i=1:size(X2,2)
    [W(:,size(X2,2)+1),W(:,i)] = GL_Matchvectors(cell2mat(X2(maxcellind)), cell2mat(X2(i)));
end
W(:,size(X2,2)+1)=[];
A4contra=W;
%     [V(:,1),V(:,2)] = GL_Matchvectors(cell2mat(X(maxcellind)), cell2mat(X(1)));
% [V(:,1),V(:,3)] = GL_Matchvectors(cell2mat(X(maxcellind)), cell2mat(X(2)));
plot(A4contra)
hold off

C= xlsread('A6GoodContra.xlsx');
for i=1:size(C,2)
    C(:,i)=C(:,i)-C(1,i);
    R3=C(:,i);
    %R3=(R3-min(abs(R3)))/(max(abs(R3))-min(abs(R3)));
    X3{i}=R3(~isnan(R3));
end
[maxcellsize,maxcellind] = max(cellfun(@numel,X3));
for i=1:size(X3,2)
    [Q(:,size(X3,2)+1),Q(:,i)] = GL_Matchvectors(cell2mat(X3(maxcellind)), cell2mat(X3(i)));
end
Q(:,size(X3,2)+1)=[];
A6contra=Q;
%     [V(:,1),V(:,2)] = GL_Matchvectors(cell2mat(X(maxcellind)), cell2mat(X(1)));
% [V(:,1),V(:,3)] = GL_Matchvectors(cell2mat(X(maxcellind)), cell2mat(X(2)));
figure,
plot(A6contra)
hold on

D= xlsread('A6GoodIpsi.xlsx');
for i=1:size(D,2)
    D(:,i)=D(:,i)-D(1,i);
    R4=D(:,i);
    %R4=(R4-min(abs(R4)))/(max(abs(R4))-min(abs(R4)));
    X4{i}=R4(~isnan(R4));
end
[maxcellsize,maxcellind] = max(cellfun(@numel,X4));
for i=1:size(X4,2)
    [U(:,size(X4,2)+1),U(:,i)] = GL_Matchvectors(cell2mat(X4(maxcellind)), cell2mat(X4(i)));
end
U(:,size(X4,2)+1)=[];
A6ipsi=U;
%     [V(:,1),V(:,2)] = GL_Matchvectors(cell2mat(X(maxcellind)), cell2mat(X(1)));
% [V(:,1),V(:,3)] = GL_Matchvectors(cell2mat(X(maxcellind)), cell2mat(X(2)));
plot(A6ipsi)
hold off

A6contrax=(0:(length(A6contra)-1))./(length(A6contra)-1);
A6ipsix=(0:(length(A6ipsi)-1))./(length(A6ipsi)-1);
A4contrax=(0:(length(A4contra)-1))./(length(A4contra)-1);
A4ipsix=(0:(length(A4ipsi)-1))./(length(A4ipsi)-1);

errorA6contra=std(A6contra,0,2);%./sqrt(length(A6contra)-1);
errorA4contra=std(A4contra,0,2);%./sqrt(length(A4contra)-1);
errorA6ipsi=std(A6ipsi,0,2);%./sqrt(length(A6ipsi)-1);
errorA4ipsi=std(A4ipsi,0,2);%./sqrt(length(A4ipsi)-1);



% plot(mean(A6contra,2))
% hold on
str = '#F4A582';
orange = sscanf(str(2:end),'%2x%2x%2x',[1 3])/255;
str = '#92C5DE';
purple = sscanf(str(2:end),'%2x%2x%2x',[1 3])/255;
str = '#B2182B';
darkorange = sscanf(str(2:end),'%2x%2x%2x',[1 3])/255;
str = '#2166AC';
darkpurple = sscanf(str(2:end),'%2x%2x%2x',[1 3])/255;

figure,
boundedline(A6contrax',mean(A6contra,2),errorA6contra,'alpha');
hold on
boundedline(A6ipsix',mean(A6ipsi,2),errorA6ipsi,'alpha');
hold on
h1=plot(A6contrax',A6contra,'Color',orange,'LineWidth',1.5);
hold on
h2=plot(A6ipsix',A6ipsi,'Color',purple,'LineWidth',1.5);
hold on
plot(A6contrax',mean(A6contra,2),'Color',darkorange,'LineWidth', 3.3);
hold on
plot(A6ipsix',mean(A6ipsi,2),'Color',darkpurple,'LineWidth', 3.3);
hold off

%%%
figure,
boundedline(A4contrax',mean(A4contra,2),errorA4contra,'alpha');
hold on
boundedline(A4ipsix',mean(A4ipsi,2),errorA4ipsi,'alpha');
hold on
h1=plot(A4contrax',A4contra,'Color',orange,'LineWidth',1.5);
hold on
h2=plot(A4ipsix',A4ipsi,'Color',purple,'LineWidth',1.5);
hold on
plot(A4contrax',mean(A4contra,2),'Color',darkorange,'LineWidth', 3.3);
hold on
plot(A4ipsix',mean(A4ipsi,2),'Color',darkpurple,'LineWidth', 3.3);
hold off
