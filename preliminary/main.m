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

x = categorical({'Pre-test', 'Post-test'});
x = reordercats(x, {'Pre-test', 'Post-test'});
y = [pre_mean, post_mean];
pre_xs = ones(n);
post_xs = ones(n) + 1;

%%% colors %%%

blue = [0 0.4470 0.7410];
cyan = [0.3010 0.7450 0.9330];
light_gray = [.7 .7 .7];
mid_gray = [.5 .5 .5];
dark_gray = [.2 .2 .2];
dark = [.1 .1 .1];

%%%%%%%%%%%%%%

b = bar(x, y);
hold on
plot(pre_xs, pre_scores, 'o', 'MarkerEdgeColor', 'white', 'MarkerFaceColor', dark)
hold on
plot(post_xs, post_scores, 'o', 'MarkerEdgeColor', 'white', 'MarkerFaceColor', dark)
for i = 1:n
    hold on
    plot([1, 2], [pre_scores(i), post_scores(i)], Color=mid_gray, LineWidth=1)
end
hold off
b.FaceColor = 'flat';
b.CData(1,:) = light_gray;
b.CData(2,:) = dark_gray;

%xtips = b.XEndPoints;
%ytips = b.YEndPoints;
%labels = string(b.YData);
%text(xtips, ytips, labels, ...
%    'HorizontalAlignment', 'center', 'VerticalAlignment', 'bottom', 'FontSize', 14)

ylabel('Score')
ylim([0, 30])

h = gca;
set(h, 'FontSize', 14)

%TODO: Add error bar

