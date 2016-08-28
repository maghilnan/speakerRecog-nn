%this script is used to vectorize the mfcc's of the train data (only three samples)


clc;clear all;
load('mfcctrain_female.mat');
%load('mfcc_male.mat')
fem_vec = [];
%male_vec = [];
Sum = [];
len = [];
%tar_female = zeros(20,39540);
%tar_male = zeros(20,37540);

%%female data vectorization
for i = 1:60
    tempmfcc = mfcctrain_female{i};
    n = mod(length(tempmfcc)-10,1024);
    tempmfcc = tempmfcc(:,11:length(tempmfcc)-n);
    len = [len length(tempmfcc)]; 
        for j = 1:length(tempmfcc)/1024
            temp = tempmfcc(:,(j-1)*1024+1:(j-1)*1024+1024);

            fem_vec = [fem_vec temp];
        end        
end
for i = 0:3:57
      S = len(i+1)+len(i+2)+len(i+3);
      Sum = [Sum S];
end
n = 1;
m = Sum(1);
for i = 1:20
    for j = n:1:m 
    tar_female(i,j) = 1;
    end
    n = m+1;
    m = m+Sum(i+1);
end



% for i = 1:20
%     for j = 1:200
%     for k = 1:len(i)
%         
%     end
%         tar_female(i,j) = 1;
%     end
% end
% %male data vectorization
% for i = 1:190
%     tempmfcc = mfcc_male{i};
%     n = mod(length(tempmfcc)-10,20);
%     tempmfcc = tempmfcc(:,11:length(tempmfcc)-n);
%     len = [len length(tempmfcc)]; 
%         for j = 1:length(tempmfcc)/20
%             temp = tempmfcc(:,(j-1)*20+1:(j-1)*20+20);
%             male_vec = [male_vec temp];           
%         end        
% end