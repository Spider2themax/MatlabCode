function neuronMovie = makeNeuronMovie(f)

% Prepare the new file.
vidObj = VideoWriter('neuronmovie.avi');
vidObj.FrameRate = 10;
open(vidObj);

% Create an animation.
for k = 1:length(f), 
   % Write each frame to the file.
   currFrame = f(k);
   writeVideo(vidObj,currFrame);
end

% Close the file.
close(vidObj);