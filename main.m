clc;
[~,~,data1] = xlsread('Data.csv');
%disp("Traindata")
data = cell2mat(data1(2:end,:));
[~,~,data2] = xlsread('BCtest.csv');
test_data = cell2mat(data2(2:end,:));

BCdata = readtable('BreastCancer.csv');
%A = table2array(BCdata)
[features, label ] = categoricalToNumerical(BCdata);
numBCdata = [features label ];
[r,c] = size(numBCdata);
crossValidataion_percent = 30;
%crossValidataion percent of data will be used as test data
numTestItems = round(r*crossValidataion_percent/100);   
numTrainingItems = r - numTestItems;
%randomly select test data from full data
testDataIndices = randperm(r, numTestItems)';         
testData = numBCdata(testDataIndices,:);

splitconditions = [];
counter = 0;
type = [];
[splitconditions] = decisionNodeSplit(data, splitconditions, counter);
disp("Tree structure")
disp(splitconditions);
[r,c] = size(testData);
featuresTest = testData(:,1:c-1);
%disp("Expected results")
labelTest = testData(:,c);
result_y = evaluation(testData, splitconditions);
%disp("Predicted results ")
diplayresult = ["Labels" "Results"];
diplayresult = [diplayresult; [labelTest result_y]]
[outputArg1] = calAccuracy(labelTest,result_y)
stats = confusionmatStats(result_y,labelTest);
disp("Accuracy");
disp(mean(stats.accuracy));
disp("Precision");
disp(mean(stats.precision));
parent = getParent(splitconditions);
plottingTree(parent, splitconditions)
% view(splitconditions(1,:),'Mode','Graph','Prune',2)