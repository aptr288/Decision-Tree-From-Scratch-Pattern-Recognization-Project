%Plotting the decision tree 
function plottingTree(parent, splitconditions)
treeplot(parent);
[x,y] = treelayout(parent);
for i=1:length(x)
    if splitconditions(i,2) == 0
        feature = strcat('Decision ',"  " ,num2str(splitconditions(i,1)));
    else 
        feature = strcat(num2str(splitconditions(i,1)),"   " , '<=', "  ",'Feature   ',"  ", num2str(splitconditions(i,2)));      
    end
    text(x(i),y(i),feature)
end
end

