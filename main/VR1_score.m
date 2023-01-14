VR1_0h_mean_of_sub = mean(VR1_0h_mean);
VR1_6h_mean_of_sub = mean(VR1_6h_mean);
VR1_24h_mean_of_sub = mean(VR1_24h_mean);

x = categorical({'0h', '6h', '24h'});
x = reordercats(x, {'0h', '6h', '24h'});

VR1_y = [VR1_0h_mean_of_sub, VR1_6h_mean_of_sub, VR1_24h_mean_of_sub];

x_0h = ones(VR1_number);
x_6h = ones(VR1_number) + 1;
x_24h = ones(VR1_number) + 2;


% BAR %
b = bar(x, VR1_y);
hold on

% DOTS %
plot(x_0h, VR1_0h_mean, 'o', 'MarkerEdgeColor', 'white', 'MarkerFaceColor', dark_gray)
hold on
plot(x_6h, VR1_6h_mean, 'o', 'MarkerEdgeColor', 'white', 'MarkerFaceColor', dark_gray)
hold on
plot(x_24h, VR1_24h_mean, 'o', 'MarkerEdgeColor', 'white', 'MarkerFaceColor', dark_gray)

% LINES %
for i = 1:VR1_number
    hold on
    plot([1, 2, 3], [VR1_0h_mean(i), VR1_6h_mean(i), VR1_24h_mean(i)], Color=black, LineWidth=1)
end

hold off

% COLOR %
b.FaceColor = 'flat';
b.CData(1,:) = light_gray;
b.CData(2,:) = mid_gray;
b.CData(3,:) = dark_gray;

ylabel('Average distance from the target line (cm)')
title('VR + variance')
ylim([0, 70])
h = gca;
set(h, 'FontSize', 14)
saveas(gcf,'./data/figures/VR1_score','epsc')
