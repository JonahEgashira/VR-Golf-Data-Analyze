files = dir('results/*.csv');

n = size(files);

pre_scores = zeros(n);
post_scores = zeros(n);

for i = 1:n
    fileName = files(i).name;
    data = readmatrix(strcat("./results/", fileName));
    pre = data(1, :);
    post = data(2, :);
    pre_scores(i) = sum(pre);
    post_scores(i) = sum(post);

end

pre_mean = mean(pre_scores);
post_mean = mean(post_scores);
pre_std = std(pre_scores);
post_std = std(post_scores);

x = categorical({'Pre-test', 'Post-test'});
x = reordercats(x, {'Pre-test', 'Post-test'});

pre_xs = ones(n);
post_xs = ones(n) + 1;

%%% colors %%%

blue = [0 0.4470 0.7410];
cyan = [0.3010 0.7450 0.9330];
light_gray = [.8 .8 .8];
mid_gray = [.5 .5 .5];
dark_gray = [.3 .3 .3];
dark = [.1 .1 .1];

%%%

for i = 1:n
    figure
    y = [pre_scores(i), post_scores(i)];
    b = bar(x, y);
    b.FaceColor = 'flat';
    b.CData(1,:) = light_gray;
    b.CData(2,:) = dark_gray;
    ylabel('Score')
    ylim([0, 30])
    h = gca;
    set(h, 'FontSize', 14)
    xtips = b.XEndPoints;
    ytips = b.YEndPoints;
    labels = string(b.YData);
    text(xtips, ytips, labels, ...
        'HorizontalAlignment', 'center', 'VerticalAlignment', 'bottom', 'FontSize', 14)
end
         v   ---





