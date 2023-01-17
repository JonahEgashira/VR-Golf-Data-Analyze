load('scores.mat')

scores_each_sets = zeros(practice_sets, 1);
figure('Position', [100, 100, 700, 400]);
x = categorical({'1', '2', '3', '4', 'Reac.', '5', '6', '7', '8'});
x = reordercats(x, {'1', '2', '3', '4', 'Reac.', '5', '6', '7', '8'});

for i = 1:REAL_number
    scores_indivisual_sum = zeros(practice_sets, 1);
    for j = 1:practice_sets
        diff = abs(REAL_practice(:,j:j,i) - 200);
        if j == 5 
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

y = scores_each_sets / REAL_number;

hold on

plot(x, y, '-o', ...
    'LineWidth', 2, ...
    'MarkerSize', 12, ...
    'MarkerFaceColor', dark_gray, ...
    'MarkerEdgeColor', white, ...
    'Color', dark_gray)

h = gca;
set(h, 'FontSize', 14)

title('Real Practice Scores')
ylim([0, 70])
xlabel('Practice Set')
ylabel('Distance from the target line (cm)')

saveas(gcf, './data/figures/practice_sets/REAL_practice_sets', 'epsc')
