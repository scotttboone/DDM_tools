function map_by_ID(IDS)%, aptgrid)

%%% Maps a plot of functions by ID, given 
%%% a grid in the form ID, LAT, LONG

%IDS =     [64    49    27     3    16    22    77    40; ...
% 82    97    66    53    20    15    41     2%; ...
 %       88     1    42    57    35    60    69    94%; ...
  %      91    89    83    85    37    81    38     5%; ...
  IDS = [  52    86    43    21    59    95    17    32]%; ...
%     33    74    54    44    98    46    72    45; ...
%     67    79    30    92    48    11    25    76; ...
%     87    71    39    75    61    55    36    51; ...
%      6     9    28    18    26    34    78    93; ...
%     50    31    96    24    19    70     4    80; ...
%     13    62    23     7    56    63    47    12; ...
%     90    65    99    58    68    73    -1    -1; ...
%     84    29    10    14     8    -1    -1    -1;];


aptgrid = csvread('99_apts_lat_long.csv');

arraysize = size(IDS);
color = [0 0 1; 0 1 0; 1 0 0; 0 1 1; 1 0 1; 1 1 0; .5 0 0; 0 .5 0; 0 0 0; ...
    0 .5 .5; .5 .5 0; .5 0 .5; .5 .5 .5;];



figure('Color', [1 1 1]); 
ax = usamap('CONUS');
states = shaperead('usastatelo', 'UseGeoCoords', true);
stateColor = [1 1 1];
indexConus = 1:numel(states);
geoshow(ax(1), states(indexConus),  'FaceColor', stateColor)

latlim = [20 50];
longlim = [-75 -130];

for i = 1:arraysize(1)
    IDS_row = IDS(i,:);
    IDS_row = IDS_row(IDS_row > 0);
    latlong = [aptgrid(IDS_row(:), 2) aptgrid(IDS_row(:),3)];
    [vor_v vor_c] =voronoin([latlong(:,1) latlong(:,2)]);

    
    
%     for j = 1:arraysize(2)
%         textm(latlong(j,1), latlong(j,2), num2str(i), 'FontWeight', 'bold',...
%             'FontUnits', 'normalized', 'FontSize', .025);
%     end
    plotm(latlong, 'o', 'MarkerSize',6, 'MarkerEdgeColor',color(i ,:)./2,'MarkerFaceColor', color(3,:))
 
end


