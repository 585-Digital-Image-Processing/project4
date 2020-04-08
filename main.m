
%%
F = 0.059;
theta = 135;
sigma = 8;
hx_score = zeros(1,512);
hy_score = zeros(1,512);
for i = 1:512
    hx_score(i) = hx(F, theta, sigma,i);
    hy_score(i) = hy(F, theta, sigma,i);
end

img1 = imread('texture1.gif');
img1 = cast(img1, 'double');
img1 = img1*255;
imshow(img1);
title('texture1');
[m,n] = size(img1);
new_img1 = img1;
for i = 2*sigma+1:m-sigma*2
    for j = 2*sigma+1:n - sigma*2 
        original = img1(i,j);
        img1(i,j) = hx_score(i-2*sigma:i+2*sigma)*img1(i-2*sigma:i+2*sigma,j);
        new_img1(i,j) = img1(i, j-2*sigma:j+2*sigma)*hy_score(j-2*sigma:j+2*sigma)';
        new_img1(i,j) = abs(new_img1(i,j));
        img1(i,j) = original;
    end
end

for i = 1:sigma*2-1
    for j = 1:sigma*2-1       
        new_img1(i,j) = 0;
    end
end

for i = m-sigma*2+1:m
    for j = n-sigma*2+1:n     
        new_img1(i,j) = 0;
    end
end

imshow(new_img1);
surf(1:512, 1:512, new_img1);
xlabel('x');
ylabel('y');
zlabel('m(x,y)');



 