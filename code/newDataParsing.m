%I have to write code to use only three sample data and test with new test data

clc;clear all;

cd female
files = dir('*.wav');
% mfcc = [];
% mfcc_female = [];
% mfcc_male = [];
k = 1; 
j =1;
%for file = files'
for i = 1:100
if (mod(i,5) == 1 || mod(i,5) == 2 || mod(i,5) == 3)    
    audata = audioread(files(i).name);
    aud = silenceRemoval(audata);
    %data_female{j} = aud;
    mfcctrain_female{j} = melfcc(aud,16000);
    j = j+1;
end
if (mod(i,5) == 4 || mod(i,5) == 0)    
    audata = audioread(files(i).name);
    aud = silenceRemoval(audata);
    %data_female{k} = aud;
    mfcctest_female{k} = melfcc(aud,16000);
    k = k+1;
end
end
cd ..
% cd male
% i = 1;
% files = dir('*.wav');
% mfcc = [];
% i = 1;
% for file = files'
%     audata = audioread(file.name);
%     aud = silenceRemoval(audata);
%     mfcc_male{i} = mfcc(aud,16000);
%     code_male{i} = vqlbg(mfcc_male{i},16);
%     i = i + 1;
% end