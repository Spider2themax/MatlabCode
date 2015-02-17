function distances = getDendriticTreeLength(Con, Dend)

distances = 0;
for i = 1:length(Con),
    for j = 1: length(Con),
        if Con(i,j) == 1,
            distances = distances + Dend(i,j);
        end
    end
end