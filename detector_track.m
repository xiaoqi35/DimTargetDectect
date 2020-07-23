function [traimg,mark,coordinate]=detector_track(X,param)
% 初始化检测量并进行第一次检测，观察是否有符合条件的轨迹出现
disp('signal detector begin!');
tic
X=double(X);
[w,h,l]=size(X);
mark=zeros(w,h,l);
n=param.r;
d=param.d;
l=l-n*2-d;
step=param.Step;
all=w*h;
fbar=waitbar(0,'detector processing: 0');
digits(3)
F=zeros(w,h,l);

for a=1:w
    for b=1:h
        for j=1:step:l
            sum1=0;
            for i=1:n
                sum1=sum1+abs(X(a,b,i+j)-X(a,b,i+d+j)).*exp(abs(X(a,b,i+j)-X(a,b,i+d+j))/5);                       
            end
            F(a,b,j)=sum1/n;
        end
        T=mean(abs(F(a,b,:)));
        for i=1:size(F,3)
            if abs(F(a,b,i)-T)>param.eta*T
                mark(a,b,i)=1;
            end
        end 
        
    end
    waitbar(a*b/all,fbar,[num2str(uint8(a*b/all*100)) '%']);
end
toc
close(fbar);
disp('signal traimg done!');
[traimg,mark,coordinate]=track(F,mark,param);

%% function track and detect
function [traimg,mark,coordinate]=track(F,mark,param)
% 
coordinate=[0,0];
traimg=mat2gray(sum(mark(:,:,1:param.l),3));
if param.istrack
    param.count = param.count + 1;
    BW = edge(traimg,'canny');
    [H,T,R] = hough(BW);
    P  = houghpeaks(H,1);
    P=[P(1,:);P(1,:)];
    x = T(P(1,2)); y = R(P(1,1));x=x/180*pi;
    coordinate=[x, y];
    sumenergy=sum(sum(traimg));
    targetenergy=0;
    [w,h,~]=size(mark);
    targetnumb=0;
    for a=1:w
        for b=1:h
            if abs(a*cos(x)+b*sin(x)-y)<=0.1
                targetenergy=targetenergy+traimg(a,b);
                if traimg(a,b)~=0
                    targetnumb=targetnumb+1;
                end
            end
        end
    end
    r1=targetenergy/sumenergy;
    r2=targetnumb/(w*h);
    
    if r1/r2<param.T2 || param.count >= 6
        param.istrack=0;
    else
        param.eta=param.eta*param.drate;
        param.T2=param.T2^2;
        disp('track runned');
        
        for a=1:w
            for b=1:h
                if abs(a*cos(x)+b*sin(x)-y)<=0.1                 
                    for c=1:size(F,3)
                        T=mean(abs(F(a,b,:)));
                        if abs(F(a,b,c)-T)>param.eta*T
                            mark(a,b,c)=1;
                        end
                    end
                end
            end
        end
    end
    
   traimg=mat2gray(sum(mark(:,:,1:param.l),3));
   [~,mark,~]=track(F,mark,param); 
end





        

    