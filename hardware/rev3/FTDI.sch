EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:ftdi
LIBS:analog_devices
LIBS:AD9102
LIBS:LMK61XX
LIBS:rev3-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 5
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L 93LCxxB U2
U 1 1 58FB14E9
P 1900 1800
F 0 "U2" H 1750 2150 50  0000 C CNN
F 1 "93LCxxB" H 1700 1550 50  0000 L CNN
F 2 "Housings_SOIC:SOIC-8_3.9x4.9mm_Pitch1.27mm" H 1800 1800 50  0001 C CNN
F 3 "" H 1900 1900 50  0001 C CNN
F 4 "93LC46B/SN-ND" H 1900 1800 60  0001 C CNN "DigiKey"
	1    1900 1800
	1    0    0    -1  
$EndComp
Text GLabel 2550 1600 2    60   Input ~ 0
FTEEDATA
Text GLabel 1150 1800 0    60   Input ~ 0
FTEECLK
Text GLabel 1150 1650 0    60   Input ~ 0
FTEECS
$Comp
L R_Small R2
U 1 1 58FAEA6D
P 1200 1300
F 0 "R2" H 1230 1320 50  0000 L CNN
F 1 "10k" H 1230 1260 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" H 1200 1300 50  0001 C CNN
F 3 "" H 1200 1300 50  0001 C CNN
F 4 "P10KADCT-ND" H 1200 1300 60  0001 C CNN "DigiKey "
	1    1200 1300
	1    0    0    -1  
$EndComp
$Comp
L R_Small R3
U 1 1 58FAEAD5
P 1400 1300
F 0 "R3" H 1430 1320 50  0000 L CNN
F 1 "10k" H 1430 1260 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" H 1400 1300 50  0001 C CNN
F 3 "" H 1400 1300 50  0001 C CNN
F 4 "P10KADCT-ND" H 1400 1300 60  0001 C CNN "DigiKey "
	1    1400 1300
	1    0    0    -1  
$EndComp
$Comp
L R_Small R5
U 1 1 58FAEAF8
P 2500 1250
F 0 "R5" H 2530 1270 50  0000 L CNN
F 1 "10k" H 2530 1210 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" H 2500 1250 50  0001 C CNN
F 3 "" H 2500 1250 50  0001 C CNN
F 4 "P10KADCT-ND" H 2500 1250 60  0001 C CNN "DigiKey "
	1    2500 1250
	1    0    0    -1  
$EndComp
$Comp
L R_Small R4
U 1 1 58FAEB1A
P 2350 1700
F 0 "R4" H 2380 1720 50  0000 L CNN
F 1 "2.2k" H 2380 1660 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" H 2350 1700 50  0001 C CNN
F 3 "" H 2350 1700 50  0001 C CNN
F 4 "P2.2KADCT-ND" H 2350 1700 60  0001 C CNN "DigiKey "
	1    2350 1700
	0    1    1    0   
$EndComp
$Comp
L +3.3V #PWR09
U 1 1 58FAECA2
P 1200 1100
F 0 "#PWR09" H 1200 950 50  0001 C CNN
F 1 "+3.3V" H 1200 1240 50  0000 C CNN
F 2 "" H 1200 1100 50  0001 C CNN
F 3 "" H 1200 1100 50  0001 C CNN
	1    1200 1100
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR010
U 1 1 58FAECFF
P 2500 1150
F 0 "#PWR010" H 2500 1000 50  0001 C CNN
F 1 "+3.3V" H 2500 1290 50  0000 C CNN
F 2 "" H 2500 1150 50  0001 C CNN
F 3 "" H 2500 1150 50  0001 C CNN
	1    2500 1150
	1    0    0    -1  
$EndComp
$Comp
L GNDD #PWR011
U 1 1 58FAEE02
P 1600 1950
F 0 "#PWR011" H 1600 1700 50  0001 C CNN
F 1 "GNDD" H 1600 1800 50  0000 C CNN
F 2 "" H 1600 1950 50  0001 C CNN
F 3 "" H 1600 1950 50  0001 C CNN
	1    1600 1950
	1    0    0    -1  
