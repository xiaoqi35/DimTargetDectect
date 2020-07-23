function []=videoPlayer(filename)
vidObj=VideoReader(filename);
vidHeight=vidObj.Height;
vidWidth=vidObj.width;

s=struct('cdata',zeros(vidHeight,vidWidth,3,'uint8'),'colormap',[]);
k=1;
while hasFrame(vidObj)
    s(k).cdata=readFrame(vidObj);
    k=k+1;
end
%whos s
set(gcf,'position',[100 100 vidObj.Width+50 vidObj.Height+50]);
set(gca,'units','pixels');
set(gca,'position',[50 50 vidObj.Width+50 vidObj.Height+50]);
movie(s,1,vidObj.FrameRate);
