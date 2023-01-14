VR0_files = dir("./data/VR0/*.csv");
VR1_files = dir("./data/VR1/*.csv");
REAL_files = dir("./data/REAL/*.csv");

VR0_number = 6;
VR1_number = 7;
REAL_number = 6;

trial_number = 20;

VR0_0h = zeros(trial_number, VR0_number);
VR0_6h = zeros(trial_number, VR0_number);
VR0_24h = zeros(trial_number, VR0_number);
VR1_0h = zeros(trial_number, VR1_number);
VR1_6h = zeros(trial_number, VR1_number);
VR1_24h = zeros(trial_number, VR1_number);
REAL_0h = zeros(trial_number, REAL_number);
REAL_6h = zeros(trial_number, REAL_number);
REAL_24h = zeros(trial_number, REAL_number);

VR0_0h_diff = zeros(trial_number, VR0_number);
VR0_6h_diff = zeros(trial_number, VR0_number);
VR0_24h_diff = zeros(trial_number, VR0_number);
VR1_0h_diff = zeros(trial_number, VR1_number);
VR1_6h_diff = zeros(trial_number, VR1_number);
VR1_24h_diff = zeros(trial_number, VR1_number);
REAL_0h_diff = zeros(trial_number, REAL_number);
REAL_6h_diff = zeros(trial_number, REAL_number);
REAL_24h_diff = zeros(trial_number, REAL_number);

target_scores = 200 * ones(1, 20);

% DATA INPUT %
for i = 1:VR0_number
    fileName = VR0_files(i).name;
    data = readmatrix(strcat("./data/VR0/", fileName));
    scores_0h = data(1:trial_number, 1:1);
    scores_6h = data(1:trial_number, 11:11);
    scores_24h = data(1:trial_number, 12:12);

    VR0_0h(1:trial_number, i:i) = scores_0h;
    VR0_6h(1:trial_number, i:i) = scores_6h;
    VR0_24h(1:trial_number, i:i) = scores_24h;
    VR0_0h_diff(1:trial_number, i:i) = scores_0h - target_scores';
    VR0_6h_diff(1:trial_number, i:i) = scores_6h - target_scores';
    VR0_24h_diff(1:trial_number, i:i) = scores_24h - target_scores';
end

for i = 1:VR1_number
    fileName = VR1_files(i).name;
    data = readmatrix(strcat("./data/VR1/", fileName));
    scores_0h = data(1:trial_number, 1:1);
    scores_6h = data(1:trial_number, 11:11);
    scores_24h = data(1:trial_number, 12:12);

    VR1_0h(1:trial_number, i:i) = scores_0h;
    VR1_6h(1:trial_number, i:i) = scores_6h;
    VR1_24h(1:trial_number, i:i) = scores_24h;
    VR1_0h_diff(1:trial_number, i:i) = scores_0h - target_scores';
    VR1_6h_diff(1:trial_number, i:i) = scores_6h - target_scores';
    VR1_24h_diff(1:trial_number, i:i) = scores_24h - target_scores';
end

for i = 1:REAL_number
    fileName = REAL_files(i).name;
    data = readmatrix(strcat("./data/REAL/", fileName));
    scores_0h = data(1:trial_number, 1:1);
    scores_6h = data(1:trial_number, 11:11);
    scores_24h = data(1:trial_number, 12:12);

    REAL_0h(1:trial_number, i:i) = scores_0h;
    REAL_6h(1:trial_number, i:i) = scores_6h;
    REAL_24h(1:trial_number, i:i) = scores_24h;
    REAL_0h_diff(1:trial_number, i:i) = scores_0h - target_scores';
    REAL_6h_diff(1:trial_number, i:i) = scores_6h - target_scores';
    REAL_24h_diff(1:trial_number, i:i) = scores_24h - target_scores';
end

% RESULTS %

VR0_0h_6h = zeros(1, VR0_number);
VR0_0h_24h = zeros(1, VR0_number);
VR1_0h_6h = zeros(1, VR1_number);
VR1_0h_24h = zeros(1, VR1_number);
REAL_0h_6h = zeros(1, REAL_number);
REAL_0h_24h = zeros(1, REAL_number);

VR0_0h_mean = zeros(1, VR0_number);
VR0_6h_mean = zeros(1, VR0_number);
VR0_24h_mean = zeros(1, VR0_number);
VR1_0h_mean = zeros(1, VR1_number);
VR1_6h_mean = zeros(1, VR1_number);
VR1_24h_mean = zeros(1, VR1_number);
REAL_0h_mean = zeros(1, REAL_number);
REAL_6h_mean = zeros(1, REAL_number);
REAL_24h_mean = zeros(1, REAL_number);

%%%%%%%%%%%

