

files = dir('*.wav');
mfcc = [];
i = 1;
for file = files'
    audata = audioread(file.name);
    aud = silenceRemoval(audata);
    mfcc_female{i} = melfcc(aud);
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
    aud = silenceRemoval(audata);
    mfcc_male{i} = melfcc(aud);
    i = i + 1;
end