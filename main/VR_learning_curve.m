% [filename, pathname] = uigetfile('*.csv', 'Select a file');
% fullpath = fullfile(pathname, filename);
fullpath = 'C:\Users\jonah\VR-Golf-Data-Analyze\main\data\yasuji\1.csv';
data = readmatrix(fullpath);

ys = abs(data(:,2));
filtered_ys = ys(ys > 1.0);
data_len = length(filtered_ys);
xs = 1:data_len;

light_gray = [.8 .8 .8];
dark_gray = [.3 .3 .3];

figure('Position', [1 1 900 500]);
plot(xs, filtered_ys, 'o', MarkerFaceColor=dark_gray, MarkerEdgeColor='none')
line(xs, filtered_ys, 'Color', dark_gray)
line([0, data_len], [2, 2], 'Color', light_gray)
line([21, 21], [1, 3], 'Color', light_gray)
line([41, 41], [1, 3], 'Color', light_gray)
line([61, 61], [1, 3], 'Color', light_gray)

box off

xlabel('Trials')
ylabel('Distance(m)')
ylim([1.0, 3.0]);
