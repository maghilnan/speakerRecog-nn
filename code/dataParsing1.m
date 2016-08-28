cd female
files = dir('*.wav');
mfcc = [];
i = 1;
for file = files'
    audata = audioread(file.name);
    mfcc_female{i} = melfcc(audata);
    i = i + 1;
end
cd ..
cd male
i = 1;
files = dir('*.wav');
mfcc = [];
i = 1;
for file = files'
    audata = audioread(file.name);
    mfcc_male{i} = melfcc(audata);
    i = i + 1;
end