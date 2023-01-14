load('scores.mat')

REAL_24h_abs = abs(REAL_24h_diff);
REAL_24h_abs_each = mean(REAL_24h_abs, 2);

x = 1:20;


figure('Position', [100 100 700 400]);
ylim([0, 120])
h = gca;
set(h, 'FontSize', 14)

xlabel('Trials')
ylabel('Distance from the target line (cm)')
title('Real 24h')

for i = 1:REAL_number
    hold on
    y = REAL_24h_abs(:,i);
    plot(x, y', '-o', ...
    'MarkerSize', 4, ...
    'MarkerFaceColor', light_gray, ...
    'MarkerEdgeColor', white, ...
    'Color', light_gray)
end

hold on

plot(x, REAL_24h_abs_each', '-o', ...
    'LineWidth', 2, ...
    'MarkerSize', 12, ...
    'MarkerFaceColor', dark_gray, ...
    'MarkerEdgeColor', white, ...
    'Color', dark_gray)

hold off

saveas(gcf,'./data/figures/REAL_24h_test','epsc')
