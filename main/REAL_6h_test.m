load('scores.mat')

REAL_6h_abs = abs(REAL_6h_diff);
REAL_6h_abs_each = mean(REAL_6h_abs, 2);

x = 1:20;


figure('Position', [100 100 700 400]);
plot(x, REAL_6h_abs_each', '-o', ...
    'LineWidth', 2, ...
    'MarkerSize', 12, ...
    'MarkerFaceColor', dark_gray, ...
    'MarkerEdgeColor', white, ...
    'Color', dark_gray)

ylim([0, 120])
h = gca;
set(h, 'FontSize', 14)

xlabel('Trials')
ylabel('Distance from the target line (cm)')
title('Real')

for i = 1:REAL_number
    hold on
    y = REAL_6h_abs(:,i);
    plot(x, y', '-o', ...
    'MarkerSize', 8, ...
    'MarkerFaceColor', light_gray, ...
    'MarkerEdgeColor', white, ...
    'Color', light_gray)
end

hold off

saveas(gcf,'./data/figures/REAL_6h_test','epsc')
