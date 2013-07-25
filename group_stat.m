function group_stat(group)
aptgrid = csvread('99_apts_lat_long.csv');

%% Print statistics for airport group

for i = 1:length(group(:,1))
    pairs = combnk(group(i,:), 2);
    
    for j = 1:length(pairs)
        distances(j) = dist_by_id(pairs(j,1), pairs(j,2), aptgrid);
    end
    
    meandist(i) = mean(distances(~isnan(distances)));
    lowdist(i) = min(distances);
    highdist(i) = max(distances);
    
end
tot = cat(1,min(lowdist),mean(meandist), max(highdist));

group

printmat(cat(2,cat(1,lowdist,meandist,highdist),tot),'Stats','Lo Mn Hi', '1 2 3 4 5 6 7 8 9 10 11 12 13 tot' )

    