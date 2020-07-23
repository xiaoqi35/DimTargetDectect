function img=blak(in,T)
[h,w]=size(in);
img=zeros(h,w);
for i=2:h-1
    for j=2:w-1
        if in(i,j)+in(i+1,j)>T || in(i,j) +in(i+1,j+1)>T || in(i,j)+in(i,j+1)>T || in(i,j)+in(i+1,j-1)>T
            img(i,j)=1;
        else
            img(i,j)=0;
        end
    end
end
