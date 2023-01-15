load('scores.mat')

VR1_0h_abs = abs(VR1_0h_diff);
VR1_6h_abs = abs(VR1_6h_diff);
VR1_24h_abs = abs(VR1_24h_diff);
VR1_0h_abs_each = mean(VR1_0h_abs, 2);
VR1_6h_abs_each = mean(VR1_6h_abs, 2);
VR1_24h_abs_each = mean(VR1_24h_abs, 2);

x = 1:20;

VR1_abs_each = [VR1_0h_abs_each, VR1_6h_abs_each, VR1_24h_abs_each];

for hour = 1:3
    time = '0h';
    VR1_abs = VR1_0h_abs;
    if hour == 2
        VR1_abs = VR1_6h_abs;
        time = '6h';
    elseif hour == 3
        VR1_abs = VR1_24h_abs;
        time = '24h';
    end

    figure('Position', [100 100 700 400]);
    title(['VR + variance', ' ', time])
    for i = 1:VR1_number
        hold on
        y = VR1_0h_abs(:,i);
        plot(x, y', '-o', ...
        'MarkerSize', 4, ...
        'MarkerFaceColor', light_gray, ...
        'MarkerEdgeColor', white, ...
        'Color', light_gray)
    end

    hold on

    plot(x, VR1_abs_each(:,hour)', '-o', ...
        'LineWidth', 2, ...
        'MarkerSize', 12, ...
        'MarkerFaceColor', dark_gray, ...
        'MarkerEdgeColor', white, ...
        'Color', dark_gray)

    hold off

    xlabel('Trials')
    ylabel('Distance from the target line (cm)')
    ylim([0, 140])
    xticks(0:1:trial_number)
    h = gca;
    set(h, 'FontSize', 14)

    filePath = strcat('./data/figures/VR1_', time, '_test');
    saveas(gcf, filePath,'epsc')
end
