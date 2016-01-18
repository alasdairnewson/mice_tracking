

close all;
clear all;
restoredefaultpath;

fileName = 'Mice_1';
fileIn = [fileName '.mp4'];
vidIn = VideoReader(fileIn);

nbFrames = get(vidIn,'NumberOfFrames');
frameInds = round(linspace(1,nbFrames,300));
fgThresh = 50;
minInds = 500;

bgImg = get_background_image(vidIn);

if (~exist('Output','dir'))
    mkdir('Output');
end

%define region where the animal can be found
if (exist([fileName '_foreground_region.mat'],'file'))
    load([fileName '_foreground_region.mat']);
else
    fgRegion = get_foreground_region(vidIn);
    save([fileIn '_foreground_region.mat'],'fgRegion');
end

for ii=1:1:numel(frameInds)
    frameTemp = double(rgb2gray(read(vidIn,frameInds(ii))));
    fgImg = abs(frameTemp - bgImg)>fgThresh;
    fgImg = fgImg & fgRegion;
    
    %get the largest background region
    bwConn = bwconncomp(fgImg);
    %find largest background component
    fgPixInds = [];
    for jj=1:bwConn.NumObjects
        if ( length(bwConn.PixelIdxList{jj})>minInds )
            fgPixInds = [bwConn.PixelIdxList{jj};fgPixInds];
        end
    end
    
    fgImg = zeros(size(fgImg));
    fgImg(fgPixInds) = 1;
    imwrite(repmat(255*double(fgImg),[1 1 3]),['Output/' fileName '_foreground_frame_' sprintf('%05d',frameInds(ii)) '.png']);
    imwrite(read(vidIn,frameInds(ii)),['Output/' fileName '_input_frame_' sprintf('%05d',frameInds(ii)) '.png']);
end



