function [] = usVideo(picture, tempname)

pixelBoxSizes = [200; 175; 150; 100; 75; 50; 40; 30; 25; 20; 15; 12; 10; 5];
set(gca,'nextplot','replacechildren');
counter = 1;
for i = 1:length(pixelBoxSizes),
    usMovieImages{i} = makeAshleyGrid(picture, pixelBoxSizes(i));
    F(counter) = getframe(gcf);
    counter = counter + 1;
    clf
end
makeAshMovie(F)