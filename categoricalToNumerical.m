function [features, label ] = categoricalToNumerical(data)
data = readtable('BreastCancer.csv');
[r,c] = size(data);
A = table2array(data(:,c));
B = categorical(A);
label = grp2idx(B);
label = vec2mat(label,1);
for c =1:size(label)
    if label(c) == 2 
        label(c) = 0;
    end 
end 

features = [];
for m =1:(size(data,2)-1)
    A = table2array(data(:,m));
    B = categorical(A);
    n = grp2idx(B);
    n = vec2mat(n,1);
    features = [features n];
end 

