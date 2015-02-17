function [conn, numNeurons] = plotFigure7_v2(conn, numNeurons)

if conn == 3,
    conn = 5;
elseif conn == 5,
    conn = 6;
elseif conn == 6,
    conn = 7;
elseif conn == 7,
    conn = 9;
else
    conn = 3;
    numNeurons = numNeurons + 1;
end