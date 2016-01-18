

function[bgImgOut] = get_background_image(vidIn)

    nbFrames = get(vidIn,'NumberOfFrames');
    frameInds = linspace(1,nbFrames,100);
    
    bgImg = zeros([get(vidIn,'Height') get(vidIn,'Width') numel(frameInds)]);
    for ii=1:numel(frameInds)
        frameTemp = rgb2gray(read(vidIn,frameInds(ii)));
        bgImg(:,:,ii) = double(frameTemp);
    end
    bgImgOut = median(bgImg,3);
end