function result=detector_corr(X,param)
disp('signal detector begin!');
tic
X=double(X);
[w,h,l]=size(X);
r=param.r;
result=zeros(2*(w-1),2*(h-1),l-2*r-1);
all=w*h;
fbar=waitbar(0,'detector processing: 0');
digits(3)
for a=2:w-1
    for b=2:h-1
        for c=1:l-2*r-1
            tmp=corrcoef(X(a,b,c:c+r),X(a,b,c+r+1:c+2*r+1));
            result(2*a-1,2*b-1,c)=tmp(1,2);
            tmp=corrcoef(X(a,b,c:c+r),X(a,b+1,c+r+1:c+2*r+1));
            result(2*a-1,2*b,c)=tmp(1,2);
            tmp=corrcoef(X(a,b,c:c+r),X(a+1,b,c+r+1:c+2*r+1));
            result(2*a,2*b-1,c)=tmp(1,2);
            tmp=corrcoef(X(a,b,c:c+r),X(a+1,b+1,c+r+1:c+2*r+1));
            result(2*a,2*b,c)=tmp(1,2);
        end
    end
    waitbar(a*b/all,fbar,[num2str(uint8(a*b/all*100)) '%']);
end
toc
close(fbar);
disp('signal detector done!');

%%
aa=zeros(98,98,2939);
for i=1:98
    for j=1:98
        for t=1:2939
            aa(i,j,t)=max(max(mytest(2*i-1:2*i,2*j-1:2*j,t)));
        end
    end
end
bb=zeros(98,98);
for i=1:98
    for j=1:98
        [~,I]=max(squeeze(aa(i,j,:)));
        bb(i,j)=I;
    end
end
        

    