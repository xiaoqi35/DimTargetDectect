close all;clc;
param.W=10;param.t=1;param.t0=0;
param.L=1000;param.SNR=1;param.hie=3;  %小波包分解层数
W=10;t=1:W;h0=1;t0=5;hn=30;L=1000;
s=h0*exp(-3.*((t-t0)./W).^2); % object signal

Ps=10*log10(sum(s.^2)/size(s,2));
Pn=Ps-param.SNR;
n=wgn(L,1,Pn); % noise signal
tmp=543;
for i=1:W
    n(tmp+i)=n(tmp+i)+s(i);  % mixed signal
end
max1=max(n);
param.d=W;param.Step=1;param.S=50;param.eta=2;
markO=kernel(n,param);
% [cA,cD]=dwt(n,'sym4');
% ndwt=idwt(cA,zeros(size(cA)),'sym4');
ndwt=myWave1(n,param);

figure;
subplot(2,1,1);
set(gca,'YLim',[-10 15]);
plot(n)
hold on
plot([tmp,tmp],[-max1*1.1,0],'k') % locate the signal
plot(markO,'r','linewidth',2);
title(['Original analog signal  ','SNR: ',int2str(param.SNR)]);
legend('signal','object location','detected signal')

Psd=0;
for i=tmp:tmp+numel(s)
    Psd=Psd+ndwt(i)^2/numel(s);
end
Pnd=sum(ndwt.^2)/numel(ndwt);
SNRd=10*log10(Psd/Pnd);
subplot(2,1,2);
set(gca,'YLim',[-10 15]);
plot(ndwt)
hold on
markD=kernel(ndwt,param);
plot([tmp,tmp],[-max(ndwt)*1.1,0],'k'); % locate the signal
plot(markD,'g','linewidth',2);
title(['denoised signal by Wavelet  ','SNRd: ',int2str(SNRd)]);
legend('denoised signal','object location','detected signal')





