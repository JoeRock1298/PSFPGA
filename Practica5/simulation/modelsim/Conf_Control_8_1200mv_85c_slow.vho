-- Copyright (C) 2017  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 17.1.1 Internal Build 593 12/11/2017 SJ Standard Edition"

-- DATE "05/23/2022 19:03:11"

-- 
-- Device: Altera EP4CE115F29C8 Package FBGA780
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	hard_block IS
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic
	);
END hard_block;

-- Design Ports Information
-- ~ALTERA_ASDO_DATA1~	=>  Location: PIN_F4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_FLASH_nCE_nCSO~	=>  Location: PIN_E2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DCLK~	=>  Location: PIN_P3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DATA0~	=>  Location: PIN_N7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_nCEO~	=>  Location: PIN_P28,	 I/O Standard: 2.5 V,	 Current Strength: 8mA


ARCHITECTURE structure OF hard_block IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~padout\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~padout\ : std_logic;
SIGNAL \~ALTERA_DATA0~~padout\ : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_DATA0~~ibuf_o\ : std_logic;

BEGIN

ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
END structure;


LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	CONF_CONTROL_WRAP IS
    PORT (
	rxsd : IN std_logic;
	rst : IN std_logic;
	clk : IN std_logic;
	txsd : OUT std_logic;
	sleds : OUT std_logic_vector(8 DOWNTO 0);
	r_control : OUT std_logic_vector(7 DOWNTO 0);
	r_frec_mod : OUT std_logic_vector(23 DOWNTO 0);
	r_frec_por : OUT std_logic_vector(23 DOWNTO 0);
	r_im_am : OUT std_logic_vector(15 DOWNTO 0);
	r_im_fm : OUT std_logic_vector(15 DOWNTO 0);
	view_rxdw : OUT std_logic_vector(7 DOWNTO 0)
	);
END CONF_CONTROL_WRAP;

