
%This function takes test set and tree structure as input and predicts the decisions and returns all the results.
function result_y = evaluation(test_data, splitconditions)
    
    index = 1;
    result_y = [];
    for i=1:size(test_data,1)
        pred =  Predict(test_data(i,:), splitconditions, index);
        result_y = [result_y ; pred];    
    end
end