$EndComp
NoConn ~ 2200 1900
NoConn ~ 2200 1800
$Comp
L FT2232H U3
U 1 1 58FAF217
P 5000 4250
F 0 "U3" H 3950 6350 50  0000 L CNN
F 1 "FT2232H" H 5750 6350 50  0000 L CNN
F 2 "Housings_QFP:LQFP-64_10x10mm_Pitch0.5mm" H 5000 4250 50  0001 C CNN
F 3 "" H 5000 4250 50  0001 C CNN
	1    5000 4250
	1    0    0    -1  
$EndComp
$Comp
L C_Small C10
U 1 1 58FAF401
P 1950 2750
F 0 "C10" H 1960 2820 50  0000 L CNN
F 1 "100n" H 1960 2670 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 1950 2750 50  0001 C CNN
F 3 "" H 1950 2750 50  0001 C CNN
F 4 "478-1395-1-ND" H 1950 2750 60  0001 C CNN "DigiKey "
	1    1950 2750
	1    0    0    -1  
$EndComp
$Comp
L C_Small C11
U 1 1 58FAF5AE
P 2200 2750
F 0 "C11" H 2210 2820 50  0000 L CNN
F 1 "100n" H 2210 2670 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 2200 2750 50  0001 C CNN
F 3 "" H 2200 2750 50  0001 C CNN
F 4 "478-1395-1-ND" H 2200 2750 60  0001 C CNN "DigiKey "
	1    2200 2750
	1    0    0    -1  
$EndComp
$Comp
L C_Small C12
U 1 1 58FAF5E2
P 2450 2750
F 0 "C12" H 2460 2820 50  0000 L CNN
F 1 "100n" H 2460 2670 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 2450 2750 50  0001 C CNN
F 3 "" H 2450 2750 50  0001 C CNN
F 4 "478-1395-1-ND" H 2450 2750 60  0001 C CNN "DigiKey "
	1    2450 2750
	1    0    0    -1  
$EndComp
$Comp
L C_Small C13
U 1 1 58FAF615
P 2700 2750
F 0 "C13" H 2710 2820 50  0000 L CNN
F 1 "100n" H 2710 2670 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 2700 2750 50  0001 C CNN
F 3 "" H 2700 2750 50  0001 C CNN
F 4 "478-1395-1-ND" H 2700 2750 60  0001 C CNN "DigiKey "
	1    2700 2750
	1    0    0    -1  
$EndComp
$Comp
L C_Small C14
U 1 1 58FAF64F
P 2950 2750
F 0 "C14" H 2960 2820 50  0000 L CNN
F 1 "100n" H 2960 2670 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 2950 2750 50  0001 C CNN
F 3 "" H 2950 2750 50  0001 C CNN
F 4 "478-1395-1-ND" H 2950 2750 60  0001 C CNN "DigiKey "
	1    2950 2750
	1    0    0    -1  
$EndComp
$Comp
L C_Small C15
U 1 1 58FAF688
P 3200 2750
F 0 "C15" H 3210 2820 50  0000 L CNN
F 1 "100n" H 3210 2670 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 3200 2750 50  0001 C CNN
F 3 "" H 3200 2750 50  0001 C CNN
F 4 "478-1395-1-ND" H 3200 2750 60  0001 C CNN "DigiKey "
	1    3200 2750
	1    0    0    -1  
$EndComp
$Comp
L C_Small C16
U 1 1 58FAF6C4
P 3450 2750
F 0 "C16" H 3460 2820 50  0000 L CNN
F 1 "100n" H 3460 2670 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 3450 2750 50  0001 C CNN
F 3 "" H 3450 2750 50  0001 C CNN
F 4 "478-1395-1-ND" H 3450 2750 60  0001 C CNN "DigiKey "
	1    3450 2750
	1    0    0    -1  
