load('scores.mat')

scores_each_trials = zeros(1, all_trials);
figure('Position', [100, 100, 1200, 500]);

x = 1:all_trials;

for i = 1:REAL_number
    trials = abs(REAL_all(:,:,i) - 200);
    trials = trials(:)';
    trials(111:120) = [];
    scores_each_trials = scores_each_trials + trials;
    hold on
    plot(x, trials, 'o', ...
        'MarkerSize', 3, ...
        'MarkerFaceColor', light_gray, ...
        'MarkerEdgeColor', white, ...
        'Color', light_gray)
end

y = scores_each_trials / REAL_number;

plot(x, y, '-o', ...
    'LineWidth', 0.5, ...
    'MarkerSize', 8, ...
    'MarkerFaceColor', dark_gray, ...
    'MarkerEdgeColor', white, ...
    'Color', dark_gray)

h = gca;
set(h, 'FontSize', 14)

title('Real')
ylim([0, 80])
xlabel('Trials')
xlim([0, all_trials + 9])
xticks(0:10:all_trials + 9)
ylabel('Distance from the target line (cm)')

xline_values = [20, 40, 60, 80, 100, 110, 130, 150, 170, 190, 210, 230];
xline_str = {'0h test', 'P1', 'P2', 'P3', 'P4', 'Reac.', 'P5', 'P6', 'P7', 'P8', '6h test', '24h test'};

for i = 1:all_sets
    val = xline_values(i);
    str = xline_str(i);
    xline(val, '--', str)
end


saveas(gcf, './data/figures/all_trials/REAL_all_trials', 'epsc')
