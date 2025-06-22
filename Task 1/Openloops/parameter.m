Vin = 36;
Vo = 18;
D = Vo/Vin;
fsw = 100e3;
Rload = Vo^2/60;  % Pout = 60W → R = V^2/P = 5.4Ω

IL = Vo/Rload;
Iout_ripple = 0.2 * IL;
Vout_ripple = 0.02 * Vo;

L = (Vo * (1 - D)) / (Iout_ripple * fsw);    
C = (Iout_ripple) / (8 *fsw * Vout_ripple);    