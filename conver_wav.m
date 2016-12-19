%SPHERE 文件转换为wav文件
clear;
fs = 16000;
files = find_wav('/SPHERE_File_Path/');
for fileIdx = 1:length(files)  
    file = files(fileIdx,:);
    %file = strjust(file);
    file(isspace(file)) = [];
    fileID = fopen(file);
    
    %判断文件头，防止误操作
    head = fread(fileID, 1024, 'char*1'); 
    headStr = sprintf('%s',head(1:7));
    if(~strcmp(headStr,'NIST_1A'))
        fclose(fileID);
        continue;
    end    
    frewind(fileID);
    
    allData = fread(fileID, inf, 'short');
    fclose(fileID);
    delete(file);
    audiowrite(file, allData(513:end)./32768, fs);    %SPHERE 文件头1024字节    
end