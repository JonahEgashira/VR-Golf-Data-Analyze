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

std_VR0_0h = std(VR0_0h_mean);
std_VR0_6h = std(VR0_6h_mean);
std_VR0_24h = std(VR0_24h_mean);

std_VR1_0h = std(VR1_0h_mean);
std_VR1_6h = std(VR1_6h_mean);
std_VR1_24h = std(VR1_24h_mean);

std_REAL_0h = std(REAL_0h_mean);
std_REAL_6h = std(REAL_6h_mean);
std_REAL_24h = std(REAL_24h_mean);

std_VR0_y = [std_VR0_0h, std_VR0_6h, std_VR0_24h];
std_VR1_y = [std_VR1_0h, std_VR1_6h, std_VR1_24h];
std_REAL_y = [std_REAL_0h, std_REAL_6h, std_REAL_24h];

y = [VR0_y; VR1_y; REAL_y];
std_y = [std_VR0_y; std_VR1_y; std_REAL_y];
x = categorical({'VR', 'VR + variance', 'Real'});
x = reordercats(x, {'VR', 'VR + variance', 'Real'});

b = bar(x, y, 'FaceColor', 'flat');
b(1).CData = light_gray;
b(2).CData = mid_gray;
b(3).CData = dark_gray;

% hold on
% [ngroups, nbars] = size(y');
% err_x = nan(nbars, ngroups);
% for i = 1:nbars
%     err_x(i,:) = b(i).XEndPoints;
% end
% 
% errorbar(err_x', y, std_y', 'k', 'linestyle', 'none', 'LineWidth', 1, 'CapSize', 8);
% hold off

legend('0h', '6h', '24h');
ylabel('Average distance from the target line (cm)')
title('Average Distances from the target line')
h = gca;
set(h, 'FontSize', 14)
saveas(gcf,'score_all','epsc')