$EndComp
$Comp
L C_Small C9
U 1 1 58FAF86F
P 1700 2750
F 0 "C9" H 1710 2820 50  0000 L CNN
F 1 "3.3u" H 1710 2670 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 1700 2750 50  0001 C CNN
F 3 "" H 1700 2750 50  0001 C CNN
F 4 "478-1414-1-ND" H 1700 2750 60  0001 C CNN "DigiKey "
	1    1700 2750
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR012
U 1 1 58FB0265
P 5300 1950
F 0 "#PWR012" H 5300 1800 50  0001 C CNN
F 1 "+3.3V" H 5300 2090 50  0000 C CNN
F 2 "" H 5300 1950 50  0001 C CNN
F 3 "" H 5300 1950 50  0001 C CNN
	1    5300 1950
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR013
U 1 1 58FB0399
P 3700 2250
F 0 "#PWR013" H 3700 2100 50  0001 C CNN
F 1 "+3.3V" H 3700 2390 50  0000 C CNN
F 2 "" H 3700 2250 50  0001 C CNN
F 3 "" H 3700 2250 50  0001 C CNN
	1    3700 2250
	1    0    0    -1  
$EndComp
$Comp
L C_Small C17
U 1 1 58FB0491
P 3700 2750
F 0 "C17" H 3710 2820 50  0000 L CNN
F 1 "100n" H 3710 2670 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 3700 2750 50  0001 C CNN
F 3 "" H 3700 2750 50  0001 C CNN
F 4 "478-1395-1-ND" H 3700 2750 60  0001 C CNN "DigiKey "
	1    3700 2750
	1    0    0    -1  
$EndComp
$Comp
L GNDD #PWR014
U 1 1 58FB0597
P 1700 2950
F 0 "#PWR014" H 1700 2700 50  0001 C CNN
F 1 "GNDD" H 1700 2800 50  0000 C CNN
F 2 "" H 1700 2950 50  0001 C CNN
F 3 "" H 1700 2950 50  0001 C CNN
	1    1700 2950
	1    0    0    -1  
$EndComp
Text GLabel 4350 1700 0    60   Input ~ 0
FTVPLL
Text GLabel 4350 1850 0    60   Input ~ 0
FTVPHY
$Comp
L R_Small R6
U 1 1 58FB0FD6
P 3100 3750
F 0 "R6" H 3130 3770 50  0000 L CNN
F 1 "4.7k" H 3130 3710 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" H 3100 3750 50  0001 C CNN
F 3 "" H 3100 3750 50  0001 C CNN
F 4 "P1.0KADCT-ND" H 3100 3750 60  0001 C CNN "DigiKey "
	1    3100 3750
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR015
U 1 1 58FB141A
P 3100 3650
F 0 "#PWR015" H 3100 3500 50  0001 C CNN
F 1 "+3.3V" H 3100 3790 50  0000 C CNN
F 2 "" H 3100 3650 50  0001 C CNN
F 3 "" H 3100 3650 50  0001 C CNN
	1    3100 3650
	1    0    0    -1  
$EndComp
$Comp
L R_Small R7
U 1 1 58FB1483
P 3650 4000
F 0 "R7" H 3680 4020 50  0000 L CNN
F 1 "12k" H 3680 3960 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" H 3650 4000 50  0001 C CNN
F 3 "" H 3650 4000 50  0001 C CNN
F 4 "P12KADCT-ND" H 3650 4000 60  0001 C CNN "DigiKey "
	1    3650 4000
	-1   0    0    1   
$EndComp
$Comp
L GNDD #PWR016
U 1 1 58FB15A0
P 3650 4100
F 0 "#PWR016" H 3650 3850 50  0001 C CNN
F 1 "GNDD" H 3650 3950 50  0000 C CNN
F 2 "" H 3650 4100 50  0001 C CNN
F 3 "" H 3650 4100 50  0001 C CNN
	1    3650 4100
	1    0    0    -1  
$EndComp
Text GLabel 3700 3300 0    60   Input ~ 0
USB_D-
Text GLabel 3700 3500 0    60   Input ~ 0
USB_D+
Text GLabel 3650 5050 0    60   Input ~ 0
FTEECLK
Text GLabel 3650 4900 0    60   Input ~ 0
FTEECS
Text GLabel 3650 5200 0    60   Input ~ 0
FTEEDATA
$Comp
L GNDD #PWR017
U 1 1 58FB2893
P 3750 6100
F 0 "#PWR017" H 3750 5850 50  0001 C CNN
F 1 "GNDD" H 3750 5950 50  0000 C CNN
F 2 "" H 3750 6100 50  0001 C CNN
F 3 "" H 3750 6100 50  0001 C CNN
	1    3750 6100
	1    0    0    -1  
