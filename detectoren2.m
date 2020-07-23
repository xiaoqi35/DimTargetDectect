
function result=detectoren2(X,param)
disp('signal detector begin!');
tic
X=double(X);
[w,h,l]=size(X);
result=zeros(w,h,l);
n=param.r;
d=param.d;
ll=l;
step=param.Step;

all=w*h;
fbar=waitbar(0,'detector processing: 0');
digits(3)
for a=1:w
    for b=1:h
        l=ll-n-d;       
        X(a,b,:)=mapminmax(reshape(X(a,b,:),1,[]));
        F=zeros(l,1);
        Var1=var(X(a,b,:));
        for ii=1:param.gmax
            F=mapminmax(reshape(F,1,[]));
            for j=1:step:l
                sum1=0;
                for i=0:n-1
                    if ii==1
                        x=sort(X(a,b,i+j));
                        y=sort(X(a,b,i+d+j));
                        sum1=sum1+(x-y).*exp((x-y).^2/5);
                    else
                        sum1=sum1+(F(i+j)-F(i+d+j)).*exp((F(i+j)-F(i+d+j)).^2/5);
                    end
                end
                F(j)=sum1/n;
            end
            l=numel(F)-n-d;
            Var2=var(F);
            if abs(Var1/Var2)>=param.R
                break;
            end
            Var1=Var2;
        end
        tmp=sum(abs(F));
        T=tmp/numel(F);
        for i=1:numel(F)
            if abs(F(i)-T)>param.eta*T
                result(a,b,i)=1;
            end
        end  
    end
    waitbar(a*b/all,fbar,[num2str(uint8(a*b/all*100)) '%']);
end
%result=mat2gray(result);
toc
close(fbar);
disp('signal detector done!');
        

    
        

    