-- Design Ports Information
-- rxsd	=>  Location: PIN_AD18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- txsd	=>  Location: PIN_AF16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sleds[0]	=>  Location: PIN_D26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sleds[1]	=>  Location: PIN_AD1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sleds[2]	=>  Location: PIN_A22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sleds[3]	=>  Location: PIN_H25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sleds[4]	=>  Location: PIN_AC22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sleds[5]	=>  Location: PIN_AF19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sleds[6]	=>  Location: PIN_AE2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sleds[7]	=>  Location: PIN_G9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sleds[8]	=>  Location: PIN_D5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_control[0]	=>  Location: PIN_AG8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_control[1]	=>  Location: PIN_AD12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_control[2]	=>  Location: PIN_C9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_control[3]	=>  Location: PIN_AH12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_control[4]	=>  Location: PIN_E21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_control[5]	=>  Location: PIN_AB23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_control[6]	=>  Location: PIN_AA14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_control[7]	=>  Location: PIN_H7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_frec_mod[0]	=>  Location: PIN_A21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_frec_mod[1]	=>  Location: PIN_AE7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_frec_mod[2]	=>  Location: PIN_V4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_frec_mod[3]	=>  Location: PIN_C8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_frec_mod[4]	=>  Location: PIN_V7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_frec_mod[5]	=>  Location: PIN_AA21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_frec_mod[6]	=>  Location: PIN_AD14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_frec_mod[7]	=>  Location: PIN_G18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_frec_mod[8]	=>  Location: PIN_AE6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_frec_mod[9]	=>  Location: PIN_AH26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_frec_mod[10]	=>  Location: PIN_AF7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_frec_mod[11]	=>  Location: PIN_AH8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_frec_mod[12]	=>  Location: PIN_G14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_frec_mod[13]	=>  Location: PIN_C20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_frec_mod[14]	=>  Location: PIN_R28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_frec_mod[15]	=>  Location: PIN_AF15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_frec_mod[16]	=>  Location: PIN_AC26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_frec_mod[17]	=>  Location: PIN_AD21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_frec_mod[18]	=>  Location: PIN_D25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_frec_mod[19]	=>  Location: PIN_U22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_frec_mod[20]	=>  Location: PIN_AC12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_frec_mod[21]	=>  Location: PIN_C11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_frec_mod[22]	=>  Location: PIN_B6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_frec_mod[23]	=>  Location: PIN_F14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_frec_por[0]	=>  Location: PIN_Y13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_frec_por[1]	=>  Location: PIN_D12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_frec_por[2]	=>  Location: PIN_D22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_frec_por[3]	=>  Location: PIN_AE23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_frec_por[4]	=>  Location: PIN_AF21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_frec_por[5]	=>  Location: PIN_AB5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_frec_por[6]	=>  Location: PIN_F8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_frec_por[7]	=>  Location: PIN_AC1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_frec_por[8]	=>  Location: PIN_AF9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_frec_por[9]	=>  Location: PIN_V28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_frec_por[10]	=>  Location: PIN_Y5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_frec_por[11]	=>  Location: PIN_R24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_frec_por[12]	=>  Location: PIN_AE5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_frec_por[13]	=>  Location: PIN_AC14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_frec_por[14]	=>  Location: PIN_AB17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_frec_por[15]	=>  Location: PIN_AH21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_frec_por[16]	=>  Location: PIN_H5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_frec_por[17]	=>  Location: PIN_J13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_frec_por[18]	=>  Location: PIN_AH18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_frec_por[19]	=>  Location: PIN_R2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_frec_por[20]	=>  Location: PIN_AE21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_frec_por[21]	=>  Location: PIN_AE8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_frec_por[22]	=>  Location: PIN_Y22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_frec_por[23]	=>  Location: PIN_U27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_im_am[0]	=>  Location: PIN_E8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_im_am[1]	=>  Location: PIN_AA19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_im_am[2]	=>  Location: PIN_AG21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_im_am[3]	=>  Location: PIN_K25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_im_am[4]	=>  Location: PIN_D11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_im_am[5]	=>  Location: PIN_C12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_im_am[6]	=>  Location: PIN_AD15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_im_am[7]	=>  Location: PIN_E19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_im_am[8]	=>  Location: PIN_D9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_im_am[9]	=>  Location: PIN_E1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_im_am[10]	=>  Location: PIN_C3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_im_am[11]	=>  Location: PIN_C25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_im_am[12]	=>  Location: PIN_D18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_im_am[13]	=>  Location: PIN_B26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_im_am[14]	=>  Location: PIN_AE24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_im_am[15]	=>  Location: PIN_V21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_im_fm[0]	=>  Location: PIN_AB19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_im_fm[1]	=>  Location: PIN_AC21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_im_fm[2]	=>  Location: PIN_AA8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_im_fm[3]	=>  Location: PIN_U4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_im_fm[4]	=>  Location: PIN_B7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_im_fm[5]	=>  Location: PIN_L2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_im_fm[6]	=>  Location: PIN_AA15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_im_fm[7]	=>  Location: PIN_B11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_im_fm[8]	=>  Location: PIN_AB18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_im_fm[9]	=>  Location: PIN_F22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_im_fm[10]	=>  Location: PIN_AD24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_im_fm[11]	=>  Location: PIN_E4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_im_fm[12]	=>  Location: PIN_E24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_im_fm[13]	=>  Location: PIN_B19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_im_fm[14]	=>  Location: PIN_R3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_im_fm[15]	=>  Location: PIN_A8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- view_rxdw[0]	=>  Location: PIN_AE18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- view_rxdw[1]	=>  Location: PIN_A3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- view_rxdw[2]	=>  Location: PIN_AE19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- view_rxdw[3]	=>  Location: PIN_W7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- view_rxdw[4]	=>  Location: PIN_AE20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- view_rxdw[5]	=>  Location: PIN_AH22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- view_rxdw[6]	=>  Location: PIN_AE22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- view_rxdw[7]	=>  Location: PIN_AH3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_AF5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rst	=>  Location: PIN_AC11,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF CONF_CONTROL_WRAP IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_rxsd : std_logic;
SIGNAL ww_rst : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_txsd : std_logic;
SIGNAL ww_sleds : std_logic_vector(8 DOWNTO 0);
SIGNAL ww_r_control : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_r_frec_mod : std_logic_vector(23 DOWNTO 0);
SIGNAL ww_r_frec_por : std_logic_vector(23 DOWNTO 0);
SIGNAL ww_r_im_am : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_r_im_fm : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_view_rxdw : std_logic_vector(7 DOWNTO 0);
SIGNAL \rxsd~input_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \rst~input_o\ : std_logic;
SIGNAL \txsd~output_o\ : std_logic;
SIGNAL \sleds[0]~output_o\ : std_logic;
SIGNAL \sleds[1]~output_o\ : std_logic;
SIGNAL \sleds[2]~output_o\ : std_logic;
SIGNAL \sleds[3]~output_o\ : std_logic;
SIGNAL \sleds[4]~output_o\ : std_logic;
SIGNAL \sleds[5]~output_o\ : std_logic;
SIGNAL \sleds[6]~output_o\ : std_logic;
SIGNAL \sleds[7]~output_o\ : std_logic;
SIGNAL \sleds[8]~output_o\ : std_logic;
SIGNAL \r_control[0]~output_o\ : std_logic;
SIGNAL \r_control[1]~output_o\ : std_logic;
SIGNAL \r_control[2]~output_o\ : std_logic;
SIGNAL \r_control[3]~output_o\ : std_logic;
SIGNAL \r_control[4]~output_o\ : std_logic;
SIGNAL \r_control[5]~output_o\ : std_logic;
SIGNAL \r_control[6]~output_o\ : std_logic;
SIGNAL \r_control[7]~output_o\ : std_logic;
SIGNAL \r_frec_mod[0]~output_o\ : std_logic;
SIGNAL \r_frec_mod[1]~output_o\ : std_logic;
SIGNAL \r_frec_mod[2]~output_o\ : std_logic;
SIGNAL \r_frec_mod[3]~output_o\ : std_logic;
SIGNAL \r_frec_mod[4]~output_o\ : std_logic;
SIGNAL \r_frec_mod[5]~output_o\ : std_logic;
SIGNAL \r_frec_mod[6]~output_o\ : std_logic;
SIGNAL \r_frec_mod[7]~output_o\ : std_logic;
SIGNAL \r_frec_mod[8]~output_o\ : std_logic;
SIGNAL \r_frec_mod[9]~output_o\ : std_logic;
SIGNAL \r_frec_mod[10]~output_o\ : std_logic;
SIGNAL \r_frec_mod[11]~output_o\ : std_logic;
SIGNAL \r_frec_mod[12]~output_o\ : std_logic;
SIGNAL \r_frec_mod[13]~output_o\ : std_logic;
SIGNAL \r_frec_mod[14]~output_o\ : std_logic;
SIGNAL \r_frec_mod[15]~output_o\ : std_logic;
SIGNAL \r_frec_mod[16]~output_o\ : std_logic;
SIGNAL \r_frec_mod[17]~output_o\ : std_logic;
SIGNAL \r_frec_mod[18]~output_o\ : std_logic;
SIGNAL \r_frec_mod[19]~output_o\ : std_logic;
SIGNAL \r_frec_mod[20]~output_o\ : std_logic;
SIGNAL \r_frec_mod[21]~output_o\ : std_logic;
SIGNAL \r_frec_mod[22]~output_o\ : std_logic;
SIGNAL \r_frec_mod[23]~output_o\ : std_logic;
SIGNAL \r_frec_por[0]~output_o\ : std_logic;
SIGNAL \r_frec_por[1]~output_o\ : std_logic;
SIGNAL \r_frec_por[2]~output_o\ : std_logic;
SIGNAL \r_frec_por[3]~output_o\ : std_logic;
SIGNAL \r_frec_por[4]~output_o\ : std_logic;
SIGNAL \r_frec_por[5]~output_o\ : std_logic;
SIGNAL \r_frec_por[6]~output_o\ : std_logic;
SIGNAL \r_frec_por[7]~output_o\ : std_logic;
SIGNAL \r_frec_por[8]~output_o\ : std_logic;
SIGNAL \r_frec_por[9]~output_o\ : std_logic;
SIGNAL \r_frec_por[10]~output_o\ : std_logic;
SIGNAL \r_frec_por[11]~output_o\ : std_logic;
SIGNAL \r_frec_por[12]~output_o\ : std_logic;
SIGNAL \r_frec_por[13]~output_o\ : std_logic;
SIGNAL \r_frec_por[14]~output_o\ : std_logic;
SIGNAL \r_frec_por[15]~output_o\ : std_logic;
SIGNAL \r_frec_por[16]~output_o\ : std_logic;
SIGNAL \r_frec_por[17]~output_o\ : std_logic;
SIGNAL \r_frec_por[18]~output_o\ : std_logic;
SIGNAL \r_frec_por[19]~output_o\ : std_logic;
SIGNAL \r_frec_por[20]~output_o\ : std_logic;
SIGNAL \r_frec_por[21]~output_o\ : std_logic;
SIGNAL \r_frec_por[22]~output_o\ : std_logic;
SIGNAL \r_frec_por[23]~output_o\ : std_logic;
SIGNAL \r_im_am[0]~output_o\ : std_logic;
SIGNAL \r_im_am[1]~output_o\ : std_logic;
SIGNAL \r_im_am[2]~output_o\ : std_logic;
SIGNAL \r_im_am[3]~output_o\ : std_logic;
SIGNAL \r_im_am[4]~output_o\ : std_logic;
SIGNAL \r_im_am[5]~output_o\ : std_logic;
SIGNAL \r_im_am[6]~output_o\ : std_logic;
SIGNAL \r_im_am[7]~output_o\ : std_logic;
SIGNAL \r_im_am[8]~output_o\ : std_logic;
SIGNAL \r_im_am[9]~output_o\ : std_logic;
SIGNAL \r_im_am[10]~output_o\ : std_logic;
SIGNAL \r_im_am[11]~output_o\ : std_logic;
SIGNAL \r_im_am[12]~output_o\ : std_logic;
SIGNAL \r_im_am[13]~output_o\ : std_logic;
SIGNAL \r_im_am[14]~output_o\ : std_logic;
SIGNAL \r_im_am[15]~output_o\ : std_logic;
SIGNAL \r_im_fm[0]~output_o\ : std_logic;
SIGNAL \r_im_fm[1]~output_o\ : std_logic;
SIGNAL \r_im_fm[2]~output_o\ : std_logic;
SIGNAL \r_im_fm[3]~output_o\ : std_logic;
SIGNAL \r_im_fm[4]~output_o\ : std_logic;
SIGNAL \r_im_fm[5]~output_o\ : std_logic;
SIGNAL \r_im_fm[6]~output_o\ : std_logic;
SIGNAL \r_im_fm[7]~output_o\ : std_logic;
SIGNAL \r_im_fm[8]~output_o\ : std_logic;
SIGNAL \r_im_fm[9]~output_o\ : std_logic;
SIGNAL \r_im_fm[10]~output_o\ : std_logic;
SIGNAL \r_im_fm[11]~output_o\ : std_logic;
SIGNAL \r_im_fm[12]~output_o\ : std_logic;
SIGNAL \r_im_fm[13]~output_o\ : std_logic;
SIGNAL \r_im_fm[14]~output_o\ : std_logic;
SIGNAL \r_im_fm[15]~output_o\ : std_logic;
SIGNAL \view_rxdw[0]~output_o\ : std_logic;
SIGNAL \view_rxdw[1]~output_o\ : std_logic;
SIGNAL \view_rxdw[2]~output_o\ : std_logic;
SIGNAL \view_rxdw[3]~output_o\ : std_logic;
SIGNAL \view_rxdw[4]~output_o\ : std_logic;
SIGNAL \view_rxdw[5]~output_o\ : std_logic;
SIGNAL \view_rxdw[6]~output_o\ : std_logic;
SIGNAL \view_rxdw[7]~output_o\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_rxsd <= rxsd;
ww_rst <= rst;
ww_clk <= clk;
txsd <= ww_txsd;
sleds <= ww_sleds;
r_control <= ww_r_control;
r_frec_mod <= ww_r_frec_mod;
r_frec_por <= ww_r_frec_por;
r_im_am <= ww_r_im_am;
r_im_fm <= ww_r_im_fm;
view_rxdw <= ww_view_rxdw;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X65_Y0_N16
\txsd~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \txsd~output_o\);

