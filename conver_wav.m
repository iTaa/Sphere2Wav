%SPHERE �ļ�ת��Ϊwav�ļ�
clear;
fs = 16000;
files = find_wav('/SPHERE_File_Path/');
for fileIdx = 1:length(files)  
    file = files(fileIdx,:);
    %file = strjust(file);
    file(isspace(file)) = [];
    fileID = fopen(file);
    
    %�ж��ļ�ͷ����ֹ�����
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
    audiowrite(file, allData(513:end)./32768, fs);    %SPHERE �ļ�ͷ1024�ֽ�    
end