$EndComp
Text GLabel 3650 5450 0    60   Input ~ 0
FTOSC-
Text GLabel 3650 5850 0    60   Input ~ 0
FTOSC+
NoConn ~ 6200 6050
NoConn ~ 6200 5950
$Comp
L GNDD #PWR018
U 1 1 58FB31FD
P 4400 6600
F 0 "#PWR018" H 4400 6350 50  0001 C CNN
F 1 "GNDD" H 4400 6450 50  0000 C CNN
F 2 "" H 4400 6600 50  0001 C CNN
F 3 "" H 4400 6600 50  0001 C CNN
	1    4400 6600
	1    0    0    -1  
$EndComp
Wire Wire Line
	2200 1700 2250 1700
Wire Wire Line
	2200 1600 2550 1600
Wire Wire Line
	2500 1350 2500 1700
Wire Wire Line
	2500 1700 2450 1700
Connection ~ 2500 1600
Wire Wire Line
	1400 1400 1400 1700
Wire Wire Line
	1300 1700 1600 1700
Wire Wire Line
	1200 1400 1200 1800
Wire Wire Line
	1150 1800 1600 1800
Wire Wire Line
	1200 1100 1200 1200
Wire Wire Line
	1200 1150 1600 1150
Wire Wire Line
	1400 1150 1400 1200
Connection ~ 1200 1150
Wire Wire Line
	1600 1150 1600 1600
Connection ~ 1400 1150
Connection ~ 1200 1800
Connection ~ 1400 1700
Wire Wire Line
	1600 1900 1600 1950
Wire Wire Line
	1150 1650 1300 1650
Wire Wire Line
	1300 1650 1300 1700
Wire Wire Line
	1700 2650 1700 2550
Wire Wire Line
	1700 2550 3800 2550
Wire Wire Line
	3450 1950 3450 2650
Connection ~ 3450 2550
Wire Wire Line
	3200 2650 3200 2550
Connection ~ 3200 2550
Wire Wire Line
	2950 2650 2950 2550
Connection ~ 2950 2550
Wire Wire Line
	2700 2650 2700 2550
Connection ~ 2700 2550
Wire Wire Line
	2450 2650 2450 2550
Connection ~ 2450 2550
Wire Wire Line
	2200 2650 2200 2550
Wire Wire Line
	2200 2550 2250 2550
Connection ~ 2250 2550
Wire Wire Line
	1950 2650 1950 2550
Connection ~ 1950 2550
Wire Wire Line
	4800 2050 4800 1950
Wire Wire Line
	3450 1950 5000 1950
Wire Wire Line
	4900 1950 4900 2050
Connection ~ 4800 1950
Wire Wire Line
	5000 1950 5000 2050
Connection ~ 4900 1950
Wire Wire Line
	5200 2050 5200 1950
Wire Wire Line
	5200 1950 5500 1950
Wire Wire Line
	5300 1950 5300 2050
Wire Wire Line
	5400 1950 5400 2050
Connection ~ 5300 1950
Wire Wire Line
	5500 1950 5500 2050
Connection ~ 5400 1950
Wire Wire Line
	3800 2350 3700 2350
Wire Wire Line
	3700 2250 3700 2650
Connection ~ 3700 2350
Wire Wire Line
	1700 2850 1700 2950
Wire Wire Line
	1700 2900 3700 2900
Wire Wire Line
	3700 2900 3700 2850
Connection ~ 1700 2900
Wire Wire Line
	3450 2850 3450 2900
Connection ~ 3450 2900
Wire Wire Line
	3200 2850 3200 2900
Connection ~ 3200 2900
Wire Wire Line
	2950 2850 2950 2900
Connection ~ 2950 2900
Wire Wire Line
	2700 2900 2700 2850
Connection ~ 2700 2900
Wire Wire Line
	2450 2850 2450 2900
