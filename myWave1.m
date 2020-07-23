function data=myWave1(data,param)

tmp=data;
[c,l]=wavedec(tmp,param.hie,'db4');   %小波基为db4
ca11=appcoef(c,l,'db4',param.hie);    %获取一维小波近似系数
cd={};
for k=1:param.hie
    tmp=detcoef(c,l,k);
    %figure;plot(tmp);
    lamda=median(tmp);
    length=numel(tmp);
    tmp1=zeros(1,length);
    m=mean(tmp)+3*std(tmp);
    kq=kurtosis(tmp);
    a=kq/(2^(param.hie-k)+1);
    for t=1:length
        tmp1(t)=lamda+a*abs(tmp(t)-lamda)*(exp((tmp(t)-lamda)/(m-lamda))-exp(-(tmp(t)-lamda)/(m-lamda)));
    end
    cd{k}=tmp1;
end
c=reshape(ca11,1,[]);
for k=param.hie:-1:1
    tmp=c;
    c=[tmp,cd{k}];
end
%小波重构
tmp=waverec(c,l,'db4');
data=tmp;

disp('wave done!')

%save('data_video_wave.mat','data')




