load('scores.mat');

x = categorical({'VR', 'VR + variance', 'Real'});
x = reordercats(x, {'VR', 'VR + variance', 'Real'});

y = means_0h_24h;

b = bar(x, y, 'FaceColor', mid_gray);

VR0_x = ones(VR0_number);
VR1_x = ones(VR1_number) + 1;
REAL_x = ones(REAL_number) + 2;

hold on
plot(VR0_x, VR0_0h_24h, 'o', 'MarkerEdgeColor', white, 'MarkerFaceColor', dark_gray)
hold on
plot(VR1_x, VR1_0h_24h, 'o', 'MarkerEdgeColor', white, 'MarkerFaceColor', dark_gray)
hold on
plot(REAL_x, REAL_0h_24h, 'o', 'MarkerEdgeColor', white, 'MarkerFaceColor', dark_gray)

hold off

ylabel('Improvement Rates Δ(24h - 0h)(%)')
title('Improvement Rates Δ(24h - 0h)')
ylim([-40, 70])
h = gca;
set(h, 'FontSize', 14)
saveas(gcf,'./data/figures/deltas_each/deltas_24h','epsc')
