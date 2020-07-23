function data=myWave(data,param)

[w,h,~]=size(data);
all=w*h;
fbar=waitbar(0,'wave processing: 0');
digits(4)
% wave processing
for i=1:w
    for j=1:h
        %小波分解;
        tmp=squeeze(data(i,j,:));
        if sum(tmp) < 100
            data(i,j,:)=tmp;
        else
            [c,l]=wavedec(tmp,param.hie,'db4');   %小波基为db2
            ca11=appcoef(c,l,'db4',param.hie);    %获取小波近似系数
            cd={};
            for k=1:param.hie
                tmp=detcoef(c,l,k);
                lamda=median(tmp);
                length=numel(tmp);
                tmp1=zeros(1,length);
                m=mean(tmp)+3*std(tmp);
                kq=kurtosis(tmp);
                %==============
                %tmp=tmp.^2;
                %tmp=tmp./max(tmp)*m;
                a=kq/(2^(param.hie-k)+1);
                for t=1:length
                    %a=kq/(2^t+1);
                    tmp1(t)=lamda+a*abs(tmp(t)-lamda)*(exp((tmp(t)-lamda)/(m-lamda))-exp(-(tmp(t)-lamda)/(m-lamda)));
                    %tmp1(t)=a*tmp(t);
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
            data(i,j,:)=tmp;
        end
    end
    waitbar(i*j/all,fbar,['wave processing: ' num2str(uint8(i*j/all*100)) '%']);
end

disp('wave done!')
close(fbar);
%save('data_video_wave.mat','data')




