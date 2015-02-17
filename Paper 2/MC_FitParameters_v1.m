function [xSave, Emin] = MC_FitParameters_v1(S)

tries = 10;
Emin = 10000;
xSave = 0;
for i = 1:tries,
    [x, E] = MC_FitParameters(S);
    if E < Emin,
        Emin = E;
        xSave = x;
    end
end