%MONTE CARLO SIMULATION TO SEE HOW LIKELY DIFFERENT ONES ARE
clear
row = 13;

column = 8;

elements = 99;

product = row*column;

filler = ones(1,product-elements);

filler = -1.*filler;
max = 1000000;

for i = 1:5000
    
    array = 1:elements;

    array = cat(2, array, filler);

    array = array(randperm(product));

    array = reshape(array, row, column);

    sample(i) = min_group_stat(array);
    
    if sample(i) > max 
        max = sample(i);
        max_array = array;
    end
end

hist(sample(1,:));
figure(gcf);
save monte.mat
    
