function data=dataGenerator(param)
m=param.w;n=param.h;l=param.l;r=param.r;SNR=param.SNR;
t=1:r;t0=r/2;
s=exp(-3.*((t-t0)./r).^2); % object signal
Ps=10*log10(sum(s.^2)/numel(s)); %power of signal
%Pn=Ps/(10^(param.SNR/10));
Pn=Ps-SNR; %power of noise
data=zeros(m,n,l);

for i=1:m
    for j=1:n
        data(i,j,:)=wgn(l,1,Pn);
        if i==j&&r*i<=l
            data(i,j,r*(i-1)+1:r*i)=data(i,j,r*(i-1)+1:r*i)+reshape(s,1,1,r);
        end
    end
end
