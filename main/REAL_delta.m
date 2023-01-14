load('scores.mat');

REAL_0h_6h_mean = mean(REAL_0h_6h);
REAL_0h_24h_mean = mean(REAL_0h_24h);

x = categorical({'Δ(6h - 0h)', 'Δ(24h - 0h)'});
x = reordercats(x, {'Δ(6h - 0h)', 'Δ(24h - 0h)'});

REAL_y = [REAL_0h_6h_mean, REAL_0h_24h_mean];

x_0h_6h = ones(REAL_number);
x_0h_24h = ones(REAL_number) + 1;

% BAR %
b = bar(x, REAL_y);
hold on

% DOTS %
plot(x_0h_6h, REAL_0h_6h, 'o', 'MarkerEdgeColor', 'white', 'MarkerFaceColor', dark_gray)
hold on
plot(x_0h_24h, REAL_0h_24h, 'o', 'MarkerEdgeColor', 'white', 'MarkerFaceColor', dark_gray)

% LINES %
for i = 1:REAL_number
    hold on
    plot([1, 2], [REAL_0h_6h(i), REAL_0h_24h(i)], Color=black, LineWidth=1)
end

hold off

% COLOR %
b.FaceColor = 'flat';
b.CData(1,:) = light_gray;
b.CData(2,:) = dark_gray;

ylabel('Score Improvement Rates (%)')
title('REAL')
ylim([-80, 80])
h = gca;
set(h, 'FontSize', 14)
saveas(gcf,'REAL_delta','epsc')
