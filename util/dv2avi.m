function data=dv2avi(filename)

f=fopen(filename,'rb');
head=fread(f,[1,256],'uint8');
data=zeros(640,512,600);
for i=1:200
    skip=fread(f,[1,64],'uint8');
    skip=fread(f,[640,512],'uint16','b');
end
for i=1:600
    skip=fread(f,[1,64],'uint8');
    data(:,:,i)=fread(f,[640,512],'uint16','b');
    
end
fclose(f);
clear skip
data=data(:,300:end,:);
videoWriter(data,'fj1.avi');
videoPlayer('fj1.avi');
