function [childL,childR] = getChild(parent, array)
%GETPARENT Summary of this function goes here
%   Detailed explanation goes here
    childL = parent+1;
    for i = parent+2:size(array)
        if(array(i,3) == array(childL,3))
            childR = i;
            break;
        end
    end
           
end
