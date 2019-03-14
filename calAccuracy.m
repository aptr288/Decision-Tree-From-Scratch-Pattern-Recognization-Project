function [accuracyPrecentage] = calAccuracy(label,expectedResult)

accuracy = sum(label == expectedResult)/numel(label);
accuracyPrecentage = 100*accuracy;
% tp = sum(label == expectedResult)
% fp = sum(label ~= expectedResult)

% adder = label + expectedResult;
% TP = length(find(adder == 2))
% TN = length(find(adder == 0))
% subtr = label - expectedResult;
% FP = length(find(subtr == -1));
% FN = length(find(subtr == 1));
% precision = TP/(TP + FP) 
end

