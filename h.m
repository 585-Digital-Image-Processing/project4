function a = h(F, theta, sigma, x)

a = 1/(2*pi*sigma^2) * exp(-x^2/(2*sigma^2))*exp(complex(0, 2*pi *F*x*cosd(theta)));

end