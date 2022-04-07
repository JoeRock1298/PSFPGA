%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Generaci�n de ficheros para TB_CIC (Testeo del m�dulo CIC completo)
%   Curso 2020-2021
%   Versi�n para alumnos
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ------------------Configuracion-----------------------------------------
graficas_si = 1; % 1 -> si; 0 -> no
ficheros_si = 1; % 1 -> si; 0 -> no

% Se�al de entrada
sel = 0; %% 0 -> Sin; 1-> Chirp; 2 -> Square;

% Input Frequency (kHz)
fo= 10; % kHz
n_ciclos = 10; %% Num ciclos

Tsim = n_ciclos*1e-3/(fo); %% Simulation time

% Sample frequency (kHz)
fsL=50; % kHz

% CIC config
R = 2000; %% Interpolator Factor
M=1;
% Wordlengths
Wg = 22;  %% Calculate Filter Growth
Win = 16;  %% W input
Fin = 15;  %% frac
Wout = Win+Wg; %% Output full precision
%Wout = Win; %% Output Win bits

% ------------------Configuration END--------------------------------------


% Se�ales de control entrada
switch(sel)
    case 0
        sel_b = [0 0];
    case 1
        sel_b = [0 1];
    case 2
        sel_b = [1 0];
    case 3
        sel_b = [1 1];
    otherwise
        sel_b = [0 0];
end






%% Simulink
sim('CIC.slx');

%% Graficas INPUT / OUTPUT
L_s_in= length(s_in);
L_sout = length(s_out);
if graficas_si ==1
        subplot(2,1,1)
        plot((1:L_s_in),s_in(1:L_s_in))
        ylabel('s\_in(n)')
        xlabel('n')
        axis([0 L_s_in -1 1])
        subplot(2,1,2)
        plot((1:L_sout),s_out(1:L_sout)*2^-(Wg));
        ylabel('s\_out(n)')
        axis([0 L_sout -1 1])
        xlabel('n')
end

%% Generacion de ficheros de datos
if ficheros_si == 1
    % s_in 
    fB=sprintf(['s_CIC_in.txt']);
    packB=fopen(fB,'w');
    
    Dout_e=s_in*2^(Win-1);
    

    for i=1:length(Dout_e)
        fprintf(packB,num2str(Dout_e(i)));
        fprintf(packB,'\n');
    end
    fclose(packB);


    
    % s_out
    fB=sprintf(['s_CIC_out.txt']);
    packB=fopen(fB,'w');
    
    
    %% Cuantificamos a Wout.Wout-1
    q = quantizer([Wout Wout-1],'fixed','wrap','floor')

    Dout_q = quantize(q, s_out*2^-Wg); %% Cuantificamos
    Dout_bin = num2bin(q,Dout_q); %% Convertimos a binario
    [m,n] = size(Dout_bin);
    for i=1:m
       fprintf(packB,Dout_bin(i,1:(Wout)));
       fprintf(packB,'\n');
    end

    fclose(packB);
    
end
