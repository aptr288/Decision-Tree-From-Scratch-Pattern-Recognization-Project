function [GainMat, optimalDataPoint ] = Info_gain_Cal(data, label)
clc;
data = [36 34 10 8 1 70 41 38 45];
label =[1  0  1  0 0  1  0  1  1];
GainMat = [];
pos = 0; neg =0;
for l=1:size(label')
    if(label(l) == 0)
        pos = pos + 1;
    else
        neg = neg + 1;
    end
end

ParenntEntropy  = calculate_Entropy(pos, neg);
for i=1:size(data')
    p=0;n=0;q=0;r=0; 
    for j= 1:size(data')
        
        if(le(data(j),data(i)) && label(j) == 0)
            n = n+1;
        elseif(le(data(j),data(i)) && label(j) == 1)
            p = p+1;
        end
        if(~le(data(j),data(i)) && label(j) == 0)
            q = q+1;
        elseif(~le(data(j),data(i)) && label(j) == 1)
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
[val, idx] = max(GainMat);
optimalDataPoint = data(idx);
end
