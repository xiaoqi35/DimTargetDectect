function data=dataGenerator2(param)
m=param.w;n=param.h;l=param.l;r=param.r;SNR=param.SNR;
t=1:r;t0=r/2;
s=exp(-3.*((t-t0)./r).^2); % object signal
Ps=10*log10(sum(s.^2)/numel(s)); %power of signal
%Pn=Ps/(10^(param.SNR/10));
Pn=Ps-SNR; %power of noise
l=130;
data=zeros(m,n,l);

for i=1:m
    for j=1:n
        data(i,j,:)=wgn(l,1,Pn);
        if i==j&&r*i<=l
            data(i,j,i:i+r-1)=data(i,j,i:i+r-1)+reshape(s,1,1,r);
        end
    end
end