-- Location: IOOBUF_X115_Y62_N23
\sleds[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \sleds[0]~output_o\);

-- Location: IOOBUF_X0_Y21_N16
\sleds[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \sleds[1]~output_o\);

-- Location: IOOBUF_X89_Y73_N9
\sleds[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \sleds[2]~output_o\);

-- Location: IOOBUF_X115_Y58_N16
\sleds[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \sleds[3]~output_o\);

-- Location: IOOBUF_X109_Y0_N2
\sleds[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \sleds[4]~output_o\);

-- Location: IOOBUF_X83_Y0_N16
\sleds[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \sleds[5]~output_o\);

-- Location: IOOBUF_X0_Y17_N16
\sleds[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \sleds[6]~output_o\);

-- Location: IOOBUF_X13_Y73_N23
\sleds[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \sleds[7]~output_o\);

-- Location: IOOBUF_X3_Y73_N2
\sleds[8]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \sleds[8]~output_o\);

-- Location: IOOBUF_X18_Y0_N2
\r_control[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_control[0]~output_o\);

-- Location: IOOBUF_X47_Y0_N2
\r_control[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_control[1]~output_o\);

-- Location: IOOBUF_X23_Y73_N16
\r_control[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_control[2]~output_o\);

-- Location: IOOBUF_X54_Y0_N2
\r_control[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_control[3]~output_o\);

