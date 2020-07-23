%clear all;
close all;
clc;
% set the param of arraydata of video
param.w=100;            % frame width
param.h=100;            % frame height
param.r=1;             % object frame number 
param.l=300;           % video length(time)
param.SNR=1;            % signal/noise ratio
param.count = 1;
%param.f='original.avi'; % video filename
param.f='resoure/target3.avi';
param.fdv2='dv2/fj1.dv2'; % .dv2 video filename
param.fnew='resoure/detect_sort.avi'; % detected video filename
param.fjpg='resoure/detect_sort.jpg'; % detected image filename
%% 
% get arraydata of video and then save the data as 'avi'
%data=dataGenerator(param);
%videoWriter(data,param.f);
%data=dv2avi(param.fdv2);
%data=videoReader1('resoure/new.avi');
% videoPlayer('video.mp4');
% videoPlayer(param.f);
%save('data_video.mat','data')
%save data
%load data
%data(1,4,:)=data(1,5,:);
data=mat2gray(data);
%%
% set the detect param
%param.d=fix(0.75*param.r); % gap of two time slices (r/2<d<r)
param.d=param.r;
param.Step=1; % window of detector step value
param.eta=4;  % coefficient of throsheld 
param.hie=5;  %小波包分解层数
param.R=2;    % 关联信号方差判断门限
param.gmax=3; % Number of Background Signals Extracted 
param.istrack=1;
param.drate=0.9;
param.T2=1.5;
%% wave processing in dimension 3 (time slices)
dataw=myWave(data,param);
%save dataw
%save data_fangzhen_w dataw
%load data_fangzhen_w.mat
%%
% get arraydata of deteced video ,then save and display it 
[traimg,mark,coordinate]=detector_track(dataw,param);
videoWriter(mark,param.fnew);
figure;imshow(traimg);
imwrite(traimg,param.fjpg);

%%
img=blak2(traimg);
figure;imshow(img);


