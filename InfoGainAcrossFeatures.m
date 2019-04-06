%This function takes our features list and labels as input and output as best feature and particular
%data point on which we get highest gain as output. In this function we calculate Information gain 
%on each feature and then return feature with highest gain among all these features.

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

