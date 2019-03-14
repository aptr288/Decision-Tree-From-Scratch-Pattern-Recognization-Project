function decision = Predict(example, tree, index) 

	%If this is a final node in the tree, simply return the outcome value sotred in tree{2}
    if tree(index,2) == 0
        decision = tree(index,1);
    else
        if example(tree(index,2)) <= tree(index,1)
            childL = getLeftChild(index);
            decision = Predict(example, tree, childL);
        else
            childR = getRightChild(index,tree);
            decision = Predict(example, tree, childR);
        end
    end
end

