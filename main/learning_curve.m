% [filename, pathname] = uigetfile('*.csv', 'Select a file');
% fullpath = fullfile(pathname, filename);
fullPath = 'C:\Users\jonah\VR-Golf-Data-Analyze\main\data\VR1_yasuji.csv';
[~, name, ext] = fileparts(fullPath);
fileName = [name ext];
data = readmatrix(fullPath);
is_VR = startsWith(fileName, 'VR');

test_0h = data(:,1);
practice_1 = data(:, [2,3,4,5]);
practice_2 = data(:, [6,7,8,9]);
test_6h = data(:,10);
test_24h = data(:,11);

if is_VR
    practice_1 = abs(practice_1);
    practice_2 = abs(practice_2);
end

practice_trials = 80;

y1 = reshape(practice_1, [practice_trials, 1]);
y2 = reshape(practice_2, [practice_trials, 1]);
x1 = 1:practice_trials;
x2 = 1:practice_trials;

% Remove outliers from VR data
if is_VR
    y1_outlier_indices = find(y1 < 1.0);
    y2_outlier_indices = find(y2 < 1.0);
    y1(y1_outlier_indices) = [];
    x1(y1_outlier_indices) = [];
    y2(y2_outlier_indices) = [];
    x2(y2_outlier_indices) = [];
end

light_gray = [.8 .8 .8];
dark_gray = [.3 .3 .3];

plotFigure('1st Practice Set', x1, y1, practice_trials, dark_gray, light_gray)
plotFigure('2nd Practice Set', x2, y2, practice_trials, dark_gray, light_gray)

function plotFigure(titleText, xs, ys, trials, dark_gray, light_gray)
    figure('Position', [1 1 900 500]);
    plotMarkerAndLine(xs, ys, dark_gray, dark_gray)
    drawAdditionalLines(trials, light_gray)
    box off
    title(titleText)
    addLabels
    addLimits
end

function plotMarkerAndLine(xs, ys, markerColor, lineColor)
    plot(xs, ys, 'o', MarkerSize=10, MarkerFaceColor=markerColor, MarkerEdgeColor='none')
    line(xs, ys, 'LineWidth', 1, 'Color', lineColor)
end


function drawAdditionalLines(n, lineColor)
    line([0, n], [2, 2], 'Color', lineColor)
    line([21, 21], [1, 3], 'Color', lineColor)
    line([41, 41], [1, 3], 'Color', lineColor)
    line([61, 61], [1, 3], 'Color', lineColor)
end

function addLabels()
    xlabel('Trials')
    ylabel('Distance(m)')
end

function addLimits()
    xlim([0, 80]);
    ylim([1.0, 3.0]);
end

