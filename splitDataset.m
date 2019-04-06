%This function takes the dataset, split data point and the split column and divides the
%dataset based on the split point and split column and returns children datasets
%left and right.
function [LeftNodeData,RightNodeData] = splitDataset(data,splitDatapoint, SplitColumn)
LeftNodeData = [];
RightNodeData = [];
for i=1:size(data)
     if(le(data(i,SplitColumn),splitDatapoint))
            LeftNodeData = [LeftNodeData ;data(i,:)];
     else
         RightNodeData = [RightNodeData ; data(i,:)];
     end
end

end

