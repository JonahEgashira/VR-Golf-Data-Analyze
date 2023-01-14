load('scores.mat');

VR0_0h_6h_mean = mean(VR0_0h_6h);
VR0_0h_24h_mean = mean(VR0_0h_24h);

x = categorical({'Δ(6h - 0h)', 'Δ(24h - 0h)'});
x = reordercats(x, {'Δ(6h - 0h)', 'Δ(24h - 0h)'});

VR0_y = [VR0_0h_6h_mean, VR0_0h_24h_mean];

x_0h_6h = ones(VR0_number);
x_0h_24h = ones(VR0_number) + 1;

% BAR %
b = bar(x, VR0_y);
hold on

% DOTS %
plot(x_0h_6h, VR0_0h_6h, 'o', 'MarkerEdgeColor', 'white', 'MarkerFaceColor', dark_gray)
hold on
plot(x_0h_24h, VR0_0h_24h, 'o', 'MarkerEdgeColor', 'white', 'MarkerFaceColor', dark_gray)

% LINES %
for i = 1:VR0_number
    hold on
    plot([1, 2], [VR0_0h_6h(i), VR0_0h_24h(i)], Color=black, LineWidth=1)
end

hold off

% COLOR %
b.FaceColor = 'flat';
b.CData(1,:) = light_gray;
b.CData(2,:) = dark_gray;

ylabel('Score Improvement Rates (%)')
title('VR')
ylim([-80, 80])
h = gca;
set(h, 'FontSize', 14)
saveas(gcf,'./data/figures/VR1_delta','epsc')
