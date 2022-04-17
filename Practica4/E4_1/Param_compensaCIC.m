%%
% Generación de ficheros para TB_CIC (Testeo del filtro compensador CIC)
%% 
graficas_si = 0; % 1 -> si; 0 -> no
ficheros_si = 1; % 1 -> si; 0 -> no
sim_time = 0.002;
%% CONFIGURATION
% Señal de entrada
sel = 0; %% 0 -> Sin; 1-> Chirp; 2 -> Impulse;

%% Parameters
fs = 50000; %% Frecuencia de muestreo
fo = 15000; %% Frecuencia de la señal

Win = 16; %% Cuantificación de los datos de entrada
Win_f = 15; %% Parte fraccional de los datos de entrada

Wc = 18; %% Bits para cuantificar los coeficientes
Wc_f = 16; %% Parte fraccional de los coeficientes

Wout = 19; %% Cuantificación de los datos de salida 
Wout_f = 16; %% Parte fraccional de los datos de salida
%% Coeficientes del filtro (en formato entero)
h_comp = [   
         640
         710
        -985
        1260
       -1145
        -100
        4458
      -19111
       86137
      -19111
        4458
        -100
       -1145
        1260
        -985
         710
         640
];
     
% Señales de control entrada
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

%% Convertir a binario los coeficientes del filtro
q = quantizer([Wc Wc_f],'fixed','wrap','floor');
h_q = quantize(q, h_comp*2^-Wc_f); %% Cuantificamos
h_bin = num2bin(q,h_q); %% Convertimos a binario

%% Escribir los coeficientes en el fichero
fB = sprintf(['coef.txt']);
packB = fopen(fB,'w');
for i=1:length(h_comp)
   fprintf(packB,h_bin(i,:));
   fprintf(packB,'\n');
end
fclose(packB);

M=1;


%% Simulink
sim('Filtro_compensa_CIC.slx');
1-2^-(Win-1);

%% Graficas INPUT / OUTPUT
L_s_in= length(s_in);
if graficas_si ==1
        subplot(2,1,1)
        sal_in(1:L_s_in) = s_in(1,1,1:L_s_in);
        plot((1:L_s_in),sal_in);
        ylabel('s\_in(n)')
        xlabel('n')
        axis([0 L_s_in -1 1])
        subplot(2,1,2)
        sal_out(1:L_s_in) = s_out(1,1,1:L_s_in);
        plot((1:L_s_in),sal_out);
        ylabel('s\_out(n)')
        axis([0 L_s_in -1 1])
        xlabel('n')
end

%% Generacion de ficheros de datos
if ficheros_si == 1
  

    

    %% Escritura de ficheros de datos de entrada
     q_in = quantizer([Win Win_f],'fixed','wrap','floor');
     Dout_eq = quantize(q_in,s_in);
     [m,n] = size(Dout_eq);
    
    f=sprintf(['s_FC_CIC_in.txt']);
    pack_f=fopen(f,'w');

    for i=1:length(s_in)
       fprintf(pack_f,num2bin(q_in,Dout_eq(i)));
     
       fprintf(pack_f,'\n');
    end

    fclose(pack_f);

    % s_out

    fC=sprintf(['s_FC_CIC_out1.txt']);
    packC=fopen(fC,'w');

%    Dout_s=s_out*2^((Wc+Win-3)); %No ha e falta escalado porque se mantiene todo en el mismo rango.
%     
%    %% Cuantificamos con precision completa 
     %Wout = Win+Wc;
     %Wout_f = Win_f + Wc_f;

     %% Cuantificamos a 19.16
     Wout = 19;
     Wout_f = 16;
     qout=quantizer([Wout Wout_f ],'fixed','wrap','floor');
     Dout_q = quantize(qout, s_out); %% Cuantificamos
     Dout_bin = num2bin(qout,Dout_q); %% Convertimos a binario
     [m,n] = size(Dout_bin);
    for i=1:length(s_in)
        fprintf(packC,Dout_bin(i,:));
        fprintf(packC,'\n');
    end

    fclose(packC);
    
end

%% Getting the CIC and compensator filter frecuency response
%graficas_si = 0;
if graficas_si ==1
    % Calculating CIC filter coefficients
    N = 3;
    M = 1;
    R = 2000;
    h1 = ones(R*M, 1);
    hcic = 1;
    for i=1:N
        hcic = conv(h1, hcic);
    end
    % Plotting CIC filter frequency response
    figure
    freqz(hcic,1)
    title("CIC filter frequency response    "); 
    % Plotting CIC-compensator filter frequency response
    figure
    freqz(h_q,1)
    title("CIC-compensator filter frequency response");
end
% Cuantificación del filtro
% ganancia del filtro nos indicará el crecimiento
% ganancia = sum(abs(h_i))










