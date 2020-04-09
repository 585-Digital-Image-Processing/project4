function Y = segment(X, A, sigma, threshold)
%input: X is the image to decide threshold, A is the original image
%       sigma is the distance to the edge

[m,n] = size(X);
Y = (X >= threshold);
Y= Y*255;
Y([1:4*sigma m-4*sigma + 1:m],:) = 125; 
Y(:,[1:4*sigma n-4*sigma + 1:n]) = 125;
%A = cat(3, A, Y, zeros(size(A)));
A = imfuse(A,Y, 'ColorChannels', 'red-cyan');
figure();
imshow(A);
fprintf('The part that could be segemented is: \n');
fprintf('x: %d to %d; y: %d to %d. \n', 4*sigma + 1, m-4*sigma, 4*sigma + 1, n-4*sigma);
end