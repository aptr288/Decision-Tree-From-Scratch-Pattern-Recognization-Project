%This function takes our single feature and label as input and calculates on which 
%point we gethighest entropy among the data points and returns the gain and point
% at which we attained the highest gain.
function [highestGain, optimalDataPoint ] = InfoGainOnFeature(data, label)

maxelement = max(data);
minelement = min(data);
GainMat = [];
labelArray = unique(label);
m = size(labelArray)
    
    
pos = 0; neg =0; 
for l=1:size(label')
    if(label(l) == 0)
        pos = pos + 1;
    else
        neg = neg + 1;
    end
end

ParenntEntropy  = calculate_Entropy(pos, neg);
for i=minelement:maxelement
    p=0;n=0;q=0;r=0; 
    for j= 1:size(data')
        
        if(le(data(j),i) && label(j) == 0)
            n = n+1;
        elseif(le(data(j),i) && label(j) == 1)
            p = p+1;
        end
        if(~le(data(j),i) && label(j) == 0)
            q = q+1;
        elseif(~le(data(j),i) && label(j) == 1)
            r = r+1;
        end
    end
   
    leftEntropy = calculate_Entropy(p, n);
    rightEntropy = calculate_Entropy(q, r);
     leftEntropy(isnan(leftEntropy)) = 0;
     rightEntropy(isnan(rightEntropy)) = 0;
     gain = ParenntEntropy - (((p+n)/(p+n+q+r))*leftEntropy + ((q+r)/(p+n+q+r))*rightEntropy);
     
     GainMat = [GainMat gain];    
end
[highestGain, idx] = max(GainMat);
a = (minelement:maxelement);
optimalDataPoint = a(idx);
end
