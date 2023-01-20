[fileName, pathName] = uigetfile('*.csv', 'Select a file');
fullPath = fullfile(pathName, fileName);
% fullPath = 'C:\Users\jonah\VR-Golf-Data-Analyze\main\data\Real_yoshimi.csv';
% [~, name, ext] = fileparts(fullPath);
% fileName = [name ext];
subjectName = extractAfter(fileName, '_');
subjectName = extractBefore(subjectName, '.');
data = readmatrix(fullPath);
shouldCompress = true;
is_VR = startsWith(fileName, 'VR');

practice_1 = data(:, [2,3,4,5]);
practice_2 = data(:, [6,7,8,9]);
test_0h = data(:,1);
test_6h = data(:,10);
test_24h = data(:,11);
xs_test = 1:20;

if is_VR
    practice_1 = abs(practice_1);
    practice_2 = abs(practice_2);
end

if shouldCompress && is_VR
    practice_1 = arrayfun(@(x) compress(x), practice_1);
    practice_2 = arrayfun(@(x) compress(x), practice_2);
    is_VR = false;
end

practice_trials = 80;
set_trials = 20;

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

% Colors
light_gray = [.8 .8 .8];
dark_gray = [.3 .3 .3];

% Plot practices
plotFigure('1st Practice Session (4 Sets of 20 Trials)', subjectName, ...
    x1, y1, practice_trials, dark_gray, light_gray, is_VR, false)
plotFigure('2nd Practice Session (4 Sets of 20 Trials)', subjectName, ...
    x2, y2, practice_trials, dark_gray, light_gray, is_VR, false)

% Plot tests
plotFigure('0h Test', subjectName, ...
    xs_test, test_0h, set_trials, dark_gray, light_gray, false, true)
plotFigure('6h Test', subjectName, ...
    xs_test, test_6h, set_trials, dark_gray, light_gray, false, true)
plotFigure('24h Test', subjectName, ...
    xs_test, test_24h, set_trials, dark_gray, light_gray, false, true)

function plotFigure(titleText, subjectName, xs, ys, trials, ...
    dark_gray, light_gray, is_VR, is_Test)
    figure('Position', [1 1 900 500]);
    plotMarkerAndLine(xs, ys, dark_gray, dark_gray)
    drawAdditionalLines(trials, light_gray, is_VR)
    box off
    title(titleText)
    addLabels(is_VR)
    addLimits(is_VR, is_Test)
    h = gca;
    set(h, 'FontSize', 20)
    timeInfo = extractBefore(titleText, ' ');
    saveFileName = strcat(subjectName, '_practice_', timeInfo);
    if is_Test
        saveFileName = strcat(subjectName, '_test_', timeInfo);
    end
    saveas(gcf, saveFileName, 'epsc')
end

function plotMarkerAndLine(xs, ys, markerColor, lineColor)
    plot(xs, ys, 'o', MarkerSize=10, MarkerFaceColor=markerColor, MarkerEdgeColor='none')
    line(xs, ys, 'LineWidth', 1, 'Color', lineColor)
end


function drawAdditionalLines(n, lineColor, is_VR)
    middleLine = [0, 0];
    setDivideLine = [-8, 8];
    if is_VR
        middleLine = [2, 2];
        setDivideLine = [1, 3];
    end

    line([0, n], middleLine, 'Color', lineColor)
    line([21, 21], setDivideLine, 'Color', lineColor)
    line([41, 41], setDivideLine, 'Color', lineColor)
    line([61, 61], setDivideLine, 'Color', lineColor)
end

function addLabels(is_VR)
    if is_VR
        xlabel('Trials')
        ylabel('Distance(m)')
    else
        xlabel('Trials')
        ylabel('Distance(score)')
    end

end

function addLimits(is_VR, is_Test)
    if is_VR
        xlim([0, 80]);
        ylim([1.0, 3.0]);
    elseif is_Test
        xlim([0, 20]);
        ylim([-8, 8]);
    else
        xlim([0, 80]);
        ylim([-8, 8]);
    end
end

function y = compress(x)
    sign = 1;
    if x - 2.0 < 0
        sign = -1;
    end
    diff = abs(2.0 - x);
    if diff <= 0.05
        y = 7 * sign;
    elseif diff <= 0.10
        y = 6 * sign;
    elseif diff <= 0.15
        y = 5 * sign;
    elseif diff <= 0.25
        y = 4 * sign;
    elseif diff <= 0.375
        y = 3 * sign;
    elseif diff <= 0.5
        y = 2 * sign;
    elseif diff <= 0.625
        y = 1 * sign;
    else
        y = 0;
    end
end
