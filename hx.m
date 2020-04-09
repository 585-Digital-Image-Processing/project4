function a = hx(F, theta, sigma, x)
% This function implements h(x,y) separable
% Input is F, theta, sigma, and x
% Output is the result after gabor filter
a = 1/(2*pi*sigma^2) * exp(-x^2/(2*sigma^2))*exp(complex(0, 2*pi *F*x*sind(theta)));

end