-- Location: IOOBUF_X107_Y73_N9
\r_control[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_control[4]~output_o\);

-- Location: IOOBUF_X115_Y7_N16
\r_control[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_control[5]~output_o\);

-- Location: IOOBUF_X54_Y0_N23
\r_control[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_control[6]~output_o\);

-- Location: IOOBUF_X0_Y68_N16
\r_control[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_control[7]~output_o\);

-- Location: IOOBUF_X89_Y73_N23
\r_frec_mod[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_frec_mod[0]~output_o\);

-- Location: IOOBUF_X20_Y0_N16
\r_frec_mod[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_frec_mod[1]~output_o\);

-- Location: IOOBUF_X0_Y29_N16
\r_frec_mod[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_frec_mod[2]~output_o\);

-- Location: IOOBUF_X16_Y73_N9
\r_frec_mod[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_frec_mod[3]~output_o\);

-- Location: IOOBUF_X0_Y14_N2
\r_frec_mod[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_frec_mod[4]~output_o\);

-- Location: IOOBUF_X111_Y0_N2
\r_frec_mod[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_frec_mod[5]~output_o\);

-- Location: IOOBUF_X56_Y0_N16
\r_frec_mod[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_frec_mod[6]~output_o\);

-- Location: IOOBUF_X69_Y73_N23
\r_frec_mod[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_frec_mod[7]~output_o\);

