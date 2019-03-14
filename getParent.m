function [parent] = getParent(tree)
%Get the parent id for the given array
    parent = zeros(1,size(tree,1));
    
    for i = 1:size(tree,1)
        if i == 1
            parent(i) = 0;
        else
            for j = 1:i-1
                k = i-j;
                if tree(k,3) == tree(i,3) - 1
                    parent(i) = k;
                    break;
                end
            end
        end
    
    end

end

