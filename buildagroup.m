function [ array, used, success ] = buildagroup( groupsize, mindist, used, aptgrid )

%%% BUILDAGROUP by size of group, minimum distance apart, used indices,
%%% and a index grid in the form ID LAT LONG.
%%% Elements of USED must be equivalent to their index. 
% 
%  used = 1:99;
% %used = 1:10;
% %aptgrid = [1,35.1797700000000,-106.754500000000;2,42.9023000000000,-73.9169500000000;3,33.5720200000000,-84.3179200000000;4,30.1054400000000,-97.5578100000000;5,42.0237500000000,-72.8660800000000;6,35.4091600000000,-118.936700000000;7,33.4959400000000,-86.6809500000000;8,36.1129800000000,-86.7160000000000;9,43.5757900000000,-116.179700000000;10,42.2947200000000,-70.9393000000000;];
%  aptgrid = csvread('99_apts_lat_long.csv');
%  groupsize = 8;
%  mindist = 1000000;

success = 1;
used_backup = used;

%% Check to see how many unused elements are remaining

if nnz(used) < groupsize
    groupsize = nnz(used);
end

%% Grab a random unused element from zone 1, if available. 
  avail = used(used > 0);
  
  if ~isempty(avail(aptgrid(avail,4) == 1))
      avail = avail(aptgrid(avail,4) == 1);
  end  

  element = avail(randi(numel(avail),1));

  %% initialize group array
    groupArray = element; 

    used(element) = 0; 


for x = 2:groupsize

    % find unused elements meeting minimum distance requirements. 
    
    dgrid = distgrid(aptgrid);
    dgrid(used == 0, used == 0) = 0;
    dgrid(dgrid(:) < mindist) = 0;
    dgrid = dgrid > 0;

    % Select one at random from group, if available. 
    avail = used(sum(dgrid(groupArray, :),1) == numel(groupArray));
    
    if ~isempty(avail(aptgrid(avail,4)==x))
      avail = avail(aptgrid(avail,4) == x);
    end  
    
    % prioritize from trouble zones?
    
    
    % NEED TO TEST FOR SUCCESS HERE
    if isempty(avail) 
        success = 0;
        used = used_backup;
        array = zeros(groupsize);
        return ;
    end

    element = avail(randi(numel(avail),1));

    % add it to the array

    groupArray = cat(2, element, groupArray);

    used(element) = 0; 

end
array = groupArray;
return;









