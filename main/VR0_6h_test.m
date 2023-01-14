load('scores.mat')

VR0_6h_abs = abs(VR0_6h_diff);
VR0_6h_abs_each = mean(VR0_6h_abs, 2);

x = 1:20;


figure('Position', [100 100 700 400]);
plot(x, VR0_6h_abs_each', '-o', ...
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
title('VR')

for i = 1:VR0_number
    hold on
    y = VR0_6h_abs(:,i);
    plot(x, y', '-o', ...
    'MarkerSize', 8, ...
    'MarkerFaceColor', light_gray, ...
    'MarkerEdgeColor', white, ...
    'Color', light_gray)
end

hold off

saveas(gcf,'./data/figures/VR0_6h_test','epsc')
