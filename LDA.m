clc;

%Have taken the dataset given in slieds as marices form
%c1 = [1 2 3 4 5;2 3  3 5 5];
%c2 = [1 2 3 3 5 6;0 1 1 2 3 5];

rply = load('riply_trn.mat');
ClassX = rply.X;
ClassY = rply.y;



ClassTran = transpose(ClassX); 
Class1 = [];
Class2 = [];
for i = 1: size(ClassTran)
    disp(i)
if(ClassY(i) == 1)
    Class1 = [Class1 ClassX(:, i)];
    disp(Class1);
else
     Class2 = [Class2 ClassX(:, i)];
end
end

disp(Class2)
c1x = Class1(1,:);
c1y = Class1(2,:);
c2x = Class2(1,:);
c2y = Class2(2,:);
plot(c1x,c1y,'*');hold on; % we use hold on retains the current plot and properties so that subsequent graphing commands add to the existing graph
plot(c2x,c2y,'*');hold on;

%Computing the mean for each class
%Arithmetic mean of class A 
mu1 = [mean(c1x) mean(c1y)];
%Arithmetic mean of class B 
mu2 = [mean(c2x) mean(c2y)];

disp('Calculated mean for both classes.');
disp('Mean of class 1');
disp(mu1);
disp('Mean of class 2');
disp(mu2);

%Computing the variances
S1= cov(Class1');
S2 = cov(Class2');
disp('Calculated variance for both classes.');
disp('Variance of class 1');
disp(S1);
disp('Variance of class 2');
disp(S2);

%Computing variance within class
Sw = S1 + S2;
disp('Computing within class variance');
disp(Sw);

disp('Computing the inverse of within class variance ');
invSw = inv(Sw);
disp(invSw);

% Calculating the optimal projection vector v
v = invSw * (mu1 - mu2)';
disp('Calculating optimal projection vector');
disp(v)
plotv(v);hold on; %plotting vectors as lines 

%Project all data points to vector v
Y1 = v' * Class1;
disp('Projection values of class1');
disp(Y1);


Y2 = v' * Class2;
disp('Projection values of class2');
disp(Y2);













