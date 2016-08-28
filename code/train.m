for i = 1:100
    data = mfcc_female{i};
    for j = 1:length(mfcc_female);
    dataEx = data(:,j);
    label = [
    NNtrain(dataEx,label);
    end
end

