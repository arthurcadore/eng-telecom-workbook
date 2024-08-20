clear all; close all; clc;
 %---------------------------------------pré distorçao -------------------
 wp = 0.2*pi;
 wr = 0.3*pi;
 ts = 2;

 omega_ap = (2/ts)*tan(wp/2)
 omega_ar = (2/ts)*tan(wr/2)

 a = 1;
 omega_p_linha = 1/a

 omega_r_linha = omega_p_linha * (omega_ar/omega_ap)

 sigma_p = 0.9;
 sigma_r = 0.2;

 atenuacao_p = -1 * (20*log10(sigma_p))
 atenuacao_r = -1 * (20*log10(sigma_r))

 eps = sqrt((10^(0.1*atenuacao_p))-1)

 numerador = log10((10^(0.1*atenuacao_r)-1) / eps^2);
 denominador = 2*log10(omega_r_linha);


 n = ceil(numerador/denominador)


 % utilizando a expressâo -> 1 + e^2 (-s^2)^n = 0)

 roots([eps^2 0 0 0 0 0 0 0 0 0 0 0 1])

 %--------- obtemos --------------
 % -1.0900 + 0.2921i
 % -1.0900 - 0.2921i
 % -0.7979 + 0.7979i
 % -0.7979 - 0.7979i
 % -0.2921 + 1.0900i
 % -0.2921 - 1.0900i

 poly([-1.0900 + 0.2921i
 -1.0900 - 0.2921i
 -0.7979 + 0.7979i
 -0.7979 - 0.7979i
 -0.2921 + 1.0900i
 -0.2921 - 1.0900i])

 %-------obtemos-------
 % 1.0000 4.3600 9.5048 13.1362 12.1033 7.0697 2.0648

 %h'(s') = 2.0648 / 1s'6 + 4.3600s'5 + 9.5048s'4 + 13.1362s'3 + 12.1033s'2 + 7.0697s +
2.0648

%para desnormalizar; utilizamos a expressão s = (1/a)*(s/omega_ap) e
%substituimos os valores; achando o mínimo comun obtivemos:

%h(s) = 0.0024 / 1s^6 1.4166s^5 + 1.0034s^4 + 0.4506s^3 + 0.1349s^2+ 0.0256s + 0.0024

b = [0.0024]
a = [1 1.4166 1.0034 0.4506 0.1349 0.0256 0.0024]
fs = 1/ts;

[numerador, denominador] = bilinear(b,a,fs)

freqz(numerador, denominador)