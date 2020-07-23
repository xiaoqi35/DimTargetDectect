function result=kernel(X,param)
l=param.W;
d=param.d;

w=param.L-param.W*2;
F=zeros(w,1);
for j=1:param.Step:w
    sum=0;
    for i=1:l
        sum=sum+abs(X(i+j)-X(i+d+j)).*exp(abs(X(i+j)-X(i+d+j))/5);
        %sum=sum+dot(X(i+j),X(i+d+j));
    end
    F(j)=sum/l;
end
T=mean(abs(F));
MAX=max(X);
result=zeros(w,1);
for i=1:size(F)
    if abs(F(i)-T)>param.eta*T
        result(i+l)=MAX;
    end
end
        

    