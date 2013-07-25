function d = grouper(vector, pergroup, pholder)

% GROUPER given a vector of size k, returns a randomized 
% matrix of size pergroup * n = k + m, with placeholder
% elements as necessary. 
%
% Scott Boone 6/17/2013


% Randomize vector

vector = randperm(length(vector));

% grab rectagle-able section of vector

width = floor(length(vector)/pergroup);

rect_vector = reshape(vector(1:width*pergroup), width, []);

% insert placeholders to remainder and concatenate

rest_vector = vector(width*pergroup + 1 : end);

rest_vector = cat(2,rest_vector, ...
    pholder*ones(1, pergroup - length(rest_vector)));

% return vector

d = cat(1, rect_vector, rest_vector)';
