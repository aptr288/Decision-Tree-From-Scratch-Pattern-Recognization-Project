function [splitDatapoint,SplitColumn] = InfoGainAcrossFeatures(features,label)
GainMat = [];
optimalData = [];
% features = table2array(features);
% label = table2array(label);



for l =1:size(features,2)
 
 
 [highestGain, optimalDataPoint ] = InfoGainOnFeature(features(:, l )', label');
 GainMat = [GainMat highestGain ];
 optimalData = [optimalData optimalDataPoint];
end

[GainAcross, SplitColumn] = max(GainMat);

splitDatapoint = optimalData(SplitColumn);

end

