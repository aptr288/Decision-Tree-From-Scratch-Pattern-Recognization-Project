function [splitconditions ] = decisionNodeSplit(data, splitconditions, counter)
[r,c] = size(data);
features = data(:,1:c-1);
label = data(:,c);
pure = 1;

while(pure == 1)
    counter = counter + 1;
    [splitDatapoint,SplitColumn] = InfoGainAcrossFeatures(features,label);
    
    splitconditions = [splitconditions; [splitDatapoint SplitColumn counter]];
    
    [LeftNodeData,RightNodeData] = splitDataset(data,splitDatapoint, SplitColumn);
    
    [checkLeft, c1] = purityCheck(LeftNodeData);
    [checkRight, c2] = purityCheck(RightNodeData);
    

    if(checkLeft == 1)
        counterL = counter + 1;
    end
    
    if(checkRight == 1)
        counterR = counter + 1;
    end
    
    if(checkLeft == 0)
        splitconditions = decisionNodeSplit(LeftNodeData,splitconditions,counter);
    else
        splitconditions = [splitconditions; [c1 0 counterL]]; 
    end
    
    if(checkRight == 0)
        splitconditions = decisionNodeSplit(RightNodeData, splitconditions, counter);
    else
        splitconditions = [splitconditions; [c2 0 counterR]]; 
    end
      
    pure = 0;
end
end

