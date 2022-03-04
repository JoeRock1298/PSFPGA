clear all
warning off
clc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Lab E1: DDS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Generaci�n de ficheros de test
file_test_gen = 1; %1-> s�; 0->no
file_dir = './';
%% Configuraci�n DDS
% Accumulator length
M = 24 % bits

% Accumulator truncated phase (L <= M)
L = 15 % bits

% Sine LUT word-lemgth
W = 16 % bits

% DDS clock frequency : Sampling frequency (kHz)
fclk = 100; %MHz in modelsim

% DDS generated frequency (kHz)
fo = 1; %MHz in modelsim

% Accumulator step Pe
Pe = fo/fclk;

% Number of period to display 
n_periods_to_display = 5;



%% Simulation time
sim_time = n_periods_to_display/fo;

if L>M
    display ('ERROR: L debe ser menor o igual a M')
end
sim('DDS_test.mdl')

figure(101)
t = (0:length(sin_wave)-1)/fclk;
plot(t,sin_wave)
legend('sin\_wave')
ylabel('Amplitud')
xlabel('t')

%% Test files
if file_test_gen == 1
    % Configuration file
    f=sprintf([file_dir 'config_Pe_DDS.txt']);
    pack_f=fopen(f,'w');
    fprintf(pack_f,[num2str(Pe*2^M) '\n']);
    fclose(pack_f);
    
    % output files
    q_out = quantizer([W W-1],'saturate','floor');
    f=sprintf([file_dir 'out_waves.txt']);
    pack_f=fopen(f,'w');
    for i=1:length(sin_wave)
       fprintf(pack_f,[num2bin(q_out,sin_wave(i)) '\n']);
    end
    fclose(pack_f);
end