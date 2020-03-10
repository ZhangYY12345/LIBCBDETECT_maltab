clear variables; dbstop error; close all;
disp('================================');

fp_our = fopen('txt_data/ours_pts.txt');
data_our = textscan(fp_our, '%f %f %f %f %f');
fclose(fp_our);
fp_base = fopen('libcbdetect_corner_pts.txt');
data_base = textscan(fp_base, '%f %f');
fclose(fp_base);

I = imread('D:/studying/stereo vision/research code/fisheye-stereo-calibrate/fisheyeStereoCalib/fisheyeStereoCalib/fisheyeStereoCalib/20191227/patternsImgR/1_pattern4.jpg');
figure; imshow(uint8(I)); hold on;
scatter(data_our{1,1}, data_our{1,2}, '+');hold on;
scatter(data_base{1,1}, data_base{1,2}, 'ro');
legend('Ours', 'LIBCBDETECT');
xlabel('Í¼Ïñx×ø±ê');
ylabel('Í¼Ïñy×ø±ê');

figure;
scatter(data_our{1,1}, data_our{1,2}, '+');hold on;
scatter(data_base{1,1}, data_base{1,2}, 'ro');
legend('Ours', 'LIBCBDETECT');
xlabel('Í¼Ïñx×ø±ê');
ylabel('Í¼Ïñy×ø±ê');

% 20191227-R-1
to_remove = [31*(10-0)+23, 31*(10-0)+27, 31*(10-0)+29,...
    31*(10-1)+23, 31*(10-1)+31,...
    31*(10-2)+23, 31*(10-2)+27,...
    31*(10-5)+23, 31*(10-5)+29,...
    31*(10-6)+7];

% 20191231-0
% to_remove = [];
% 20191231-1
% to_remove = [31*(11-10)+1, 31*(11-11)+1, 31*(11-11)+2];
% 20191231-2
% to_remove = [];
% 20191231-3
% to_remove = [];
% 20191231-4
%to_remove = [31*(16-1)+13, 31*(16-1)+31, 31*(16-3)+2, 31*(16-3)+7, 31*(16-4)+15, 31*(16-5)+2, 31*(16-6)+15, 31*(16-7)+1, 31*(16-8)+17, 31*(16-16)+15];
% 20191231-7
%to_remove = [31*(15-0)+11, 31*(15-13)+31, 31*(15-14)+31, 31*(15-15)+31];
% 20191231-10
% to_remove = [31*(16-1)+10];
% 20191231-12
% to_remove = [18+31*16, 15+31*15, 31*15+30,31*(16-2)+10, 31*(16-2)+16, 31*(16-4)+3, 31*(16-4)+9, 31*(16-5)+3, 31*(16-6)+14, 31*(16-6)+18, 31*(16-8)+10, 31*(16-9)+7, 31*(16-10)+6, 31*(16-13)+10, 31*(16-13)+16];
% 20191231-13
% to_remove = [31*(16-3)+9, 31*(16-6)+9, 31*(16-7)+10,31*(16-8)+1, 31*(16-10)+7, 31*(16-13)+5, 31*(16-14)+1, 31*(16-16)+15];
% 20191231-14
% to_remove = [31*(16-9)+16, 31*(16-10)+8, 31*(16-11)+15,31*(16-12)+2, 31*(16-12)+14, 31*(16-13)+16, 31*(16-15)+14];
[row,col] = size(data_base{1,1});
data_base{1,1}(unique(to_remove),:) = [];
data_base{1,2}(unique(to_remove),:) = [];

figure;
scatter(data_our{1,1}, data_our{1,2}, '+');hold on;
scatter(data_base{1,1}, data_base{1,2}, 'ro');
legend('Ours', 'LIBCBDETECT');
xlabel('Í¼Ïñx×ø±ê');
ylabel('Í¼Ïñy×ø±ê');

err_x = data_our{1,1} - data_base{1,1};
err_y = data_our{1,2} - data_base{1,2};
err = sqrt(err_x.*err_x + err_y.*err_y);
max_err = max(err);
mean_err = mean(err);
var_err = var(err, 0, 1);
std_err = std(err, 0, 1);

[row_, col_] = size(err);
figure;
x_ = 1:row_;
plot(x_, err, 'r*');
xlabel('µã¶ÔË÷Òı');
ylabel('µã¶Ô¾àÀë');
str_ = ['std=' num2str(std_err) ' var=' num2str(var_err)];
legend(str_);

figure;
hist(err, 20);
xlabel('µã¶Ô¾àÀë');
ylabel('µã¶ÔÊı');

big_err_idx = find(err > 0.5);
big_err_data_our_x = data_our{1,1}(unique(big_err_idx),:);
big_err_data_our_y = data_our{1,2}(unique(big_err_idx),:);
big_err_data_base_x = data_base{1,1}(unique(big_err_idx),:);
big_err_data_base_y = data_base{1,2}(unique(big_err_idx),:);

figure; imshow(uint8(I)); hold on;
scatter(big_err_data_our_x, big_err_data_our_y, '+', 'LineWidth',1.5);hold on;
scatter(big_err_data_base_x, big_err_data_base_y, 'ro','LineWidth',1.5);
legend('Ours', 'LIBCBDETECT');
xlabel('Í¼Ïñx×ø±ê');
ylabel('Í¼Ïñy×ø±ê');

big_err_idx = find(err > 0.8);
big_err_data_our_x = data_our{1,1}(unique(big_err_idx),:);
big_err_data_our_y = data_our{1,2}(unique(big_err_idx),:);
big_err_data_base_x = data_base{1,1}(unique(big_err_idx),:);
big_err_data_base_y = data_base{1,2}(unique(big_err_idx),:);

figure; imshow(uint8(I)); hold on;
scatter(big_err_data_our_x, big_err_data_our_y, '+', 'LineWidth',1.5);hold on;
scatter(big_err_data_base_x, big_err_data_base_y, 'ro','LineWidth',1.5);
legend('Ours', 'LIBCBDETECT');
xlabel('Í¼Ïñx×ø±ê');
ylabel('Í¼Ïñy×ø±ê');
