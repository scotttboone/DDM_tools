%% Generate groups of airports falling a certain threshold distance apart
clear all;
%% Input matrix of airports [ID LAT LONG]

apts = csvread('99_apts_lat_long.csv');

%% Input Minimum Distance in meters

minDist = 400000;

%% split airports into groups (source, pergroup, placeholder)
pergroup = 8;
og_pergroup = pergroup;

% phold = -1;
% aptsvect = grouper(apts(:,1), pergroup, phold)

%% Build a group

for tries = 1:2
    disp('ATTEMPT #:');
    disp(tries);

    used = 1:length(apts);
    failcount = 0;
    y = 1;

    biggroup = [];

    while (y < 14) && (failcount < 10)

        if y>11
            pergroup = 6;
        end

        [group, used, success] = buildagroup(pergroup,minDist,used,apts);
        if success == 1
            while numel(group) < 8
                group = [group -1];
            end
            biggroup = cat(1, biggroup, group);
            y = y + 1;
            failcount = 0;
        else
            failcount = failcount + 1;
        end



    end

    if nnz(used) > 0
        disp('FAILURE');
        %map_by_ID(used(find(used)));
        disp(biggroup);
        disp('unused elements:');
        unused = (used(used > 0));
        disp(unused)
        disp('----------------------------------------------')
    else
        
        disp('SUCCESS');
        group_stat(biggroup);
        disp('----------------------------------------------')
    end
    
    clear y failcount biggroup group used;
    pergroup = og_pergroup;

end
    






