%ASCII Art Creator function
% this function was modified to also seek input for the sound effects
% funciton to get the desired effect I wanted for the output in the command
% window

function[] = ascII2(filename,n)
clc;

%select the file
% for future purposes (MAKE IT LOOK A BIT MORE PROFESSIONAL)
% [flnm,flpth] = uigetfile('Users/zachshinnick/Desktop/Uni/Programming/Matlab Project/ascIItest/*.png', 'Select the Image');

%read in the image
Img = imread(filename);

%convert the image to grey scale
ImgGrey = rgb2gray(Img);

[xPixels,yPixels]=size(ImgGrey);

%resize 
xMaxPix=80;
yMaxPix=200;

%Resize image - using inbuilt function im resize
%take original image then input max and min pixels
ImgGreyresize = imresize(ImgGrey, [xMaxPix, yMaxPix]);

%new pixels
[xPixels,yPixels]=size(ImgGreyresize);

% imshow(ImgGreyresize);

%Ascii Symbols
%Darkest to lightest
symbols=['M';'#';'@';'$';'&';'%';'k';'t';'r';'s';';';':';'i';'*';',';'.';''''];

%goes upto 255 as that is pixel values max
Intensity = [0 10 20 30 40 50 60 70 80 90 110 127 139 178 210 230 255];

%calling sound effects function to dsplay desired sound with initial
%parameters
SoundEffects(n)

%contruct the matrix

%loop through entire image
for i = 1:1:xPixels
    for j = 1:1:yPixels
        
        %seach through intensity vector and determin which range it is in
        %then assign to a symbol
        for binNum = 1:1:length(symbols)

            if (ImgGreyresize(i,j)) >=Intensity(binNum) && ImgGreyresize(i,j)<= Intensity(binNum+1)
                symbolImg(i,j) = symbols(binNum);

                break;
            end
        end
    end
    %displaying the ascii art 1 row at a time with a 0/05second pause
    %before displaying the following line
    disp(symbolImg(i, :));
    pause(0.05);
end
pause(1.5)
clc
% disp(symbolImg(1, :));
% pause(5);