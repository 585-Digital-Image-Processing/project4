function Y = segment(X, threshold)
Y = (X >= threshold);
imshow(Y*255);

end