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

