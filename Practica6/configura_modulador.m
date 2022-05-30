clear all
close all
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Operation configuration 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
WRITE = 1; % Escritura si -> 1, no ->0
READ = 1; % Lectura si -> 1, no ->0

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% MOD AM/FM CONFIGURATION
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Control Power: ON-->1, OFF-->0
control_on_off=1;

% Control Mode: FM-->1, AM-->0
control_fm_am=1;

% Modulator source signal: SIN ->0; RAMP->1; SQR->2 AUDIO_CODEC->3;
source_sel = 2;

% FM modulation index (kHz)
Kfm=5000; % kHz

% AM modulation index (range [0,1[)
m_am=1*(1-2^-15);

% Carrier frequency (MHz)
fc=1; % MHz

% Modulating frequency (kHz)
fmod= 1; % kHz

% Sampling frequency (MHz)
fsc=100; % MHz

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Bytes configuration
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
conf_mod_filter_design
% frec_mod registers
frec_mod = round(2^Macc*fmod*1e-3/(fsc/f_interpolacion));
vector_frec_mod = decimalToBinaryVector(frec_mod, 24);
frec_mod_b0 = vector_frec_mod(1:8);
frec_mod_b1 = vector_frec_mod(9:16);
frec_mod_b2 = vector_frec_mod(17:24);
% frec_por register
frec_por = round(fc/fsc*2^24);
vector_frec_por = decimalToBinaryVector(frec_por, 24);
frec_por_b0 = vector_frec_por(1:8);
frec_por_b1 = vector_frec_por(9:16);
frec_por_b2 = vector_frec_por(17:24);
% im_am registers
im_am = round(m_am*2^15);
vector_im_am = decimalToBinaryVector(im_am, 16);
im_am_b0 = vector_im_am(1:8);
im_am_b1 = vector_im_am(9:16);
% im_fm registers
im_fm = round(Kfm*1e-3/fsc*2^16);
vector_im_fm = decimalToBinaryVector(im_fm, 16);
im_fm_b0 = vector_im_fm(1:8);
im_fm_b1 = vector_im_fm(9:16);
% Control register
c_byte = (2^0 * control_on_off) + (2^1 * control_fm_am) + (2^2 * source_sel);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Configure and open serial port
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Open serial port
%  buffer 4 bytes
buffSize=4;
portID = serial('COM1');  % Comprobar el puerto COMx
portID.BaudRate = 57600;
portID.DataBits = 8;
portID.Parity = 'none';
portID.StopBits = 1;
portID.FlowControl = 'none';
portID.Timeout = 2;
portID.InputBufferSize = buffSize;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Write registers 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if WRITE == 1
 % Abrir puerto
 fopen(portID)
 % Envio instruccion
 fwrite(portID,hex2dec('0F'))
 % Envio 11 bytes
 fwrite(portID,frec_mod_b0)
 fwrite(portID,frec_mod_b1)
 fwrite(portID,frec_mod_b2)
 fwrite(portID,frec_por_b0)
 fwrite(portID,frec_por_b1)
 fwrite(portID,frec_por_b2)
 fwrite(portID,im_am_b0)
 fwrite(portID,im_am_b1)
 fwrite(portID,im_fm_b0)
 fwrite(portID,im_fm_b1)
 fwrite(portID,c_byte)
 % Cierro el puerto
 fclose(portID)
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Read registers 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if READ == 1
 % Abre puerto
 fopen(portID)
 % Envio instruccion lectura
 fwrite(portID,hex2dec('F0'))
 % Leo 11 bytes
 r_frec_mod_b0 = fread(portID,1);
 r_frec_mod_b1 = fread(portID,1);
 r_frec_mod_b2 = fread(portID,1);
 r_frec_por_b0 = fread(portID,1);
 r_frec_por_b1 = fread(portID,1);
 r_frec_por_b2 = fread(portID,1);
 r_im_am_b0 = fread(portID,1);
 r_im_am_b1 = fread(portID,1);
 r_im_fm_b0 = fread(portID,1);
 r_im_fm_b1 = fread(portID,1);
 r_c_byte = fread(portID,1);
 % Cierra puerto
 fclose(portID)
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Print Parameters
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
param_frec_mod = (2^0 * binaryVectorToDecimal(r_frec_mod_b2)) + (2^8 * binaryVectorToDecimal(r_frec_mod_b1)) + (2^16 * binaryVectorToDecimal(r_frec_mod_b0))
param_frec_por = (2^0 * binaryVectorToDecimal(r_frec_por_b2)) + (2^8 * binaryVectorToDecimal(r_frec_por_b1)) + (2^16 * binaryVectorToDecimal(r_frec_por_b0))
param_im_am = (2^0 * binaryVectorToDecimal(r_im_am_b1)) + (2^8 * binaryVectorToDecimal(r_im_am_b0))
param_im_fm = (2^0 * binaryVectorToDecimal(r_im_fm_b1)) + (2^8 * binaryVectorToDecimal(r_im_fm_b0))
param_c_byte = binaryVectorToDecimal(r_c_byte)
param_control_on_off = r_c_byte(1)
param_control_fm_am = r_c_byte(2)
param_source_sel = (r_c_byte(3) * 2^0) + (r_c_byte(4) * 2^1)