-- Location: IOOBUF_X1_Y0_N16
\r_frec_mod[8]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_frec_mod[8]~output_o\);

-- Location: IOOBUF_X113_Y0_N2
\r_frec_mod[9]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_frec_mod[9]~output_o\);

-- Location: IOOBUF_X20_Y0_N9
\r_frec_mod[10]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_frec_mod[10]~output_o\);

-- Location: IOOBUF_X20_Y0_N23
\r_frec_mod[11]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_frec_mod[11]~output_o\);

-- Location: IOOBUF_X47_Y73_N16
\r_frec_mod[12]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_frec_mod[12]~output_o\);

-- Location: IOOBUF_X85_Y73_N9
\r_frec_mod[13]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_frec_mod[13]~output_o\);

-- Location: IOOBUF_X115_Y34_N23
\r_frec_mod[14]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_frec_mod[14]~output_o\);

-- Location: IOOBUF_X60_Y0_N2
\r_frec_mod[15]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_frec_mod[15]~output_o\);

-- Location: IOOBUF_X115_Y11_N9
\r_frec_mod[16]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_frec_mod[16]~output_o\);

-- Location: IOOBUF_X102_Y0_N16
\r_frec_mod[17]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_frec_mod[17]~output_o\);

-- Location: IOOBUF_X105_Y73_N2
\r_frec_mod[18]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_frec_mod[18]~output_o\);

-- Location: IOOBUF_X115_Y26_N16
\r_frec_mod[19]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_frec_mod[19]~output_o\);

-- Location: IOOBUF_X45_Y0_N23
\r_frec_mod[20]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_frec_mod[20]~output_o\);

-- Location: IOOBUF_X23_Y73_N2
\r_frec_mod[21]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_frec_mod[21]~output_o\);

-- Location: IOOBUF_X27_Y73_N23
\r_frec_mod[22]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_frec_mod[22]~output_o\);

-- Location: IOOBUF_X45_Y73_N2
\r_frec_mod[23]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_frec_mod[23]~output_o\);

-- Location: IOOBUF_X52_Y0_N9
\r_frec_por[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_frec_por[0]~output_o\);

-- Location: IOOBUF_X52_Y73_N23
\r_frec_por[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_frec_por[1]~output_o\);

-- Location: IOOBUF_X111_Y73_N2
\r_frec_por[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_frec_por[2]~output_o\);

-- Location: IOOBUF_X105_Y0_N16
\r_frec_por[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_frec_por[3]~output_o\);

-- Location: IOOBUF_X87_Y0_N23
\r_frec_por[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_frec_por[4]~output_o\);

-- Location: IOOBUF_X0_Y4_N23
\r_frec_por[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_frec_por[5]~output_o\);

-- Location: IOOBUF_X11_Y73_N9
\r_frec_por[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_frec_por[6]~output_o\);

-- Location: IOOBUF_X0_Y23_N16
\r_frec_por[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_frec_por[7]~output_o\);

-- Location: IOOBUF_X20_Y0_N2
\r_frec_por[8]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_frec_por[8]~output_o\);

-- Location: IOOBUF_X115_Y22_N23
\r_frec_por[9]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_frec_por[9]~output_o\);

-- Location: IOOBUF_X0_Y12_N16
\r_frec_por[10]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_frec_por[10]~output_o\);

-- Location: IOOBUF_X115_Y35_N23
\r_frec_por[11]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_frec_por[11]~output_o\);

-- Location: IOOBUF_X5_Y0_N23
\r_frec_por[12]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_frec_por[12]~output_o\);

-- Location: IOOBUF_X56_Y0_N23
\r_frec_por[13]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_frec_por[13]~output_o\);

-- Location: IOOBUF_X89_Y0_N16
\r_frec_por[14]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_frec_por[14]~output_o\);

-- Location: IOOBUF_X74_Y0_N2
\r_frec_por[15]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_frec_por[15]~output_o\);

