%%Task done by: Essam Ahmed Mohamed Ali.
%manipulating base image to embed a secret image to RGB bands, 2 bits each.
%this code is for hiding the secret image in the base image,
%the other code called 'extracting' is for showing the secret image from..
%..the output file 'encry.bmp'.
%% Read images
basee = imread('saturn.png');
msg = imread('cameraman.tif');
%% resize images to be equal
msg = imresize(msg,size(basee(:,:,1)));

%%showing the read images as they are
figure,imshow(basee);title('Original Image (Base Image)')
figure,imshow(msg);title('Secret Image (Msg Image)')

%% extracting each band of the 3 bands R,G,B
R=basee(:,:,1);
G=basee(:,:,2);
B=basee(:,:,3);

%% casting to double to manipulate the image bits
R = double(R);
G = double(G);
B = double(B);
msg = double(msg);

%% extracting each group of bits from the 8 groups. in each band(R,G,B) of base image.

R0 = mod(R,2);
R1 = mod(floor(R/2),2);
R2 = mod(floor(R/4),2);
R3 = mod(floor(R/8),2);
R4 = mod(floor(R/16),2);
R5 = mod(floor(R/32),2);
R6 = mod(floor(R/64),2);
R7 = mod(floor(R/128),2);

G0 = mod(G,2);
G1 = mod(floor(G/2),2);
G2 = mod(floor(G/4),2);
G3 = mod(floor(G/8),2);
G4 = mod(floor(G/16),2);
G5 = mod(floor(G/32),2);
G6 = mod(floor(G/64),2);
G7 = mod(floor(G/128),2);

B0 = mod(B,2);
B1 = mod(floor(B/2),2);
B2 = mod(floor(B/4),2);
B3 = mod(floor(B/8),2);
B4 = mod(floor(B/16),2);
B5 = mod(floor(B/32),2);
B6 = mod(floor(B/64),2);
B7 = mod(floor(B/128),2);


%% extracting each group of bits from the 8 groups.  of secret image
msg0 = mod(msg,2);
msg1 = mod(floor(msg/2),2);
msg2 = mod(floor(msg/4),2);
msg3 = mod(floor(msg/8),2);
msg4 = mod(floor(msg/16),2);
msg5 = mod(floor(msg/32),2);
msg6 = mod(floor(msg/64),2);
msg7 = mod(floor(msg/128),2);
%% replacing the LSBs of each band in base image with MSBs of secret image to hide 2 bits in each band

R0 = msg7;
R1 = msg6;

G0= msg5;
G1= msg4;

B0 =msg3;
B1=msg2;
%% combining the 3 manipulated bands to form the new image (base + secret) 
R = 2*(2*(2*(2*(2*(2*(2*R7+R6)+R5)+R4)+R3)+R2)+R1)+R0;
G = 2*(2*(2*(2*(2*(2*(2*G7+G6)+G5)+G4)+G3)+G2)+G1)+G0;
B = 2*(2*(2*(2*(2*(2*(2*B7+B6)+B5)+B4)+B3)+B2)+B1)+B0;

RGB(:,:,1) = R;
RGB(:,:,2) = G;
RGB(:,:,3) = B;

%%casting the image from double to uint8 then displaying it, then making an output file. 
figure,imshow(uint8(RGB));title('manipulated Image (Base Image + Secret image)')
imwrite(uint8(RGB),'encry.bmp');
