load('scores.mat');

x = categorical({'VR', 'VR + variance', 'Real'});
x = reordercats(x, {'VR', 'VR + variance', 'Real'});

y = [means_0h_6h; means_0h_24h];
std_y = [std_0h_6h; std_0h_24h];

% BAR %
b = bar(x, y, 'FaceColor', 'flat');
b(1).CData = light_gray;
b(2).CData = dark_gray;

%%%%%%%

% ERRORBARS %

hold on
[ngroups, nbars] = size(y');
err_x = nan(nbars, ngroups);
for i = 1:nbars
    err_x(i,:) = b(i).XEndPoints;
end

errorbar(err_x', y', std_y', 'k', 'linestyle', 'none', 'LineWidth', 1);
hold off

%%%%%%%%%%%%%

legend('Δ(6h - 0h)', 'Δ(24h - 0h)', 'Location', 'northwest');
ylabel('Score Improvements (%)')
title('Average Improvement Rates')
ylim([-20, 70])
h = gca;
set(h, 'FontSize', 20)
saveas(gcf,'./data/figures/delta_all','epsc')