-- Location: IOOBUF_X0_Y59_N23
\r_frec_por[16]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_frec_por[16]~output_o\);

-- Location: IOOBUF_X40_Y73_N2
\r_frec_por[17]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_frec_por[17]~output_o\);

-- Location: IOOBUF_X69_Y0_N2
\r_frec_por[18]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_frec_por[18]~output_o\);

-- Location: IOOBUF_X0_Y35_N2
\r_frec_por[19]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_frec_por[19]~output_o\);

-- Location: IOOBUF_X85_Y0_N2
\r_frec_por[20]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_frec_por[20]~output_o\);

-- Location: IOOBUF_X23_Y0_N23
\r_frec_por[21]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_frec_por[21]~output_o\);

-- Location: IOOBUF_X115_Y30_N9
\r_frec_por[22]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_frec_por[22]~output_o\);

-- Location: IOOBUF_X115_Y29_N9
\r_frec_por[23]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_frec_por[23]~output_o\);

-- Location: IOOBUF_X11_Y73_N2
\r_im_am[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_im_am[0]~output_o\);

-- Location: IOOBUF_X107_Y0_N9
\r_im_am[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_im_am[1]~output_o\);

-- Location: IOOBUF_X74_Y0_N9
\r_im_am[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_im_am[2]~output_o\);

-- Location: IOOBUF_X115_Y55_N16
\r_im_am[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_im_am[3]~output_o\);

-- Location: IOOBUF_X23_Y73_N9
\r_im_am[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_im_am[4]~output_o\);

-- Location: IOOBUF_X52_Y73_N16
\r_im_am[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_im_am[5]~output_o\);

-- Location: IOOBUF_X60_Y0_N16
\r_im_am[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_im_am[6]~output_o\);

-- Location: IOOBUF_X94_Y73_N9
\r_im_am[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_im_am[7]~output_o\);

-- Location: IOOBUF_X23_Y73_N23
\r_im_am[8]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_im_am[8]~output_o\);

-- Location: IOOBUF_X0_Y61_N23
\r_im_am[9]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_im_am[9]~output_o\);

-- Location: IOOBUF_X1_Y73_N23
\r_im_am[10]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_im_am[10]~output_o\);

-- Location: IOOBUF_X105_Y73_N9
\r_im_am[11]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_im_am[11]~output_o\);

-- Location: IOOBUF_X85_Y73_N2
\r_im_am[12]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_im_am[12]~output_o\);

-- Location: IOOBUF_X113_Y73_N9
\r_im_am[13]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_im_am[13]~output_o\);

-- Location: IOOBUF_X100_Y0_N16
\r_im_am[14]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_im_am[14]~output_o\);

-- Location: IOOBUF_X115_Y25_N16
\r_im_am[15]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_im_am[15]~output_o\);

-- Location: IOOBUF_X98_Y0_N23
\r_im_fm[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_im_fm[0]~output_o\);

-- Location: IOOBUF_X102_Y0_N23
\r_im_fm[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_im_fm[1]~output_o\);

-- Location: IOOBUF_X18_Y0_N16
\r_im_fm[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_im_fm[2]~output_o\);

-- Location: IOOBUF_X0_Y34_N16
\r_im_fm[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_im_fm[3]~output_o\);

-- Location: IOOBUF_X29_Y73_N9
\r_im_fm[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_im_fm[4]~output_o\);

-- Location: IOOBUF_X0_Y44_N2
\r_im_fm[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_im_fm[5]~output_o\);

-- Location: IOOBUF_X67_Y0_N23
\r_im_fm[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_im_fm[6]~output_o\);

-- Location: IOOBUF_X42_Y73_N9
\r_im_fm[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_im_fm[7]~output_o\);

-- Location: IOOBUF_X98_Y0_N16
\r_im_fm[8]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_im_fm[8]~output_o\);

-- Location: IOOBUF_X107_Y73_N23
\r_im_fm[9]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_im_fm[9]~output_o\);

-- Location: IOOBUF_X105_Y0_N23
\r_im_fm[10]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_im_fm[10]~output_o\);

-- Location: IOOBUF_X1_Y73_N9
\r_im_fm[11]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_im_fm[11]~output_o\);

-- Location: IOOBUF_X85_Y73_N23
\r_im_fm[12]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_im_fm[12]~output_o\);

-- Location: IOOBUF_X81_Y73_N23
\r_im_fm[13]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_im_fm[13]~output_o\);

-- Location: IOOBUF_X0_Y34_N23
\r_im_fm[14]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_im_fm[14]~output_o\);

-- Location: IOOBUF_X18_Y73_N23
\r_im_fm[15]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_im_fm[15]~output_o\);