Connection ~ 2450 2900
Wire Wire Line
	2200 2900 2200 2850
Connection ~ 2200 2900
Wire Wire Line
	1950 2850 1950 2900
Connection ~ 1950 2900
Wire Wire Line
	4350 1700 4600 1700
Wire Wire Line
	4600 1700 4600 2050
Wire Wire Line
	4500 2050 4500 1850
Wire Wire Line
	4500 1850 4350 1850
Wire Wire Line
	3100 3850 3800 3850
Wire Wire Line
	3650 3900 3650 3650
Wire Wire Line
	3650 3650 3800 3650
Wire Wire Line
	3700 3500 3800 3500
Wire Wire Line
	3800 3500 3800 3450
Wire Wire Line
	3800 3350 3800 3300
Wire Wire Line
	3800 3300 3700 3300
Wire Wire Line
	3800 5050 3650 5050
Wire Wire Line
	3650 4900 3750 4900
Wire Wire Line
	3750 4900 3750 4950
Wire Wire Line
	3750 4950 3800 4950
Wire Wire Line
	3650 5200 3750 5200
Wire Wire Line
	3750 5200 3750 5150
Wire Wire Line
	3750 5150 3800 5150
Wire Wire Line
	3800 6050 3750 6050
Wire Wire Line
	3750 6050 3750 6100
Wire Wire Line
	3650 5450 3800 5450
Wire Wire Line
	3800 5850 3650 5850
Wire Wire Line
	4400 6450 4400 6600
Wire Wire Line
	4400 6550 5300 6550
Wire Wire Line
	4600 6550 4600 6450
Connection ~ 4400 6550
Wire Wire Line
	4700 6550 4700 6450
Connection ~ 4600 6550
Wire Wire Line
	4800 6550 4800 6450
Connection ~ 4700 6550
Wire Wire Line
	4900 6550 4900 6450
Connection ~ 4800 6550
Wire Wire Line
	5000 6550 5000 6450
Connection ~ 4900 6550
Wire Wire Line
	5100 6550 5100 6450
Connection ~ 5000 6550
Wire Wire Line
	5200 6550 5200 6450
Connection ~ 5100 6550
Wire Wire Line
	5300 6550 5300 6450
Connection ~ 5200 6550
Wire Bus Line
	7600 2450 7600 3150
Wire Bus Line
	6650 3350 6650 4050
Entry Wire Line
	6550 3250 6650 3350
Entry Wire Line
	6550 3350 6650 3450
Entry Wire Line
	6550 3450 6650 3550
Entry Wire Line
	6550 3550 6650 3650
Entry Wire Line
	6550 3650 6650 3750
Entry Wire Line
	6550 3750 6650 3850
Entry Wire Line
	6550 3850 6650 3950
Entry Wire Line
	6550 3950 6650 4050
Wire Wire Line
	6200 3950 6550 3950
Wire Wire Line
	6550 3850 6200 3850
Wire Wire Line
	6200 3750 6550 3750
Wire Wire Line
	6550 3650 6200 3650
Wire Wire Line
	6200 3550 6550 3550
Wire Wire Line
	6550 3450 6200 3450
Wire Wire Line
	6200 3350 6550 3350
Wire Wire Line
	6550 3250 6200 3250
Entry Wire Line
	7500 3050 7600 3150
Entry Wire Line
	7500 2950 7600 3050
Entry Wire Line
	7500 2850 7600 2950
Entry Wire Line
	7500 2750 7600 2850
Entry Wire Line
	7500 2650 7600 2750
Entry Wire Line
	7500 2550 7600 2650
Entry Wire Line
	7500 2450 7600 2550
Entry Wire Line
	7500 2350 7600 2450
Wire Wire Line
	6200 2350 7500 2350
Wire Wire Line
	6200 2450 7500 2450
Wire Wire Line
	6200 2550 7500 2550
Wire Wire Line
	6200 2650 7500 2650
Wire Wire Line
	6200 2750 7500 2750
Wire Wire Line
	6200 2850 7500 2850
Wire Wire Line
	6200 2950 7500 2950
Wire Wire Line
	6200 3050 7500 3050
Wire Bus Line
	6650 4250 6650 4950
