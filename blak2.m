function out=blak2(in)
[w,h]=size(in);
out=zeros(w,h);
in=padarray(in,[1,1],0,'both');

for i=2:w-1
    for j=2:h-1
        if (in(i-1,j-1) + in(i-1,j) + in(i-1,j+1) + in(i,j-1) + in(i,j+1) + in(i+1,j-1) + in(i+1,j) + in(i+1,j+1))
            out(i-1,j-1)=in(i,j);
        end
    end
end
        