-- Location: IOOBUF_X79_Y0_N23
\view_rxdw[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \view_rxdw[0]~output_o\);

-- Location: IOOBUF_X5_Y73_N9
\view_rxdw[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \view_rxdw[1]~output_o\);

-- Location: IOOBUF_X83_Y0_N23
\view_rxdw[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \view_rxdw[2]~output_o\);

-- Location: IOOBUF_X0_Y12_N23
\view_rxdw[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \view_rxdw[3]~output_o\);

-- Location: IOOBUF_X85_Y0_N23
\view_rxdw[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \view_rxdw[4]~output_o\);

-- Location: IOOBUF_X79_Y0_N2
\view_rxdw[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \view_rxdw[5]~output_o\);

-- Location: IOOBUF_X96_Y0_N9
\view_rxdw[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \view_rxdw[6]~output_o\);

-- Location: IOOBUF_X5_Y0_N9
\view_rxdw[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \view_rxdw[7]~output_o\);

-- Location: IOIBUF_X85_Y0_N8
\rxsd~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rxsd,
	o => \rxsd~input_o\);

-- Location: IOIBUF_X5_Y0_N15
\clk~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: IOIBUF_X49_Y0_N8
\rst~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rst,
	o => \rst~input_o\);

ww_txsd <= \txsd~output_o\;

ww_sleds(0) <= \sleds[0]~output_o\;

ww_sleds(1) <= \sleds[1]~output_o\;

ww_sleds(2) <= \sleds[2]~output_o\;

ww_sleds(3) <= \sleds[3]~output_o\;

ww_sleds(4) <= \sleds[4]~output_o\;

ww_sleds(5) <= \sleds[5]~output_o\;

ww_sleds(6) <= \sleds[6]~output_o\;

ww_sleds(7) <= \sleds[7]~output_o\;

ww_sleds(8) <= \sleds[8]~output_o\;

ww_r_control(0) <= \r_control[0]~output_o\;

ww_r_control(1) <= \r_control[1]~output_o\;

ww_r_control(2) <= \r_control[2]~output_o\;

ww_r_control(3) <= \r_control[3]~output_o\;

ww_r_control(4) <= \r_control[4]~output_o\;

ww_r_control(5) <= \r_control[5]~output_o\;

ww_r_control(6) <= \r_control[6]~output_o\;

ww_r_control(7) <= \r_control[7]~output_o\;

ww_r_frec_mod(0) <= \r_frec_mod[0]~output_o\;

ww_r_frec_mod(1) <= \r_frec_mod[1]~output_o\;

ww_r_frec_mod(2) <= \r_frec_mod[2]~output_o\;

ww_r_frec_mod(3) <= \r_frec_mod[3]~output_o\;

ww_r_frec_mod(4) <= \r_frec_mod[4]~output_o\;

ww_r_frec_mod(5) <= \r_frec_mod[5]~output_o\;

ww_r_frec_mod(6) <= \r_frec_mod[6]~output_o\;

ww_r_frec_mod(7) <= \r_frec_mod[7]~output_o\;

ww_r_frec_mod(8) <= \r_frec_mod[8]~output_o\;

ww_r_frec_mod(9) <= \r_frec_mod[9]~output_o\;

ww_r_frec_mod(10) <= \r_frec_mod[10]~output_o\;

ww_r_frec_mod(11) <= \r_frec_mod[11]~output_o\;

ww_r_frec_mod(12) <= \r_frec_mod[12]~output_o\;

ww_r_frec_mod(13) <= \r_frec_mod[13]~output_o\;

ww_r_frec_mod(14) <= \r_frec_mod[14]~output_o\;

ww_r_frec_mod(15) <= \r_frec_mod[15]~output_o\;

ww_r_frec_mod(16) <= \r_frec_mod[16]~output_o\;

ww_r_frec_mod(17) <= \r_frec_mod[17]~output_o\;

ww_r_frec_mod(18) <= \r_frec_mod[18]~output_o\;

ww_r_frec_mod(19) <= \r_frec_mod[19]~output_o\;

ww_r_frec_mod(20) <= \r_frec_mod[20]~output_o\;

ww_r_frec_mod(21) <= \r_frec_mod[21]~output_o\;

ww_r_frec_mod(22) <= \r_frec_mod[22]~output_o\;

ww_r_frec_mod(23) <= \r_frec_mod[23]~output_o\;

ww_r_frec_por(0) <= \r_frec_por[0]~output_o\;

ww_r_frec_por(1) <= \r_frec_por[1]~output_o\;

ww_r_frec_por(2) <= \r_frec_por[2]~output_o\;

