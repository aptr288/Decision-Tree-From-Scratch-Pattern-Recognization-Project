function [childR] = getRightChild(parent, array)
%GETRIGHTCHILD Summary of this function goes here
    for i = parent+2:size(array)
        if(array(i,3) == array(parent+1,3))
            childR = i;
            break;
        end
    end
           
end

