function []=videoWriter(data,filename)
data=mat2gray(data);
v=VideoWriter(filename);
open(v);
for t=1:size(data,3)
    writeVideo(v,data(:,:,t));
end

close(v);
disp('video Writer done!');