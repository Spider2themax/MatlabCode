function A = makeAshleyGrid(picture, pixelBoxSize)

A = imread(picture, 'png');
[l w] = size(A(:,:,1));
numStepsX = ceil(l/pixelBoxSize);
numStepsY = ceil(w/pixelBoxSize);
for i = 1:numStepsX-1,
    for j = 1:numStepsY-1,
        x = (i-1)*pixelBoxSize + 1;
        y = (j-1)*pixelBoxSize + 1;
        for k = 1:3,
            pixelArea = A(x:x+pixelBoxSize-1, y:y+pixelBoxSize-1, k);
            avg = reshape(pixelArea, pixelBoxSize*pixelBoxSize,1);
            A(x:x+pixelBoxSize-1, y:y+pixelBoxSize-1, k) = mode(double(avg));
        end
    end
end
% Clean up edges...
for i = x+1:l,
    for j = 1:y,
        for k = 1:3,
            A(i, j, k) = A(i-1,j,k);
        end
    end
end
for i = 1:x,
    for j = y+1:w,
        for k = 1:3,
            A(i, j, k) = A(i,j-1,k);
        end
    end
end
for i = x+1:l,
    for j = y+1:w,
        for k = 1:3,
            A(i, j, k) = A(i,j-1,k);
        end
    end
end
image(A)
pause(1)