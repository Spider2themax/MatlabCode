function [] = makeAshMovie(f)

% Prepare the new file.
vidObj = VideoWriter('ashmovie.avi');
vidObj.FrameRate = 0.5;
open(vidObj);

% Create an animation.
for k = 1:length(f), 
   % Write each frame to the file.
   currFrame = f(k);
   writeVideo(vidObj,currFrame);
end

% Close the file.
close(vidObj);