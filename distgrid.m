function d = distgrid(aptgrid)

%%% DISTGRID generates a distance grid from an input matrix of the form 
%%% ID, LAT, LONG. uses dist_by_id()

d = zeros(length(aptgrid));

for i = 1:length(aptgrid)
    for j = 1:length(aptgrid)
        d(i,j) = dist_by_id(i,j,aptgrid);
    end
end

        