Wire Bus Line
	6650 5150 6650 5850
Entry Wire Line
	6550 4150 6650 4250
Entry Wire Line
	6550 4250 6650 4350
Entry Wire Line
	6550 4350 6650 4450
Entry Wire Line
	6550 4450 6650 4550
Entry Wire Line
	6550 4550 6650 4650
Entry Wire Line
	6550 4650 6650 4750
Entry Wire Line
	6550 4750 6650 4850
Entry Wire Line
	6550 4850 6650 4950
Entry Wire Line
	6550 5050 6650 5150
Entry Wire Line
	6550 5150 6650 5250
Entry Wire Line
	6550 5250 6650 5350
Entry Wire Line
	6550 5350 6650 5450
Entry Wire Line
	6550 5450 6650 5550
Entry Wire Line
	6550 5550 6650 5650
Entry Wire Line
	6550 5650 6650 5750
Entry Wire Line
	6550 5750 6650 5850
Wire Wire Line
	6550 5750 6200 5750
Wire Wire Line
	6200 5650 6550 5650
Wire Wire Line
	6550 5550 6200 5550
Wire Wire Line
	6200 5450 6550 5450
Wire Wire Line
	6550 5350 6200 5350
Wire Wire Line
	6200 5250 6550 5250
Wire Wire Line
	6550 5150 6200 5150
Wire Wire Line
	6200 5050 6550 5050
Wire Wire Line
	6550 4850 6200 4850
Wire Wire Line
	6200 4750 6550 4750
Wire Wire Line
	6550 4650 6200 4650
Wire Wire Line
	6200 4550 6550 4550
Wire Wire Line
	6550 4450 6200 4450
Wire Wire Line
	6200 4350 6550 4350
Wire Wire Line
	6550 4250 6200 4250
Wire Wire Line
	6200 4150 6550 4150
$Comp
L Crystal Y1
U 1 1 58FB6081
P 1400 6250
F 0 "Y1" H 1400 6400 50  0000 C CNN
F 1 "12MHz" H 1400 6100 50  0000 C CNN
F 2 "Crystals:Crystal_SMD_5032-2pin_5.0x3.2mm" H 1400 6250 50  0001 C CNN
F 3 "" H 1400 6250 50  0001 C CNN
F 4 "535-10634-1-ND" H 1400 6250 60  0001 C CNN "DigiKey "
	1    1400 6250
	1    0    0    -1  
$EndComp
$Comp
L C_Small C7
U 1 1 58FB6207
P 1150 6450
F 0 "C7" H 1160 6520 50  0000 L CNN
F 1 "27p" H 1160 6370 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 1150 6450 50  0001 C CNN
F 3 "" H 1150 6450 50  0001 C CNN
F 4 "478-10518-1-ND" H 1150 6450 60  0001 C CNN "DigiKey "
	1    1150 6450
	1    0    0    -1  
$EndComp
$Comp
L C_Small C8
U 1 1 58FB66FC
P 1650 6450
F 0 "C8" H 1660 6520 50  0000 L CNN
F 1 "27p" H 1660 6370 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 1650 6450 50  0001 C CNN
F 3 "" H 1650 6450 50  0001 C CNN
F 4 "478-10518-1-ND" H 1650 6450 60  0001 C CNN "DigiKey "
	1    1650 6450
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 6250 1700 6250
Wire Wire Line
	1650 6250 1650 6350
Wire Wire Line
	1100 6250 1250 6250
Wire Wire Line
	1150 6250 1150 6350
Wire Wire Line
	1150 6550 1150 6700
Wire Wire Line
	1150 6700 1650 6700
Wire Wire Line
	1650 6700 1650 6550
$Comp
L GNDD #PWR019
U 1 1 58FB6A2F
P 1400 6750
F 0 "#PWR019" H 1400 6500 50  0001 C CNN
F 1 "GNDD" H 1400 6600 50  0000 C CNN
F 2 "" H 1400 6750 50  0001 C CNN
F 3 "" H 1400 6750 50  0001 C CNN
	1    1400 6750
	1    0    0    -1  
$EndComp
Wire Wire Line
	1400 6700 1400 6750
