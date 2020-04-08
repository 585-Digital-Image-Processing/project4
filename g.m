function output = g(sigma, x)
% This function implements circularly-symmetric Gaussian.
% Input is the value of sigma, the coordinates x and y of the pixel.
% Output is the computation result of circularly-symmetric Gaussian.

output = (1/(2*pi*sigma^2))*exp(-(x^2)/(2*sigma^2));

end

