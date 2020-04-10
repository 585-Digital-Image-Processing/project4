%% Texture 1
F = 0.042;
theta = 0;
sigma = 24;

hx_score = zeros(1,4*sigma+1);
hy_score = zeros(1,4*sigma+1);
for i = 1:4*sigma+1
    hx_score(i) = hx(F, theta, sigma,i-2*sigma-1);
    hy_score(i) = hy(F, theta, sigma,i-2*sigma-1);
end

img1 = imread('texture1.gif');
img1 = cast(img1, 'double');
figure()
imshow(img1);
title('texture1');
[m,n] = size(img1);
new_img1 = zeros(m,n);
new_img10 = zeros(m,n);
for i = 2*sigma+1:m-sigma*2
    for j = 2*sigma+1:n - sigma*2
        new_img1(i,j) = hx_score(1,:)*img1(i-2*sigma:i+2*sigma,j);
    end
end

for i = 2*sigma+1:m-sigma*2
    for j = 2*sigma+1:n - sigma*2
        new_img10(i,j) =  new_img1(i, j-2*sigma:j+2*sigma)*hy_score(1,:)';
    end
end
new_img10 = abs(new_img10);

figure()
gray1 = mat2gray(new_img10(2*sigma+1:m-2*sigma, 2*sigma+1:n-2*sigma));
imshow(gray1);
figure()
surf(new_img10(4*sigma+1:m-4*sigma, 4*sigma+1:n-4*sigma));
xlabel('x');
ylabel('y');
zlabel('m(x,y)');
shading interp;

% Smooth
sigma_s = 24;
g_score = zeros(1,4*sigma_s+1);
for i = 1:4*sigma_s+1
    g_score(i) = g(sigma_s,i-2*sigma_s-1);
end
[m,n] = size(new_img1);
new_img1_smooth = zeros(m,n);
new_img10_smooth = zeros(m,n);

for i = 2*sigma_s+1:m-sigma_s*2
    for j = 2*sigma_s+1:n - sigma_s*2
        new_img1_smooth(i,j) = g_score(1,:)*new_img10(i-2*sigma_s:i+2*sigma_s,j);
    end
end

for i = 2*sigma_s+1:m-sigma_s*2
    for j = 2*sigma_s+1:n - sigma_s*2
        new_img10_smooth(i,j) =  new_img1_smooth(i, j-2*sigma_s:j+2*sigma_s)*g_score(1,:)';

    end
end
new_img10_smooth = abs(new_img10_smooth);
figure()
gray1_s = mat2gray(new_img10_smooth(2*sigma_s+1:m-2*sigma_s,2*sigma_s+1:n-2*sigma_s));
imshow(gray1_s);
figure()
surf(new_img10_smooth(4*sigma_s+1:m-4*sigma_s, 4*sigma_s+1:n-4*sigma_s));
xlabel('x');
ylabel('y');
zlabel('m(x,y)');
shading interp;

segment(new_img10_smooth, img1, 24, 3.6e-9);

%% texture2
F = 0.059;
theta = 135;
sigma = 8;
hx_score = zeros(1,4*sigma+1);
hy_score = zeros(1,4*sigma+1);
for i = 1:4*sigma+1
    hx_score(i) = hx(F, theta, sigma,i-2*sigma-1);
    hy_score(i) = hy(F, theta, sigma,i-2*sigma-1);
end

img2 = imread('texture2.gif');
img2 = cast(img2, 'double');
figure()
imshow(img2);
title('texture2');
[m,n] = size(img2);
new_img2 = zeros(m,n);
new_img20 = zeros(m,n);
for i = 2*sigma+1:m-sigma*2
    for j = 2*sigma+1:n - sigma*2
        new_img2(i,j) = hx_score(1,:)*img2(i-2*sigma:i+2*sigma,j);
    end
end

for i = 2*sigma+1:m-sigma*2
    for j = 2*sigma+1:n - sigma*2
        new_img20(i,j) =  new_img2(i, j-2*sigma:j+2*sigma)*hy_score(1,:)';
    end
end
new_img20 = abs(new_img20);
figure()
gray2 = mat2gray(new_img20(2*sigma+1:m-2*sigma, 2*sigma+1:n-2*sigma));
imshow(gray2);
figure()
surf(new_img20(4*sigma+1:m-4*sigma, 4*sigma+1:n-4*sigma));
xlabel('x');
ylabel('y');
zlabel('m(x,y)');
shading interp;

% Smooth
sigma_s = 24;
g_score = zeros(1,4*sigma_s+1);
for i = 1:4*sigma_s+1
    g_score(i) = g(sigma_s,i-2*sigma_s-1);
end
[m,n] = size(new_img2);
new_img2_smooth = zeros(m,n);
new_img20_smooth = zeros(m,n);

for i = 2*sigma_s+1:m-sigma_s*2
    for j = 2*sigma_s+1:n - sigma_s*2
        new_img2_smooth(i,j) = g_score(1,:)*new_img2(i-2*sigma_s:i+2*sigma_s,j);
    end
end

for i = 2*sigma_s+1:m-sigma_s*2
    for j = 2*sigma_s+1:n - sigma_s*2
        new_img20_smooth(i,j) =  new_img2_smooth(i, j-2*sigma_s:j+2*sigma_s)*g_score(1,:)';
    end
