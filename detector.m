function result=detector(X,param)
disp('signal detector begin!');
tic
X=double(X);
[w,h,l]=size(X);
result=zeros(w,h,l);
n=param.r;
d=param.d;
l=l-n*2-d;
step=param.Step;

all=w*h;
fbar=waitbar(0,'detector processing: 0');
digits(3)
for a=1:w
    for b=1:h
             
        F=zeros(l,1);
        for j=1:step:l
            sum1=0;
            for i=1:n
                sum1=sum1+abs(X(a,b,i+j)-X(a,b,i+d+j)).*exp(abs(X(a,b,i+j)-X(a,b,i+d+j))/5);                       
            end
            F(j)=sum1/n;
        end
        T=mean(abs(F));
        for i=1:size(F)
            if abs(F(i)-T)>param.eta*T
                result(a,b,i)=1;
            end
        end 
    end
    waitbar(a*b/all,fbar,[num2str(uint8(a*b/all*100)) '%']);
end
toc
close(fbar);
disp('signal detector done!');
        

    