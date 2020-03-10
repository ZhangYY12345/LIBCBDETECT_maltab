clear variables; dbstop error; close all;
disp('================================');

addpath('matching');

tic;
%I = imread('data/04.png');
I = imread('D:/studying/stereo vision/research code/fisheye-stereo-calibrate/fisheyeStereoCalib/fisheyeStereoCalib/fisheyeStereoCalib/20191227/patternsImgR/1_pattern4.jpg');
%I = imread('D:\studying\stereo vision\research code\data\20191227\patternsImgL\20_pattern4.jpg');
corners = findCorners(I,0.01,1);
chessboards = chessboardsFromCorners(corners);
time_ = toc;

figure; imshow(uint8(I)); hold on;
plotChessboards(chessboards,corners);


fp = fopen('libcbdetect_corner_pts.txt', 'w');
% %31*17，右上角为坐标系原点,image 其他->左上角为坐标原点
% [row, col] = size(chessboards{1,1});
% for i = 1 : col
%     for j = row: -1 : 1
%         cur_pt_idx = chessboards{1,1}(j, i);
%         fprintf(fp, '%.6f \t', corners.p(cur_pt_idx,1));
%         fprintf(fp, '%.6f\n', corners.p(cur_pt_idx,2));
%     end
% end

%17*31，左上角为坐标系原点:image 10,3->左上角为坐标原点
[row, col] = size(chessboards{1,1});
for i = 1 : row
    for j = 1: col
        cur_pt_idx = chessboards{1,1}(i,j);
        fprintf(fp, '%.6f \t', corners.p(cur_pt_idx,1));
        fprintf(fp, '%.6f\n', corners.p(cur_pt_idx,2));
    end
end

fclose(fp);