ww_r_frec_por(3) <= \r_frec_por[3]~output_o\;

ww_r_frec_por(4) <= \r_frec_por[4]~output_o\;

ww_r_frec_por(5) <= \r_frec_por[5]~output_o\;

ww_r_frec_por(6) <= \r_frec_por[6]~output_o\;

ww_r_frec_por(7) <= \r_frec_por[7]~output_o\;

ww_r_frec_por(8) <= \r_frec_por[8]~output_o\;

ww_r_frec_por(9) <= \r_frec_por[9]~output_o\;

ww_r_frec_por(10) <= \r_frec_por[10]~output_o\;

ww_r_frec_por(11) <= \r_frec_por[11]~output_o\;

ww_r_frec_por(12) <= \r_frec_por[12]~output_o\;

ww_r_frec_por(13) <= \r_frec_por[13]~output_o\;

ww_r_frec_por(14) <= \r_frec_por[14]~output_o\;

ww_r_frec_por(15) <= \r_frec_por[15]~output_o\;

ww_r_frec_por(16) <= \r_frec_por[16]~output_o\;

ww_r_frec_por(17) <= \r_frec_por[17]~output_o\;

ww_r_frec_por(18) <= \r_frec_por[18]~output_o\;

ww_r_frec_por(19) <= \r_frec_por[19]~output_o\;

ww_r_frec_por(20) <= \r_frec_por[20]~output_o\;

ww_r_frec_por(21) <= \r_frec_por[21]~output_o\;

ww_r_frec_por(22) <= \r_frec_por[22]~output_o\;

ww_r_frec_por(23) <= \r_frec_por[23]~output_o\;

ww_r_im_am(0) <= \r_im_am[0]~output_o\;

ww_r_im_am(1) <= \r_im_am[1]~output_o\;

ww_r_im_am(2) <= \r_im_am[2]~output_o\;

ww_r_im_am(3) <= \r_im_am[3]~output_o\;

ww_r_im_am(4) <= \r_im_am[4]~output_o\;

ww_r_im_am(5) <= \r_im_am[5]~output_o\;

ww_r_im_am(6) <= \r_im_am[6]~output_o\;

ww_r_im_am(7) <= \r_im_am[7]~output_o\;

ww_r_im_am(8) <= \r_im_am[8]~output_o\;

ww_r_im_am(9) <= \r_im_am[9]~output_o\;

ww_r_im_am(10) <= \r_im_am[10]~output_o\;

ww_r_im_am(11) <= \r_im_am[11]~output_o\;

ww_r_im_am(12) <= \r_im_am[12]~output_o\;

ww_r_im_am(13) <= \r_im_am[13]~output_o\;

ww_r_im_am(14) <= \r_im_am[14]~output_o\;

ww_r_im_am(15) <= \r_im_am[15]~output_o\;

ww_r_im_fm(0) <= \r_im_fm[0]~output_o\;

ww_r_im_fm(1) <= \r_im_fm[1]~output_o\;

ww_r_im_fm(2) <= \r_im_fm[2]~output_o\;

ww_r_im_fm(3) <= \r_im_fm[3]~output_o\;

ww_r_im_fm(4) <= \r_im_fm[4]~output_o\;

ww_r_im_fm(5) <= \r_im_fm[5]~output_o\;

ww_r_im_fm(6) <= \r_im_fm[6]~output_o\;

ww_r_im_fm(7) <= \r_im_fm[7]~output_o\;

ww_r_im_fm(8) <= \r_im_fm[8]~output_o\;

ww_r_im_fm(9) <= \r_im_fm[9]~output_o\;

ww_r_im_fm(10) <= \r_im_fm[10]~output_o\;

ww_r_im_fm(11) <= \r_im_fm[11]~output_o\;

ww_r_im_fm(12) <= \r_im_fm[12]~output_o\;

ww_r_im_fm(13) <= \r_im_fm[13]~output_o\;

ww_r_im_fm(14) <= \r_im_fm[14]~output_o\;

ww_r_im_fm(15) <= \r_im_fm[15]~output_o\;

ww_view_rxdw(0) <= \view_rxdw[0]~output_o\;

ww_view_rxdw(1) <= \view_rxdw[1]~output_o\;

ww_view_rxdw(2) <= \view_rxdw[2]~output_o\;

ww_view_rxdw(3) <= \view_rxdw[3]~output_o\;

ww_view_rxdw(4) <= \view_rxdw[4]~output_o\;

ww_view_rxdw(5) <= \view_rxdw[5]~output_o\;

ww_view_rxdw(6) <= \view_rxdw[6]~output_o\;

ww_view_rxdw(7) <= \view_rxdw[7]~output_o\;
END structure;


