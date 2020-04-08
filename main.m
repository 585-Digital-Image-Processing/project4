
%% texture 1
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
imshow(img1);
title('texture1');
[m,n] = size(img1);
new_img1 = zeros(m,n);
for i = 2*sigma+1:m-sigma*2
    for j = 2*sigma+1:n - sigma*2 
        original = img1(i,j);
        img1(i,j) = hx_score(1,:)*img1(i-2*sigma:i+2*sigma,j);
        new_img1(i,j) = img1(i, j-2*sigma:j+2*sigma)*hy_score(1,:)';
        new_img1(i,j) = abs(new_img1(i,j));
        img1(i,j) = original;
    end
end

%imshow(new_img1);
surf(1:512, 1:512, new_img1);
xlabel('x');
ylabel('y');
zlabel('m(x,y)');

%% texture2
F = 0.042;
theta = 0;
sigma = 24;
hx_score = zeros(1,4*sigma+1);
hy_score = zeros(1,4*sigma+1);
for i = 1:4*sigma+1
    hx_score(i) = hx(F, theta, sigma,i-2*sigma-1);
    hy_score(i) = hy(F, theta, sigma,i-2*sigma-1);
end

img2 = imread('texture2.gif');
img2 = cast(img2, 'double');
imshow(img2);
title('texture2');
[m,n] = size(img2);
new_img2 = zeros(m,n);
for i = 2*sigma+1:m-sigma*2
    for j = 2*sigma+1:n-sigma*2 
        original = img2(i,j);
        img2(i,j) = hx_score(1,:)*img2(i-2*sigma:i+2*sigma,j);
        new_img2(i,j) = img2(i, j-2*sigma:j+2*sigma)*hy_score(1,:)';
        new_img2(i,j) = abs(new_img2(i,j));
        img2(i,j) = original;
    end
end

%imshow(new_img1);
surf(1:512, 1:512, new_img2);
xlabel('x');
ylabel('y');
zlabel('m(x,y)');



 