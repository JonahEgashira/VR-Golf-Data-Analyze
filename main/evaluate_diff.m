load('scores.mat');
data = readmatrix('./data/VR-Real-Test.csv');

VR = data(1:trial_number, 1:1);
REAL = data(1:trial_number, 2:2);

diff = abs(VR - REAL);
diff_percentage = diff / 200 * 100;
diff_mean = mean(diff_percentage);

x = 1:trial_number;

figure
plot(x, VR, '-o', ...
    'MarkerSize', 12, ...
    'MarkerFaceColor', dark_gray, ...
    'MarkerEdgeColor', white, ...
    'Color', dark_gray)

hold on

plot(x, REAL, '-o', ...
    'MarkerSize', 12, ...
    'MarkerFaceColor', light_gray, ...
    'MarkerEdgeColor', white, ...
    'Color', dark_gray)


xlabel('Trials')
ylabel('Distance (cm)')
xticks(0:1:trial_number)
title('Difference between VR and REAL putter')
legend('VR', 'REAL');
h = gca;
ylim([100, 320])
set(h, 'FontSize', 14)

saveas(gcf, './data/figures/evaluate_diff', 'epsc')
