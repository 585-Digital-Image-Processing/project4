function a = hy(F, theta, sigma, y)
% This function implements h(x,y) separable
% Input is F, theta, sigma, and x
% Output is the result after gabor filter
a = 1/(2*pi*sigma^2) * exp(-y^2/(2*sigma^2))*exp(complex(0, 2*pi*F*y*sind(theta)));

end