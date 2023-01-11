load('scores.mat');

VR0_0h_mean_of_sub = mean(VR0_0h_mean);
VR0_6h_mean_of_sub = mean(VR0_6h_mean);
VR0_24h_mean_of_sub = mean(VR0_24h_mean);

VR1_0h_mean_of_sub = mean(VR1_0h_mean);
VR1_6h_mean_of_sub = mean(VR1_6h_mean);
VR1_24h_mean_of_sub = mean(VR1_24h_mean);

REAL_0h_mean_of_sub = mean(REAL_0h_mean);
REAL_6h_mean_of_sub = mean(REAL_6h_mean);
REAL_24h_mean_of_sub = mean(REAL_24h_mean);

VR0_y = [VR0_0h_mean_of_sub, VR0_6h_mean_of_sub, VR0_24h_mean_of_sub];
VR1_y = [VR1_0h_mean_of_sub, VR1_6h_mean_of_sub, VR1_24h_mean_of_sub];
REAL_y = [REAL_0h_mean_of_sub, REAL_6h_mean_of_sub, REAL_24h_mean_of_sub];

y = [VR0_y; VR1_y; REAL_y];
x = categorical({'VR', 'VR + variance', 'Real'});
x = reordercats(x, {'VR', 'VR + variance', 'Real'});

b = bar(x, y, 'FaceColor', 'flat');
b(1).CData = light_gray;
b(2).CData = mid_gray;
b(3).CData = dark_gray;

legend('0h', '6h', '24h');
ylabel('Dist from the target line (cm)')
h = gca;
set(h, 'FontSize', 14)
