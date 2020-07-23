function [data]=videoReader(filename)
vidObj=VideoReader(filename);
vidHeight=vidObj.Height;
vidWidth=vidObj.width;

s=struct('cdata',zeros(vidHeight,vidWidth,3,'uint8'),'colormap',[]);
k=1;
while hasFrame(vidObj)
    s(k).cdata=readFrame(vidObj);
    k=k+1;
end

%=================================== get array data==========
%data=zeros(vidHeight,vidWidth,3,k-1,'uint8');
data=zeros(vidHeight,vidWidth,k-1,'uint8');
for i=1:k-1
    %data(:,:,:,i)=s(i).cdata;
    data(:,:,i)=s(i).cdata;
    
end
%data=data(:,:,1,:);
%data=squeeze(data);
whos data
%======================================================
disp('videoReader done!');
            