for i = 1:VR0_number
    scores_0h = VR0_0h(1:trial_number, i:i);
    scores_6h = VR0_6h(1:trial_number, i:i);
    scores_24h = VR0_24h(1:trial_number, i:i);

    abs_0h = abs(target_scores - scores_0h');
    abs_6h = abs(target_scores - scores_6h');
    abs_24h = abs(target_scores - scores_24h');
    
    sum_0h = sum(abs_0h);
    sum_6h = sum(abs_6h);
    sum_24h = sum(abs_24h);

    mean_0h = mean(abs_0h);
    mean_6h = mean(abs_6h);
    mean_24h = mean(abs_24h);

    VR0_0h_mean(i) = mean_0h;
    VR0_6h_mean(i) = mean_6h;
    VR0_24h_mean(i) = mean_24h;

    std_0h = std(abs_0h);
    std_6h = std(abs_6h);
    std_24h = std(abs_24h);

    delta_0h_6h = - (sum_6h / sum_0h - 1) * 100;
    delta_0h_24h = - (sum_24h / sum_0h - 1) * 100;

    VR0_0h_6h(i) = delta_0h_6h;
    VR0_0h_24h(i) = delta_0h_24h;
end

for i = 1:VR1_number
    scores_0h = VR1_0h(1:trial_number, i:i);
    scores_6h = VR1_6h(1:trial_number, i:i);
    scores_24h = VR1_24h(1:trial_number, i:i);

    abs_0h = abs(target_scores - scores_0h');
    abs_6h = abs(target_scores - scores_6h');
    abs_24h = abs(target_scores - scores_24h');
    
    sum_0h = sum(abs_0h);
    sum_6h = sum(abs_6h);
    sum_24h = sum(abs_24h);

    mean_0h = mean(abs_0h);
    mean_6h = mean(abs_6h);
    mean_24h = mean(abs_24h);

    VR1_0h_mean(i) = mean_0h;
    VR1_6h_mean(i) = mean_6h;
    VR1_24h_mean(i) = mean_24h;

    std_0h = std(abs_0h);
    std_6h = std(abs_6h);
    std_24h = std(abs_24h);

    delta_0h_6h = - (sum_6h / sum_0h - 1) * 100;
    delta_0h_24h = - (sum_24h / sum_0h - 1) * 100;

    VR1_0h_6h(i) = delta_0h_6h;
    VR1_0h_24h(i) = delta_0h_24h;
end

for i = 1:REAL_number
    scores_0h = REAL_0h(1:trial_number, i:i);
    scores_6h = REAL_6h(1:trial_number, i:i);
    scores_24h = REAL_24h(1:trial_number, i:i);

    abs_0h = abs(target_scores - scores_0h');
    abs_6h = abs(target_scores - scores_6h');
    abs_24h = abs(target_scores - scores_24h');
    
    sum_0h = sum(abs_0h);
    sum_6h = sum(abs_6h);
    sum_24h = sum(abs_24h);

    mean_0h = mean(abs_0h);
    mean_6h = mean(abs_6h);
    mean_24h = mean(abs_24h);

    REAL_0h_mean(i) = mean_0h;
    REAL_6h_mean(i) = mean_6h;
    REAL_24h_mean(i) = mean_24h;

    std_0h = std(abs_0h);
    std_6h = std(abs_6h);
    std_24h = std(abs_24h);

    delta_0h_6h = - (sum_6h / sum_0h - 1) * 100;
    delta_0h_24h = - (sum_24h / sum_0h - 1) * 100;

    REAL_0h_6h(i) = delta_0h_6h;
    REAL_0h_24h(i) = delta_0h_24h;
end

% COLORS %
white = [1 1 1];
light_gray = [.8 .8 .8];
mid_gray = [.5 .5 .5];
dark_gray = [.3 .3 .3];
black = [.1 .1 .1];

VR0_mean_0h_6h = mean(VR0_0h_6h);
VR0_mean_0h_24h = mean(VR0_0h_24h);
VR1_mean_0h_6h = mean(VR1_0h_6h);
VR1_mean_0h_24h = mean(VR1_0h_24h);
REAL_mean_0h_6h = mean(REAL_0h_6h);
REAL_mean_0h_24h = mean(REAL_0h_24h);

means_0h_6h = [VR0_mean_0h_6h, VR1_mean_0h_6h, REAL_mean_0h_6h];
means_0h_24h = [VR0_mean_0h_24h, VR1_mean_0h_24h, REAL_mean_0h_24h];
std_0h_6h = [std(VR0_0h_6h), std(VR1_0h_6h), std(REAL_0h_6h)];
std_0h_24h = [std(VR0_0h_24h), std(VR1_0h_24h), std(REAL_0h_24h)];

save('scores');
