function [distCrys, distRan] = neuronalDistance(cp, rp, dim)

N = dim*dim*dim;
distCrys = calculateDendrites(N, cp);
distRan = calculateDendrites(N, rp);