cd ..;
cd dataset/female/train;

files = dir('*.wav');
count = 1;
index = 1;
temp = [];

for file = files'
    [audata fs] = audioread(file.name);
    mfcc = melfcc(audata,fs);
    temp = [temp mfcc]; %mfcc is dumped into one 'temp' variable'
    count = count + 1;
    if(mod(count,3)==0)
        agg_mfcc{index} = temp; %agg_mfcc is aggregated mfcc
        temp = [];
        index = index + 1;
    end
end
for i = 1:length(agg_mfcc)
    agg_mfcc{i}(isnan(agg_mfcc{i})) = [];
end

for i = 1:length(agg_mfcc)
    len = length(agg_mfcc{i});
    factor = floor(len/2080);
    for j = 1:factor
        l = 2080*j-2079;
        u = 2080*j;
        tempp = agg_mfcc{1,i}(1,l:u);
        encodeIn{i}(j,1:2080) = tempp;
    end
end
    
    
    
cd ..;cd ..;cd ..;
cd code;