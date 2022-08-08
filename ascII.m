%ASCII Art Creator
function[] = ascII
% have this function take in the file path name, xpixels, ypixels, x, and y
clear all; 
clc;

%select the file
% for future purposes (MAKE IT LOOK A BIT MORE PROFESSIONAL)
% [flnm,flpth] = uigetfile('Users/zachshinnick/Desktop/Uni/Programming/Matlab Project/ascIItest/*.png', 'Select the Image');
%read in the image

Img = imread("ASCII2.png");
%convert the image to grey scale
ImgGrey = rgb2gray(Img);

[xPixels,yPixels]=size(ImgGrey);

%resize 
xMaxPix=80;
yMaxPix=200;


ImgGreyresize = imresize(ImgGrey, [xMaxPix, yMaxPix]);


[xPixels,yPixels]=size(ImgGreyresize);

% imshow(ImgGreyresize);


symbols=['M';'#';'@';'$';;'&';'%';'k';'t';'r';'s';';';':';'i';'*';',';'.';''''];

Intensity = [0 10 20 30 40 50 60 70 80 90 110 127 139 178 210 230 255];

%contruct the matrix
SoundEffects(6)

for i = 1:1:xPixels
    for j = 1:1:yPixels

        for binNum = 1:1:length(symbols)

            if (ImgGreyresize(i,j)) >=Intensity(binNum) && ImgGreyresize(i,j)<= Intensity(binNum+1)
                symbolImg(i,j) = symbols(binNum);

                break;
            end
        end
    end
    disp(symbolImg(i, :));
    pause(0.1);
end
pause(3)
clc
% disp(symbolImg(1, :));
% pause(5);