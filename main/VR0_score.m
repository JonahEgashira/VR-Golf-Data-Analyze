load('scores.mat');

VR0_0h_mean_of_sub = mean(VR0_0h_mean);
VR0_6h_mean_of_sub = mean(VR0_6h_mean);
VR0_24h_mean_of_sub = mean(VR0_24h_mean);

x = categorical({'0h', '6h', '24h'});
x = reordercats(x, {'0h', '6h', '24h'});

VR0_y = [VR0_0h_mean_of_sub, VR0_6h_mean_of_sub, VR0_24h_mean_of_sub];

x_0h = ones(VR0_number);
x_6h = ones(VR0_number) + 1;
x_24h = ones(VR0_number) + 2;

% BAR %
b = bar(x, VR0_y);
hold on

% DOTS %
plot(x_0h, VR0_0h_mean, 'o', 'MarkerEdgeColor', 'white', 'MarkerFaceColor', dark_gray)
hold on
plot(x_6h, VR0_6h_mean, 'o', 'MarkerEdgeColor', 'white', 'MarkerFaceColor', dark_gray)
hold on
plot(x_24h, VR0_24h_mean, 'o', 'MarkerEdgeColor', 'white', 'MarkerFaceColor', dark_gray)

% LINES %
for i = 1:VR0_number
    hold on
    plot([1, 2, 3], [VR0_0h_mean(i), VR0_6h_mean(i), VR0_24h_mean(i)], Color=black, LineWidth=1)
end

hold off

% COLOR %
b.FaceColor = 'flat';
b.CData(1,:) = light_gray;
b.CData(2,:) = mid_gray;
b.CData(3,:) = dark_gray;

ylabel('Average Distance (cm)')
title('VR')
ylim([0, 70])
h = gca;
set(h, 'FontSize', 20)
saveas(gcf,'./data/figures/scores/VR0_score','epsc')
