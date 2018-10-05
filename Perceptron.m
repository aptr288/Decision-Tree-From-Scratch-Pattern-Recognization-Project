% Input data 
Data = [ -3 -2 3 2 2 1 -2 -1 -3 -4; -4 -3  -4 -3 1 2 3 2 4 -2];
InputData = transpose(Data); 
disp(Data);
disp(InputData);
%Defining the Target vector
Desired_out=[1,1,1,1,1,0,0,0,0,0];
%Calling the PerceptronModel function
PercepFunc(InputData,Desired_out)

function [ UpdatedWeight, UpdatedBias ] = PercepFunc( Data,Desired_out )

%initializing the random weights and bias
Weights = [.5 .5];
Bias = 1;
disp(size(Data,1));
%epochs or iterations will allow the perceptron to correct its weights for
%each iteration by updating the weights and bias according to error. 
epochs = 100;
for j = 1: epochs
    for i = 1:size(Data,1)
         Yi = Weights * transpose([Data(i,1), Data(i,2)]) + Bias;
         % f(x) => 1 if W.X+b >= 0  OR f(x) =>  0  otherwise
         if(Yi >= 0)
             Fx = 1;
         else 
             Fx = 0;
         end
    
%Checking whether the resulting value is equal to predicted value
         if(Fx ~= Desired_out(1,i))
        
%Calculating error with respect to target value 
              Delta = Desired_out(1,i) - Fx; 
 %Updating weights and biases based on error 
              Weights = Weights + Delta*[Data(i,1), Data(i,2)];
              Bias = Bias + Delta;
         end
    end
    UpdatedWeight = Weights;
    UpdatedBias = Bias;
end    




%Plotting the input and target value
    plotpv(transpose(Data),Desired_out);hold on; %Plotpv is used to plot perceptron input/target vectors
   
%Plotting the hyper plane 
    plotpc(UpdatedWeight,UpdatedBias);%Plotpc => plot classification line on perceptron vector plot
    hold off

end

