function d = dist_by_id(ID1,ID2, aptgrid)

% Given two indices and an associated lat/long grid in the 
% form ID LAT LONG, returns the haversine distance between the two points.
% Uses haversine.m

if ID1 == -1 || ID2 == -1
    d = NaN;
    return
end
lat = [aptgrid(aptgrid(:,1) == ID1, 2) aptgrid(aptgrid(:,1) == ID2, 2)];
long = [aptgrid(aptgrid(:,1) == ID1, 3),aptgrid(aptgrid(:,1) == ID2, 3)];

d = haversine(lat,long);

