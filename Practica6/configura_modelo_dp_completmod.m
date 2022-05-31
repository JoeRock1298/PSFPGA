clear all
close all
warning ('off','all');
 
%%
sim_time = 2000;
%% MOD AM/FM CONFIGURATION

% Control FM --> 1, AM --> 0
control_fm_am=0;

% Sampling frequency (MHz)
fsc=100; % MHz

% Carrier frequency (MHz)
fc=1; % MHz

% AM modulation index (range [0,1[)
m_am=1*(1-2^-15);

% FM modulation index (kHz)
Kfm=5000; % kHz

% Modulator source signal: SIN ->0; RAMP->1; SQR->2;
source_sel = 2;

% Modulating frequency (kHz)
fmod= 2; % kHz


conf_mod_filter_design

%% Simulink
sim('modelo_dp_completmod');

%% Verilog simulation values
frec_por = round(fc/fsc*2^24);
im_am = round(m_am*2^15);
im_fm = round(Kfm*1e-3/fsc*2^16);
Pfrec_mod = round(2^Macc*fmod*1e-3/(fsc/f_interpolacion));
disp(' ')
disp('*****************************************')
disp('Values for HDL simulation')
disp('*****************************************')
disp(['c_fm_am = ' num2str(control_fm_am)])
disp(['c_source = ' num2str(source_sel)])
disp(['frec_mod = ' num2str(Pfrec_mod)])
disp(['frec_por = ' num2str(frec_por)])
disp(['im_am = ' num2str(im_am)])
disp(['im_fm = ' num2str(im_fm)])
disp('*****************************************')

%% Verilog obtain configuration, input and output files
% Configuración
    %Creando los cuantificadores para guardar los datos de configuración
    im_am_q = quantizer([16 15],'saturate','round','ufixed');
    im_fm_q = quantizer([16 16],'saturate','round','ufixed');
    freq_mod_q = quantizer([24 24],'saturate','round','ufixed');
    freq_por_q = quantizer([24 24],'saturate','round','ufixed');
    %File handling
    pack_f=fopen('configuration.txt','w');
    %Writing data to output file
    fprintf(pack_f,[num2str(control_fm_am) '\n' ... %c_fm_am
                    dec2bin(source_sel) '\n' ... %c_source
                    num2bin(freq_mod_q, Pfrec_mod*2^-24) '\n' ... %frec_mod
                    num2bin(freq_por_q, frec_por*2^-24) '\n' ... %frec_por
                    num2bin(im_am_q, im_am*2^-15) '\n' ... %im_am
                    num2bin(im_fm_q, im_fm*2^-16)]); %im_fm
    fclose(pack_f);

% h__cic_comp
    %Creando los cuantificadores para guardar los datos de los coeficientes
    h_comp_cic_q = quantizer([18 16],'saturate','round','fixed');
    %File handling
    pack_f=fopen('coef.txt','w');
    %Writing data to output file
    for i=1:length(h_comp_cic)
        fprintf(pack_f,[num2bin(h_comp_cic_q, h_comp_cic(i)) '\n']);
    end
% Input
    %Creando los cuantificadores para guardar los datos de los coeficientes
    input_q = quantizer([16 15],'fixed','wrap','floor');
    %File handling
    pack_f=fopen('input_signal.txt','w');
    %Writing data to output file
    for i=1:length(out_in_mux)
        fprintf(pack_f,[num2bin(input_q, out_in_mux(i)) '\n']);
    end
% Output
    %Creando los cuantificadores para guardar los datos de los coeficientes
    output_q = quantizer([14 13],'fixed','wrap','floor');
    %File handling
    pack_f=fopen('output_signal.txt','w');
    %Writing data to output file
    for i=1:length(s_dp_fmam)
        fprintf(pack_f,[num2bin(output_q, s_dp_fmam(i)) '\n']);
    end
    