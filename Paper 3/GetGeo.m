function [save] = GetGeo(directory_name, num)



%% Load the files in the directory to get neural distributions.
files = dir(directory_name);
fileIndex = find(~[files.isdir]);
count = 0;

for i = 1:length(fileIndex)
    
    fileName = files(fileIndex(i)).name;
    
    if length(fileName) > 16,
        
        if strcmp(fileName(1:17),'neuBlockwithColID'),
            
            count = count + 1;
            
                    
            if count == num,
            
                save = fileName;
            
            end
            
        end
        
    end
end