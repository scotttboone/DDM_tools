function d = min_group_stat(group)
aptgrid = csvread('99_apts_lat_long.csv');

%% retrun closes distance statistics for airport group

for i = 1:length(group(:,1))
    pairs = combnk(group(i,:), 2);
    
    for j = 1:length(pairs)
        distances(j) = dist_by_id(pairs(j,1), pairs(j,2), aptgrid);
    end
    
    lowdist(i) = min(distances);
    
end

d = min(lowdist);


    