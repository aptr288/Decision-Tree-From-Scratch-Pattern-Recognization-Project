function [purity, C] = purityCheck(dataset)
%this function takes splited dataset as input and checks 
%if the labels are homogenous 

if(isempty(dataset))
    disp("work")
    purity = 1;
    C = [];
else
    [r,c] = size(dataset);
    label = dataset(:, c);
    C = unique(label);

    purity = 0;
    if(size(C) == 1)
        purity = 1;
    else
        purity = 0;
    end
end
end
    