Connection ~ 1400 6700
Text GLabel 1100 6250 0    60   Input ~ 0
FTOSC+
Connection ~ 1150 6250
Text GLabel 1700 6250 2    60   Input ~ 0
FTOSC-
Connection ~ 1650 6250
Text Label 3250 3850 0    60   ~ 0
nRESET
Text Label 3650 3650 0    60   ~ 0
REF
Text Label 1700 2550 0    60   ~ 0
VREGOUT
Text Label 6200 2350 0    60   ~ 0
ADBUS0
Text Label 6200 2450 0    60   ~ 0
ADBUS1
Text Label 6200 2550 0    60   ~ 0
ADBUS2
Text Label 6200 2650 0    60   ~ 0
ADBUS3
Text Label 6200 2750 0    60   ~ 0
ADBUS4
Text Label 6200 2850 0    60   ~ 0
ADBUS5
Text Label 6200 2950 0    60   ~ 0
ADBUS6
Text Label 6200 3050 0    60   ~ 0
ADBUS7
Text HLabel 7600 2450 2    60   Input ~ 0
ADBUS[7..0]
Text HLabel 6650 3350 2    60   Input ~ 0
ACBUS[7..0]
Text HLabel 6650 4250 2    60   Input ~ 0
BDBUS[7..0]
Text HLabel 6650 5150 2    60   Input ~ 0
BCBUS[7..0]
Text Label 6200 3250 0    60   ~ 0
ACBUS0
Text Label 6200 3350 0    60   ~ 0
ACBUS1
Text Label 6200 3450 0    60   ~ 0
ACBUS2
Text Label 6200 3550 0    60   ~ 0
ACBUS3
Text Label 6200 3650 0    60   ~ 0
ACBUS4
Text Label 6200 3750 0    60   ~ 0
ACBUS5
Text Label 6200 3850 0    60   ~ 0
ACBUS6
Text Label 6200 3950 0    60   ~ 0
ACBUS7
Text Label 6200 4150 0    60   ~ 0
BDBUS0
Text Label 6200 4250 0    60   ~ 0
BDBUS1
Text Label 6200 4350 0    60   ~ 0
BDBUS2
Text Label 6200 4450 0    60   ~ 0
BDBUS3
Text Label 6200 4550 0    60   ~ 0
BDBUS4
Text Label 6200 4650 0    60   ~ 0
BDBUS5
Text Label 6200 4750 0    60   ~ 0
BDBUS6
Text Label 6200 4850 0    60   ~ 0
BDBUS7
Text Label 6200 5050 0    60   ~ 0
BCBUS0
Text Label 6200 5150 0    60   ~ 0
BCBUS1
Text Label 6200 5250 0    60   ~ 0
BCBUS2
Text Label 6200 5350 0    60   ~ 0
BCBUS3
Text Label 6200 5450 0    60   ~ 0
BCBUS4
Text Label 6200 5550 0    60   ~ 0
BCBUS5
Text Label 6200 5650 0    60   ~ 0
BCBUS6
Text Label 6200 5750 0    60   ~ 0
BCBUS7
Text GLabel 6650 2200 1    60   Input ~ 0
SPI_CLK
Text GLabel 6800 2200 1    60   Input ~ 0
SPI_DO
Text GLabel 6950 2200 1    60   Input ~ 0
SPI_DI
Text GLabel 7100 2200 1    60   Input ~ 0
SPI_CS
Wire Wire Line
	6650 2200 6650 2350
Connection ~ 6650 2350
Wire Wire Line
	6800 2200 6800 2450
Connection ~ 6800 2450
Wire Wire Line
	6950 2200 6950 2550
Connection ~ 6950 2550
Wire Wire Line
	7100 2200 7100 2650
Connection ~ 7100 2650
Text GLabel 7250 2200 1    60   Input ~ 0
RESET
Wire Wire Line
	7250 2200 7250 2750
Connection ~ 7250 2750
Text GLabel 7400 2200 1    60   Input ~ 0
TRIGGER
Wire Wire Line
	7400 2200 7400 2850
Connection ~ 7400 2850
$EndSCHEMATC
