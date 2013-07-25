function [out1 out2] = swap_i(in1, in2, i,j)

%%% Swap ith and jth element of two arrays. 

out1 = [in1(1:i-1) in2(j) in1(i+1:end)];
out2 = [in2(1:j-1) in1(i) in2(j+1:end)];