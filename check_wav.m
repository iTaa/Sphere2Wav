clear;
files = find_wav('.');
for fileIdx = 1:length(files)
    file = files(fileIdx,:);
    [y, fs, nbits] = audioread(file);
    if(fs~=16000)
        fprintf('%s: fs~=16000\n', file);
    end
    if(nbits ~= 16)
        fprintf('%s: nbits ~= 16\n', file);
    end
end