
cd female;
files = dir('*.wav');
count = 1;
for file = files'
    if(mod(count,5)==4 || mod(count,5)==0)
        copyfile(file.name,'C:\Users\mithr_000\Documents\MATLAB\SpeakerRecogn\00GIT Files\mobioExtract\female1\test');
    else
        copyfile(file.name,'C:\Users\mithr_000\Documents\MATLAB\SpeakerRecogn\00GIT Files\mobioExtract\female1\train');
    end
    count = count + 1;
end
cd ..