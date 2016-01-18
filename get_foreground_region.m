

function[imgOut] = get_foreground_region(vidIn)

    imgTemp = double(rgb2gray(read(vidIn,1)));
    
    fig1 = figure;
    imshow(imgTemp,[]);
    [xPts, yPts] = getline(fig1);
    
    close(fig1);
    
    [xGrid,yGrid] = meshgrid(1:size(imgTemp,2),1:size(imgTemp,1));
    imgOut = inpolygon(xGrid,yGrid,xPts,yPts);
    
end