[fileName, pathName] = uigetfile('*.csv', 'Select a file');
fullPath = fullfile(pathName, fileName);
subjectName = extractAfter(fileName, '_');
subjectName = extractBefore(subjectName, '.');
data = readmatrix(fullPath);

test_0h = data(:,1);
test_6h = data(:,10);
test_24h = data(:,11);

abs0h = abs(test_0h);
abs6h = abs(test_6h);
abs24h = abs(test_24h);

sum0h = sum(abs0h);
sum6h = sum(abs6h);
sum24h = sum(abs24h);

maxScore = 7;
trials = 20;
possibleScore = maxScore * trials;

score0h = possibleScore - sum0h;
score6h = possibleScore - sum6h;
score24h = possibleScore - sum24h;

xs = categorical({'0h', '6h', '24h'});
xs = reordercats(xs, {'0h', '6h', '24h'});

% Colors
light_gray = [.8 .8 .8];
mid_gray = [.5 .5 .5];
dark_gray = [.2 .2 .2];

figure
ys = [score0h, score6h, score24h];
b = bar(xs, ys);
b.FaceColor = 'flat';
b.CData(1,:) = light_gray;
b.CData(2,:) = mid_gray;
b.CData(3,:) = dark_gray;
ylabel('Score')
ylim([0, possibleScore])
h = gca;
set(h, 'FontSize', 14)
xtips = b.XEndPoints;
ytips = b.YEndPoints;
labels = string(b.YData);
text(xtips, ytips, labels, ...
  'HorizontalAlignment', 'center', ...
  'VerticalAlignment', 'bottom')

saveFileName = strcat(subjectName, '_bar');
saveas(gcf, saveFileName, 'epsc')
