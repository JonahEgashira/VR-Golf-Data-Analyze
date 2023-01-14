load('scores.mat');

REAL_0h_mean_of_sub = mean(REAL_0h_mean);
REAL_6h_mean_of_sub = mean(REAL_6h_mean);
REAL_24h_mean_of_sub = mean(REAL_24h_mean);

x = categorical({'0h', '6h', '24h'});
x = reordercats(x, {'0h', '6h', '24h'});

REAL_y = [REAL_0h_mean_of_sub, REAL_6h_mean_of_sub, REAL_24h_mean_of_sub];

x_0h = ones(REAL_number);
x_6h = ones(REAL_number) + 1;
x_24h = ones(REAL_number) + 2;

% BAR %
b = bar(x, REAL_y);
hold on

% DOTS %
plot(x_0h, REAL_0h_mean, 'o', 'MarkerEdgeColor', 'white', 'MarkerFaceColor', dark_gray)
hold on
plot(x_6h, REAL_6h_mean, 'o', 'MarkerEdgeColor', 'white', 'MarkerFaceColor', dark_gray)
hold on
plot(x_24h, REAL_24h_mean, 'o', 'MarkerEdgeColor', 'white', 'MarkerFaceColor', dark_gray)

% LINES %
for i = 1:REAL_number
    hold on
    plot([1, 2, 3], [REAL_0h_mean(i), REAL_6h_mean(i), REAL_24h_mean(i)], Color=black, LineWidth=1)
end

hold off

% COLOR %
b.FaceColor = 'flat';
b.CData(1,:) = light_gray;
b.CData(2,:) = mid_gray;
b.CData(3,:) = dark_gray;

ylabel('Average distance from the target line (cm)')
ylim([0, 70])
title('REAL')
h = gca;
set(h, 'FontSize', 14)
saveas(gcf,'./data/figures/REAL_score','epsc')
