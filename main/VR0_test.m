load('scores.mat')

VR0_0h_abs = abs(VR0_0h_diff);
VR0_6h_abs = abs(VR0_6h_diff);
VR0_24h_abs = abs(VR0_24h_diff);
VR0_0h_abs_each = mean(VR0_0h_abs, 2);
VR0_6h_abs_each = mean(VR0_6h_abs, 2);
VR0_24h_abs_each = mean(VR0_24h_abs, 2);

x = 1:20;

VR0_abs_each = [VR0_0h_abs_each, VR0_6h_abs_each, VR0_24h_abs_each];

for hour = 1:3
    time = '0h';
    VR0_abs = VR0_0h_abs;
    if hour == 2
        VR0_abs = VR0_6h_abs;
        time = '6h';
    elseif hour == 3
        VR0_abs = VR0_24h_abs;
        time = '24h';
    end

    figure('Position', [100 100 700 400]);
    title(['VR', ' ', time])
    for i = 1:VR0_number
        hold on
        y = VR0_0h_abs(:,i);
        plot(x, y', '-o', ...
        'MarkerSize', 4, ...
        'MarkerFaceColor', light_gray, ...
        'MarkerEdgeColor', white, ...
        'Color', light_gray)
    end

    hold on

    plot(x, VR0_abs_each(:,hour)', '-o', ...
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

    filePath = strcat('./data/figures/VR0_', time, '_test');
    saveas(gcf, filePath,'epsc')
end
