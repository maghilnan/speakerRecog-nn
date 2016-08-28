clc;clear all;
load('mfcctest_female.mat');
%load('mfcc_male.mat')
fem_test = [];
%male_vec = [];
Sum = [];
len = [];
% tar_female = zeros(20,39540);
% tar_male = zeros(20,37540);

%%female data vectorization
for i = 1:40
    tempmfcc = mfcctest_female{i};
    n = mod(length(tempmfcc)-10,20);
    tempmfcc = tempmfcc(:,11:length(tempmfcc)-n);
    len = [len length(tempmfcc)]; 
        for j = 1:length(tempmfcc)/20
            temp = tempmfcc(:,(j-1)*20+1:(j-1)*20+20);

            fem_test = [fem_test temp];
        end        
end
for i = 0:2:38
      S = len(i+1)+len(i+2); %+len(i+3)+len(i+4)+len(i+5);
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
%     for j = n:1:m 
%     tar_female(i,j) = 1;
%     end
%     n = m+1;
%     m = m+Sum(i+1);
% end
% 
% %male data vectorization
% for i = 1:190
%     tempmfcc = mfcc_male{i};
%     n = mod(length(tempmfcc)-10,20);
%     tempmfcc = tempmfcc(:,11:length(tempmfcc)-n);
%     %len = [len length(tempmfcc)]; 
%         for j = 1:length(tempmfcc)/20
%             temp = tempmfcc(:,(j-1)*20+1:(j-1)*20+20);
%             male_vec = [male_vec temp];           
%         end        
% end