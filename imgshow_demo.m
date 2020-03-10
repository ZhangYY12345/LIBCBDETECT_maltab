clear variables; dbstop error; close all;
disp('================================');

lineH = imread('D:\studying\stereo vision\research code\fisheye-stereo-calibrate\chessboardPtsDetec\chessboardPtsDetec\lineH.jpg');
lineV = imread('D:\studying\stereo vision\research code\fisheye-stereo-calibrate\chessboardPtsDetec\chessboardPtsDetec\lineV.jpg');
corners = imread('D:\studying\stereo vision\research code\fisheye-stereo-calibrate\chessboardPtsDetec\chessboardPtsDetec\ptsImg_.jpg');

figure;imshow(uint8(lineH)); 
figure;imshow(uint8(lineV));
figure;imshow(uint8(corners));
