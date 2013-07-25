function [row1 row2] = improverows(r1, r2, grid)

%% Given a pair of rows, improve their distribution as much as possible. 

row1 = grid(r1, :);
row2 = grid(r2, :);


close_dist = min_group_stat(grid);

for i = 1:numel(row1)
    for j = 1:numel(row2)
        [row1a row2a] = swap_i(row1, row2, i, j);
        newgrid = [grid(1:r1-1, :); row1a; grid(r1+1:end, :)];
        newergrid = [newgrid(1:r2-1, :); row2a; newgrid(r2+1:end, :)];
        test_dist = min_group_stat(newergrid);
        if test_dist > close_dist;
            disp(close_dist)
            disp(' to ')
            disp(test_dist)
            grid
            newgrid
            newergrid
            close_dist = test_dist
            row1 = row1a;
            row2 = row2a;
        end
    end
end



