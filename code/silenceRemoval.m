function yEdited = silenceRemoval(y)
envelope = imdilate(abs(y), true(1501, 1));
quietParts = envelope < 0.02; 
yEdited = y;
yEdited(quietParts) = [];
end