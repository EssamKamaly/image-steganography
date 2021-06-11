%%Task done by: Essam Ahmed Mohamed Ali.
%manipulating base image to embed a secret image to RGB bands, 2 bits each.
%this code is for hiding the secret image in the base image,
%the other code called 'extracting' is for showing the secret image from..
%..the output file 'encry.bmp'.

%% reading image
RGB = imread('encry.bmp');
figure,imshow(RGB);title('The input image')
%% casting to double for manipulation
RGB = double(RGB);

%% splitting the image into 3 bands (R,G,B)
R=RGB(:,:,1);
G=RGB(:,:,2);
B=RGB(:,:,3);
R = double(R);
G = double(G);
B = double(B);

%% extracting each group of bits in each band(R,G,B)
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

%% taking the LSBs of each band(R,G,B). 2bits from each and combining them
%%to form a new image.

msg = 2*(2*(2*(2*(2*(2*(2*R0+R1)+G0)+G1)+B0)+B1)+0)+0;

figure,imshow(uint8(msg));title('secret Image (Msg Image)')
