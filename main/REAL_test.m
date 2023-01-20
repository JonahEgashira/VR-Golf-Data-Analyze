load('scores.mat')

REAL_0h_abs = abs(REAL_0h_diff);
REAL_6h_abs = abs(REAL_6h_diff);
REAL_24h_abs = abs(REAL_24h_diff);
REAL_0h_abs_each = mean(REAL_0h_abs, 2);
REAL_6h_abs_each = mean(REAL_6h_abs, 2);
REAL_24h_abs_each = mean(REAL_24h_abs, 2);

x = 1:20;

REAL_abs_each = [REAL_0h_abs_each, REAL_6h_abs_each, REAL_24h_abs_each];

for hour = 1:3
    time = '0h';
    REAL_abs = REAL_0h_abs;
    if hour == 2
        REAL_abs = REAL_6h_abs;
        time = '6h';
    elseif hour == 3
        REAL_abs = REAL_24h_abs;
        time = '24h';
    end

    figure('Position', [100 100 700 400]);
    title(['Real', ' ', time])
    for i = 1:REAL_number
        hold on
        y = REAL_0h_abs(:,i);
        plot(x, y', '-o', ...
        'MarkerSize', 4, ...
        'MarkerFaceColor', light_gray, ...
        'MarkerEdgeColor', white, ...
        'Color', light_gray)
    end

    hold on

    plot(x, REAL_abs_each(:,hour)', '-o', ...
        'LineWidth', 2, ...
        'MarkerSize', 12, ...
        'MarkerFaceColor', dark_gray, ...
        'MarkerEdgeColor', white, ...
        'Color', dark_gray)

    hold off

    xlabel('Trials')
    ylabel('Distance (cm)')
    ylim([0, 140])
    xticks(0:1:trial_number)
    h = gca;
    set(h, 'FontSize', 20)

    filePath = strcat('./data/figures/test_each_hour/REAL_', time, '_test');
    saveas(gcf, filePath,'epsc')
end
