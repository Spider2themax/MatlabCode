function [] = plotSpike(pos, pot)

if pot > 0,
    plot3(pos(1), pos(2), pos(3), 'dr','MarkerSize', pot)
else
    plot3(pos(1), pos(2), pos(3), 'dg','MarkerSize', -pot/5)
end