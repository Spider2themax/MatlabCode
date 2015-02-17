function [pos, con1] = TestCommonNeighborAlg_v2()

% Make random positions of neurons.
%n = 6;
%pos = gridtop(n,n,n)';
%pos = rand(length(pos),3)*max(max(pos));
%N = size(pos,1);
%a = max(max(pos));
%D = CalculatePeriodicDistances(N, pos, a, 3);

% More realistic version...
L = 280;
pos = L*rand(900, 3);
%D = CalculatePeriodicDistances(900, pos, L, 3);

% Even MORE realistic...
pos = L*rand(900, 3);   
[Drand,inhibIndex, con1, con2]   = ConnectNeurons('/doesntmatter', pos, 1, linspace(1,900,900)', L, 3, 0);


% Get lazy ol' distant dependent con and see how it looks in different
% dimensions
for node = 3:10,
    %[con1,p,pr,pnr]=RP_AssembleNet(0, D, 900);
    disp('node....')
    node
    GetCIG(pos, con1, L, node, 1)
    GetCIG(pos, con1, L, node, 2)
    GetCIG(pos, con1, L, node, 3)
end