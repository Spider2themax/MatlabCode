function [apples] = HowManyApples()

%{

    You have been given the task of transporting 3000 apples 1000 miles from Appleland to Bananaville. 
    Your truck can carry 1000 apples at a time. Every time you travel a mile towards Bananaville you 
    must pay a tax of 1 apple, but you pay nothing when going in the other direction (towards Appleland). 
    What is the highest number of apples you can get to Bananaville?

%}

hold on % For plot
apples = 3000;  % Initial apples
pos = 0; % Current position

while apples > 1000,  % For the first part, take the entire load 1 space forward until you have only 1000 apples
    
    pos = pos + 1;
    
    apples = apples - 3;
    
    plot(pos, apples, 's')
    
end

while pos < 1000,  % After having 1000 apples, drive the rest of the way to Bananaland
    
    pos = pos + 1;
    
    apples = apples - 1;
    
end