end
new_img20_smooth = abs(new_img20_smooth);


figure()
gray2_s = mat2gray(new_img20_smooth(2*sigma_s+1:m-2*sigma_s, 2*sigma_s+1:n-2*sigma_s));
imshow(gray2_s);
figure()
surf(new_img20_smooth(4*sigma_s+1:m-4*sigma_s, 4*sigma_s+1:n-4*sigma_s));
xlabel('x');
ylabel('y');
zlabel('m(x,y)');
shading interp;
segment(new_img20_smooth,img2, 24,9*1e-8);

%% d9d77
F = 0.063;
theta = 60;
sigma = 36;
hx_score = zeros(1,4*sigma+1);
hy_score = zeros(1,4*sigma+1);
for i = 1:4*sigma+1
    hx_score(i) = hx(F, theta, sigma,i-2*sigma-1);
    hy_score(i) = hy(F, theta, sigma,i-2*sigma-1);
end

img3 = imread('d9d77.gif');
figure();
imshow(img3);
title('d9d77');
img3 = cast(img3, 'double');
[m,n] = size(img3);
new_img3 = zeros(m,n);
new_img30 = zeros(m,n);
for i = 2*sigma+1:m-sigma*2
    for j = 2*sigma+1:n - sigma*2
        new_img3(i,j) = hx_score(1,:)*img3(i-2*sigma:i+2*sigma,j);
    end
end

for i = 2*sigma+1:m-sigma*2
    for j = 2*sigma+1:n - sigma*2
        new_img30(i,j) =  new_img3(i, j-2*sigma:j+2*sigma)*hy_score(1,:)';
    end
end
new_img30 = abs(new_img30);
figure()
gray3 = mat2gray(new_img30(2*sigma+1:m-sigma*2, 2*sigma+1:n-sigma*2));
imshow(gray3);
figure()
surf(new_img30(3*sigma+1:m-sigma*3, 3*sigma+1:n-sigma*3));
xlabel('x');
ylabel('y');
zlabel('m(x,y)');
shading interp;
%Segmentation
segment(new_img30, img3, 20,0.5e-3);

%% d4d29
F = 0.6038;
theta = -50.5;
sigma = 8;
hx_score = zeros(1,4*sigma+1);
hy_score = zeros(1,4*sigma+1);
for i = 1:4*sigma+1
    hx_score(i) = hx(F, theta, sigma,i-2*sigma-1);
    hy_score(i) = hy(F, theta, sigma,i-2*sigma-1);
end

img4 = imread('d4d29.gif');
figure();
imshow(img4);
title('d4d29');
img4 = cast(img4, 'double');
[m,n] = size(img4);
new_img4 = zeros(m,n);
new_img40 = zeros(m,n);
for i = 2*sigma+1:m-sigma*2
    for j = 2*sigma+1:n - sigma*2
        new_img4(i,j) = hx_score(1,:)*img4(i-2*sigma:i+2*sigma,j);
    end
end

for i = 2*sigma+1:m-sigma*2
    for j = 2*sigma+1:n - sigma*2
        new_img40(i,j) =  new_img4(i, j-2*sigma:j+2*sigma)*hy_score(1,:)';
        %new_img40(i,j) = abs(new_img40(i,j));
    end
end
new_img40 = abs(new_img40);

figure()
gray4=mat2gray(new_img40(2*sigma+1:m-sigma*2, 2*sigma+1:n-sigma*2));
imshow(gray4)
figure()
surf(new_img40(2*sigma+1:m-sigma*2, 2*sigma+1:n-sigma*2));
xlabel('x');
ylabel('y');
zlabel('m(x,y)');
shading interp;

% Smooth
sigma_s = 30;
g_score = zeros(1,4*sigma_s+1);
for i = 1:4*sigma_s+1
    g_score(i) = g(sigma_s,i-2*sigma_s-1);
end
[m,n] = size(new_img4);
new_img4_smooth = zeros(m,n);
new_img40_smooth = zeros(m,n);

for i = 2*sigma_s+1:m-sigma_s*2
    for j = 2*sigma_s+1:n - sigma_s*2
        new_img4_smooth(i,j) = g_score(1,:)*new_img40(i-2*sigma_s:i+2*sigma_s,j);
    end
end

for i = 2*sigma_s+1:m-sigma_s*2
    for j = 2*sigma_s+1:n - sigma_s*2
        new_img40_smooth(i,j) =  new_img4_smooth(i, j-2*sigma_s:j+2*sigma_s)*g_score(1,:)';
    end
end
new_img40_smooth = abs(new_img40_smooth);

figure()
gray4_s = mat2gray(new_img40_smooth(2*sigma_s+1:m-sigma_s*2, 2*sigma_s+1:n-sigma_s*2));
imshow(gray4_s);
figure()
surf(new_img40_smooth(3*sigma_s+1:m-sigma_s*3, 3*sigma_s+1:n-sigma_s*3));
xlabel('x');
ylabel('y');
zlabel('m(x,y)');
shading interp;
segment(new_img40_smooth, img4, 20, 9.9e-9);