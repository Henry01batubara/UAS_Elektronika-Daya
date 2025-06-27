Vin = 36;
Vo = 18;
D = Vo/Vin;
fsw = 100e3;
Rload = Vo^2/60;  % Pout = 60W → R = V^2/P = 5.4Ω
R_change = 10;

IL = Vo/Rload;
Iout_ripple = 0.2 * IL;
Vout_ripple = 0.02 * Vo;

L = (Vo * (1 - D)) / (Iout_ripple * fsw);    % 1.35e-4
C = (Iout_ripple) / (8 *fsw * Vout_ripple);    % 2.31e-6


% OUTER LOOP (Voltage)

outer_Fbp = fsw / 20;              % Bandwidth Proportional Voltage (5 kHz)
outer_Fbi = outer_Fbp / 10;        % Bandwidth Integral Voltage (500 Hz)

outer_Kp  = 2 * pi * outer_Fbp * C;           % Kp_v = 2πfC
outer_Ki  = 2 * pi * outer_Fbi * outer_Kp;    % Ki_v = 2πf * Kp

% INNER LOOP (Current)

inner_Fbp = fsw / 200;              % Bandwidth Proportional Current (500 Hz)
inner_Kp  = 2 * pi * inner_Fbp * L;           % Kp_i = 2πfL



