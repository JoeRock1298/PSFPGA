clear all
close all
%% MOD AM/FM CONFIGURATION

% Control FM --> 1, AM --> 0
control_fm_am=1;

% Sampling frequency (MHz)
fsc=100; % MHz

% Carrier frequency (MHz)
fc=1; % MHz

% AM modulation index (range [0,1[)
m_am=1*(1-2^-15);

% FM modulation index (kHz)
Kfm=5000; % kHz

% Modulator source signal: SIN ->0; RAMP->1; SQR->2;
source_sel = 0;

% Modulating frequency (kHz)
fmod= 1; % kHz


