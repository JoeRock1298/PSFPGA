%%
% Generación de ficheros para TB_CIC (Testeo del módulo CIC completo)
%% 
graficas_si = 1; % 1 -> si; 0 -> no
ficheros_si = 1; % 1 -> si; 0 -> no
sim_time = 0.02;
%% CONFIGURATION


%% Parameters
fs = 100000; %% kHz Frecuencia de muestreo
fo = 15; %% Frecuencia de la señal
Win = 16; %% cuantificación de los datos de entrada
Win_f = 15; %% parte fraccional de los datos de entrada
Wc = 18; %% Bits para cuantificar los coeficientes
Wc_f = 16; %% Parte fraccional de los coeficientes
%% Coeficientes del filtro (en formato entero)
h_comp = [-8043 114390 -8043];
     


%% Convertir a binario los coeficientes del filtro
q = quantizer([Wc Wc_f],'fixed','wrap','floor')
h_q = quantize(q, h_comp*2^-Wc_f); %% Cuantificamos
h_bin = num2bin(q,h_q); %% Convertimos a binario

%% Escribir los coeficientes en el fichero
fB = sprintf(['coef.txt']);
packB = fopen(fB,'w')
for i=1:length(h_comp)
   fprintf(packB,h_bin(i,:));
   fprintf(packB,'\n');
end
fclose(packB);

M=1;


%% Simulink
sim('Filtro_compensa_DAC.mdl');

%% Graficas INPUT / OUTPUT
L_s_in= length(s_in);
if graficas_si ==1
        subplot(2,1,1)
        plot((1:L_s_in),s_in(1:L_s_in))
        ylabel('s\_in(n)')
        xlabel('n')
        axis([0 L_s_in -1 1])
        subplot(2,1,2)
        sal_out(1:L_s_in) = s_out_double(1:L_s_in);
        plot((1:L_s_in),sal_out);
        ylabel('s\_out(n)')
        axis([0 L_s_in -1 1])
        xlabel('n')
end

%% Generacion de ficheros de datos
if ficheros_si == 1
    % s_in 

    Dout_e=s_in*2^(Win_f);

    %% Escritura de ficheros de datos de entrada
     q_in = quantizer([Win Win_f],'fixed','wrap','floor');
     Dout_eq = quantize(q_in,s_in);
     [m,n] = size(Dout_eq);
    
    f=sprintf(['s_FC_DAC_in.txt']);
    pack_f=fopen(f,'w');

    for i=1:length(s_in)
       fprintf(pack_f,num2bin(q_in,Dout_eq(i)));
       
       fprintf(pack_f,'\n');
    end

    fclose(pack_f);

    % s_out

    fC=sprintf(['s_FC_DAC_out.txt']);
    packC=fopen(fC,'w');

    Dout_s=s_out_double*2^((Wc+Win-3));
    
     %% Cuantificamos a [(Wc+Win)]
      Wout = Win+Wc+1;
      Wout_f = Win+Wc-3;
      qout=quantizer([Wout Wout_f ],'fixed','wrap','floor')
      Dout_q = quantize(qout, s_out_double); %% Cuantificamos
      Dout_bin = num2bin(qout,Dout_q); %% Convertimos a binario
     [m,n] = size(Dout_bin);
    for i=1:length(s_in)
        fprintf(packC,Dout_bin(i,:));
        fprintf(packC,'\n');
    end

    fclose(packC);
    
end
