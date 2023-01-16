load('scores.mat')

scores_each_sets = zeros(all_sets, 1);
figure('Position', [100, 100, 900, 400]);
x = categorical({'0h test','P1', 'P2', 'P3', 'P4', 'Reac.', 'P5', 'P6', 'P7', 'P8', '6h test', '24h test'});
x = reordercats(x, {'0h test','P1', 'P2', 'P3', 'P4', 'Reac.', 'P5', 'P6', 'P7', 'P8', '6h test', '24h test'});

for i = 1:VR1_number
    scores_indivisual_sum = zeros(all_sets, 1);
    for j = 1:all_sets
        diff = abs(VR1_all(:,j:j,i) - 200);
        if j == 6 
            diff = diff(1:10);
        end
        score = mean(diff);
        scores_each_sets(j) = scores_each_sets(j) + score;
        scores_indivisual_sum(j) = score;
    end
    hold on
    plot(x, scores_indivisual_sum, '-o', ...
        'MarkerSize', 4, ...
        'MarkerFaceColor', light_gray, ...
        'MarkerEdgeColor', white, ...
        'Color', light_gray)
end

y = scores_each_sets / VR1_number;

hold on

plot(x, y, '-o', ...
    'LineWidth', 2, ...
    'MarkerSize', 12, ...
    'MarkerFaceColor', dark_gray, ...
    'MarkerEdgeColor', white, ...
    'Color', dark_gray)

h = gca;
set(h, 'FontSize', 14)

title('VR + variance Scores')
ylim([0, 70])
xlabel('Trial Sets')
ylabel('Distance from the target line (cm)')

saveas(gcf, './data/figures/all_sets/VR1_all_sets', 'epsc')
