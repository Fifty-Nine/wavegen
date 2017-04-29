EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
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
LIBS:linear
LIBS:ltc6409
LIBS:ltc6269
LIBS:rev3-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 5 5
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
L AD9102 U6
U 1 1 58FBEC91
P 5050 3200
F 0 "U6" H 5050 3100 50  0000 C CNN
F 1 "AD9102" H 5050 3300 50  0000 C CNN
F 2 "footprints:AD9102-10LFCSP" H 5050 3200 50  0001 C CNN
F 3 "DOCUMENTATION" H 5050 3200 50  0001 C CNN
F 4 "AD9102BCPZ-ND" H 5050 3200 60  0001 C CNN "DigiKey"
	1    5050 3200
	1    0    0    -1  
$EndComp
$Comp
L C_Small C24
U 1 1 58FC0C2E
P 5550 2050
F 0 "C24" H 5560 2120 50  0000 L CNN
F 1 "100n" H 5560 1970 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 5550 2050 50  0001 C CNN
F 3 "" H 5550 2050 50  0001 C CNN
	1    5550 2050
	-1   0    0    1   
$EndComp
$Comp
L GNDA #PWR027
U 1 1 58FC0C7B
P 5550 2200
F 0 "#PWR027" H 5550 1950 50  0001 C CNN
F 1 "GNDA" H 5550 2050 50  0000 C CNN
F 2 "" H 5550 2200 50  0001 C CNN
F 3 "" H 5550 2200 50  0001 C CNN
	1    5550 2200
	1    0    0    -1  
$EndComp
NoConn ~ 6100 3900
NoConn ~ 6100 3800
NoConn ~ 6100 3700
NoConn ~ 6100 3600
NoConn ~ 6100 3500
NoConn ~ 6100 3400
NoConn ~ 6100 3300
NoConn ~ 6100 3200
Text GLabel 3400 2050 0    60   Input ~ 0
SPI_CLK
Text GLabel 3400 2200 0    60   Input ~ 0
SPI_DO
Text GLabel 3400 2350 0    60   Input ~ 0
SPI_DI
Text GLabel 3450 2850 0    60   Input ~ 0
SPI_CS
Text GLabel 2700 3100 0    60   Input ~ 0
RESET
$Comp
L R_Small R16
U 1 1 58FC2D2F
P 2750 2950
F 0 "R16" H 2780 2970 50  0000 L CNN
F 1 "4.7k" H 2780 2910 50  0000 L CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" H 2750 2950 50  0001 C CNN
F 3 "" H 2750 2950 50  0001 C CNN
	1    2750 2950
	1    0    0    -1  
$EndComp
Text GLabel 2700 3250 0    60   Input ~ 0
TRIGGER
$Comp
L R_Small R17
U 1 1 58FC3138
P 2950 2950
F 0 "R17" H 2980 2970 50  0000 L CNN
F 1 "4.7k" H 2980 2910 50  0000 L CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" H 2950 2950 50  0001 C CNN
F 3 "" H 2950 2950 50  0001 C CNN
	1    2950 2950
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR028
U 1 1 58FC3163
P 2750 2700
F 0 "#PWR028" H 2750 2550 50  0001 C CNN
F 1 "+3.3V" H 2750 2840 50  0000 C CNN
F 2 "" H 2750 2700 50  0001 C CNN
F 3 "" H 2750 2700 50  0001 C CNN
	1    2750 2700
	1    0    0    -1  
$EndComp
$Comp
L C_Small C41
U 1 1 58FC38AC
P 3900 4600
F 0 "C41" H 3910 4670 50  0000 L CNN
F 1 "100n" H 3910 4520 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 3900 4600 50  0001 C CNN
F 3 "" H 3900 4600 50  0001 C CNN
	1    3900 4600
	1    0    0    -1  
$EndComp
$Comp
L C_Small C39
U 1 1 58FC38E0
P 3500 4600
F 0 "C39" H 3510 4670 50  0000 L CNN
F 1 "100n" H 3510 4520 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 3500 4600 50  0001 C CNN
F 3 "" H 3500 4600 50  0001 C CNN
	1    3500 4600
	1    0    0    -1  
$EndComp
$Comp
L C_Small C40
U 1 1 58FC40BE
P 3700 4600
F 0 "C40" H 3710 4670 50  0000 L CNN
F 1 "100n" H 3710 4520 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 3700 4600 50  0001 C CNN
F 3 "" H 3700 4600 50  0001 C CNN
	1    3700 4600
	1    0    0    -1  
$EndComp
$Comp
L GNDD #PWR029
U 1 1 58FC7C00
P 3100 4800
F 0 "#PWR029" H 3100 4550 50  0001 C CNN
F 1 "GNDD" H 3100 4650 50  0000 C CNN
F 2 "" H 3100 4800 50  0001 C CNN
F 3 "" H 3100 4800 50  0001 C CNN
	1    3100 4800
	1    0    0    -1  
$EndComp
$Comp
L C_Small C38
U 1 1 58FC8689
P 3300 4600
F 0 "C38" H 3310 4670 50  0000 L CNN
F 1 "100n" H 3310 4520 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 3300 4600 50  0001 C CNN
F 3 "" H 3300 4600 50  0001 C CNN
	1    3300 4600
	1    0    0    -1  
$EndComp
$Comp
L C_Small C35
U 1 1 58FC8AA9
P 6550 4550
F 0 "C35" H 6560 4620 50  0000 L CNN
F 1 "100n" H 6560 4470 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 6550 4550 50  0001 C CNN
F 3 "" H 6550 4550 50  0001 C CNN
	1    6550 4550
	-1   0    0    1   
$EndComp
$Comp
L C_Small C34
U 1 1 58FC8B83
P 6350 4550
F 0 "C34" H 6360 4620 50  0000 L CNN
F 1 "10u" H 6360 4470 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 6350 4550 50  0001 C CNN
F 3 "" H 6350 4550 50  0001 C CNN
	1    6350 4550
	-1   0    0    1   
$EndComp
$Comp
L C_Small C36
U 1 1 58FC8C64
P 6750 4550
F 0 "C36" H 6760 4620 50  0000 L CNN
F 1 "100n" H 6760 4470 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 6750 4550 50  0001 C CNN
F 3 "" H 6750 4550 50  0001 C CNN
	1    6750 4550
	-1   0    0    1   
$EndComp
$Comp
L GNDA #PWR030
U 1 1 58FC8E30
P 6350 4750
F 0 "#PWR030" H 6350 4500 50  0001 C CNN
F 1 "GNDA" H 6350 4600 50  0000 C CNN
F 2 "" H 6350 4750 50  0001 C CNN
F 3 "" H 6350 4750 50  0001 C CNN
	1    6350 4750
	1    0    0    -1  
$EndComp
$Comp
L GNDA #PWR031
U 1 1 58FC9D68
P 5350 5150
F 0 "#PWR031" H 5350 4900 50  0001 C CNN
F 1 "GNDA" H 5350 5000 50  0000 C CNN
F 2 "" H 5350 5150 50  0001 C CNN
F 3 "" H 5350 5150 50  0001 C CNN
	1    5350 5150
	1    0    0    -1  
$EndComp
$Comp
L GNDD #PWR032
U 1 1 58FC9D94
P 4750 5150
F 0 "#PWR032" H 4750 4900 50  0001 C CNN
F 1 "GNDD" H 4750 5000 50  0000 C CNN
F 2 "" H 4750 5150 50  0001 C CNN
F 3 "" H 4750 5150 50  0001 C CNN
	1    4750 5150
	1    0    0    -1  
$EndComp
$Comp
L C_Small C37
U 1 1 58FCA17C
P 3100 4600
F 0 "C37" H 3110 4670 50  0000 L CNN
F 1 "100n" H 3110 4520 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 3100 4600 50  0001 C CNN
F 3 "" H 3100 4600 50  0001 C CNN
	1    3100 4600
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR033
U 1 1 58FCA3F3
P 3100 3950
F 0 "#PWR033" H 3100 3800 50  0001 C CNN
F 1 "+3.3V" H 3100 4090 50  0000 C CNN
F 2 "" H 3100 3950 50  0001 C CNN
F 3 "" H 3100 3950 50  0001 C CNN
	1    3100 3950
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR034
U 1 1 58FCA4B2
P 3300 4250
F 0 "#PWR034" H 3300 4100 50  0001 C CNN
F 1 "+3.3V" H 3300 4390 50  0000 C CNN
F 2 "" H 3300 4250 50  0001 C CNN
F 3 "" H 3300 4250 50  0001 C CNN
	1    3300 4250
	1    0    0    -1  
$EndComp
$Comp
L R_Small R11
U 1 1 58FCB1A6
P 4800 2000
F 0 "R11" H 4830 2020 50  0000 L CNN
F 1 "8.25k" H 4830 1960 50  0000 L CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" H 4800 2000 50  0001 C CNN
F 3 "" H 4800 2000 50  0001 C CNN
	1    4800 2000
	-1   0    0    1   
$EndComp
$Comp
L +3.3V #PWR035
U 1 1 58FCEDEE
P 6350 4300
F 0 "#PWR035" H 6350 4150 50  0001 C CNN
F 1 "+3.3V" H 6350 4440 50  0000 C CNN
F 2 "" H 6350 4300 50  0001 C CNN
F 3 "" H 6350 4300 50  0001 C CNN
	1    6350 4300
	1    0    0    -1  
$EndComp
Text GLabel 3450 3300 0    60   Input ~ 0
DCLK+
Text GLabel 3450 3650 0    60   Input ~ 0
DCLK-
$Comp
L C_Small C30
U 1 1 58FD03F0
P 3900 3300
F 0 "C30" V 3850 3125 50  0000 L CNN
F 1 "100n" V 3850 3350 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 3900 3300 50  0001 C CNN
F 3 "" H 3900 3300 50  0001 C CNN
	1    3900 3300
	0    1    1    0   
$EndComp
$Comp
L C_Small C33
U 1 1 58FD0951
P 3900 3650
F 0 "C33" V 3950 3475 50  0000 L CNN
F 1 "100n" V 3950 3700 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 3900 3650 50  0001 C CNN
F 3 "" H 3900 3650 50  0001 C CNN
	1    3900 3650
	0    1    1    0   
$EndComp
$Comp
L R_Small R24
U 1 1 58FD0B74
P 3550 3500
F 0 "R24" H 3580 3520 50  0000 L CNN
F 1 "100" H 3580 3460 50  0000 L CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" H 3550 3500 50  0001 C CNN
F 3 "" H 3550 3500 50  0001 C CNN
	1    3550 3500
	1    0    0    -1  
$EndComp
$Comp
L GNDA #PWR036
U 1 1 58FD5AAB
P 4800 2150
F 0 "#PWR036" H 4800 1900 50  0001 C CNN
F 1 "GNDA" H 4800 2000 50  0000 C CNN
F 2 "" H 4800 2150 50  0001 C CNN
F 3 "" H 4800 2150 50  0001 C CNN
	1    4800 2150
	1    0    0    -1  
$EndComp
$Comp
L LMK61XX X1
U 1 1 58FD6392
P 1550 6150
F 0 "X1" H 1350 6500 50  0000 C CNN
F 1 "DSC1123" H 1550 6400 50  0000 C CNN
F 2 "footprints:7050XO" H 1550 6150 50  0001 C CNN
F 3 "DOCUMENTATION" H 1550 6150 50  0001 C CNN
F 4 "Value" H 1550 6150 60  0001 C CNN "Fieldname"
F 5 "576-4642-ND" H 1550 6150 60  0001 C CNN "DigiKey"
	1    1550 6150
	1    0    0    -1  
$EndComp
$Comp
L C_Small C42
U 1 1 58FD71B9
P 2250 5750
F 0 "C42" H 2260 5820 50  0000 L CNN
F 1 "10u" H 2260 5670 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 2250 5750 50  0001 C CNN
F 3 "" H 2250 5750 50  0001 C CNN
	1    2250 5750
	1    0    0    -1  
$EndComp
$Comp
L C_Small C43
U 1 1 58FD752B
P 2450 5750
F 0 "C43" H 2460 5820 50  0000 L CNN
F 1 "1u" H 2460 5670 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 2450 5750 50  0001 C CNN
F 3 "" H 2450 5750 50  0001 C CNN
	1    2450 5750
	1    0    0    -1  
$EndComp
$Comp
L C_Small C44
U 1 1 58FD75AB
P 2650 5750
F 0 "C44" H 2660 5820 50  0000 L CNN
F 1 "100n" H 2660 5670 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 2650 5750 50  0001 C CNN
F 3 "" H 2650 5750 50  0001 C CNN
	1    2650 5750
	1    0    0    -1  
$EndComp
$Comp
L GNDD #PWR037
U 1 1 58FD7913
P 2250 5950
F 0 "#PWR037" H 2250 5700 50  0001 C CNN
F 1 "GNDD" H 2250 5800 50  0000 C CNN
F 2 "" H 2250 5950 50  0001 C CNN
F 3 "" H 2250 5950 50  0001 C CNN
	1    2250 5950
	1    0    0    -1  
$EndComp
Text GLabel 2200 6550 2    60   Input ~ 0
DCLK+
Text GLabel 2200 6400 2    60   Input ~ 0
DCLK-
$Comp
L GNDD #PWR038
U 1 1 58FD9192
P 1050 6350
F 0 "#PWR038" H 1050 6100 50  0001 C CNN
F 1 "GNDD" H 1050 6200 50  0000 C CNN
F 2 "" H 1050 6350 50  0001 C CNN
F 3 "" H 1050 6350 50  0001 C CNN
	1    1050 6350
	1    0    0    -1  
$EndComp
NoConn ~ 1100 6150
NoConn ~ 1100 6050
$Comp
L +3.3V #PWR039
U 1 1 58FD9DFC
P 2000 5500
F 0 "#PWR039" H 2000 5350 50  0001 C CNN
F 1 "+3.3V" H 2000 5640 50  0000 C CNN
F 2 "" H 2000 5500 50  0001 C CNN
F 3 "" H 2000 5500 50  0001 C CNN
	1    2000 5500
	1    0    0    -1  
$EndComp
$Comp
L R_Small R13
U 1 1 58FDA7E4
P 3550 2700
F 0 "R13" H 3580 2720 50  0000 L CNN
F 1 "4.7k" H 3580 2660 50  0000 L CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" H 3550 2700 50  0001 C CNN
F 3 "" H 3550 2700 50  0001 C CNN
	1    3550 2700
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR040
U 1 1 58FDA8AD
P 3550 2550
F 0 "#PWR040" H 3550 2400 50  0001 C CNN
F 1 "+3.3V" H 3550 2690 50  0000 C CNN
F 2 "" H 3550 2550 50  0001 C CNN
F 3 "" H 3550 2550 50  0001 C CNN
	1    3550 2550
	1    0    0    -1  
$EndComp
$Comp
L R_Small R19
U 1 1 58FD676A
P 6550 3375
F 0 "R19" H 6580 3395 50  0000 L CNN
F 1 "100" H 6580 3335 50  0000 L CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" H 6550 3375 50  0001 C CNN
F 3 "" H 6550 3375 50  0001 C CNN
	1    6550 3375
	-1   0    0    1   
$EndComp
$Comp
L R_Small R20
U 1 1 58FD6A4A
P 6775 3375
F 0 "R20" H 6805 3395 50  0000 L CNN
F 1 "100" H 6805 3335 50  0000 L CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" H 6775 3375 50  0001 C CNN
F 3 "" H 6775 3375 50  0001 C CNN
	1    6775 3375
	-1   0    0    1   
$EndComp
$Comp
L GNDA #PWR041
U 1 1 58FD7350
P 6675 3650
F 0 "#PWR041" H 6675 3400 50  0001 C CNN
F 1 "GNDA" H 6675 3500 50  0000 C CNN
F 2 "" H 6675 3650 50  0001 C CNN
F 3 "" H 6675 3650 50  0001 C CNN
	1    6675 3650
	1    0    0    -1  
$EndComp
$Comp
L R_Small R15
U 1 1 58FD8D24
P 6950 2900
F 0 "R15" V 7025 2850 50  0000 L CNN
F 1 "100" V 6875 2850 50  0000 L CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" H 6950 2900 50  0001 C CNN
F 3 "" H 6950 2900 50  0001 C CNN
	1    6950 2900
	0    -1   -1   0   
$EndComp
$Comp
L R_Small R22
U 1 1 58FD8D9B
P 6950 3125
F 0 "R22" V 7025 3075 50  0000 L CNN
F 1 "100" V 6875 3075 50  0000 L CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" H 6950 3125 50  0001 C CNN
F 3 "" H 6950 3125 50  0001 C CNN
	1    6950 3125
	0    -1   -1   0   
$EndComp
$Comp
L R_Small R12
U 1 1 58FD8F44
P 7450 2500
F 0 "R12" V 7525 2425 50  0000 L CNN
F 1 "510" V 7375 2425 50  0000 L CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" H 7450 2500 50  0001 C CNN
F 3 "" H 7450 2500 50  0001 C CNN
	1    7450 2500
	0    -1   -1   0   
$EndComp
$Comp
L R_Small R27
U 1 1 58FD9798
P 7450 3800
F 0 "R27" V 7525 3725 50  0000 L CNN
F 1 "510" V 7375 3725 50  0000 L CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" H 7450 3800 50  0001 C CNN
F 3 "" H 7450 3800 50  0001 C CNN
	1    7450 3800
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2700 3100 4000 3100
Wire Wire Line
	2750 3050 2750 3100
Connection ~ 2750 3100
Wire Wire Line
	2750 2700 2750 2850
Wire Wire Line
	2750 2750 2950 2750
Wire Wire Line
	2950 2750 2950 2850
Connection ~ 2750 2750
Wire Wire Line
	2950 3050 2950 3250
Connection ~ 2950 3200
Wire Wire Line
	2950 3250 2700 3250
Wire Wire Line
	4000 3200 2950 3200
Wire Wire Line
	4000 2550 3950 2550
Wire Wire Line
	3950 2550 3950 2050
Wire Wire Line
	3950 2050 3400 2050
Wire Wire Line
	3900 2200 3900 2650
Wire Wire Line
	3900 2650 4000 2650
Wire Wire Line
	3400 2200 3900 2200
Wire Wire Line
	3450 2850 4000 2850
Wire Wire Line
	3400 2350 3850 2350
Wire Wire Line
	3850 2350 3850 2750
Wire Wire Line
	3850 2750 4000 2750
Wire Wire Line
	4000 4500 3900 4500
Wire Wire Line
	4000 4400 3700 4400
Wire Wire Line
	3700 4400 3700 4500
Wire Wire Line
	3700 4750 3700 4700
Wire Wire Line
	3100 4750 3900 4750
Wire Wire Line
	3900 4750 3900 4700
Wire Wire Line
	3500 4500 3500 4100
Wire Wire Line
	3500 4100 4000 4100
Connection ~ 3700 4750
Connection ~ 3500 4750
Wire Wire Line
	3300 4250 3300 4500
Wire Wire Line
	3300 4300 4000 4300
Wire Wire Line
	3300 4700 3300 4750
Connection ~ 3300 4750
Wire Wire Line
	3500 4750 3500 4700
Wire Wire Line
	4750 4950 4750 5150
Wire Wire Line
	4750 5050 5350 5050
Wire Wire Line
	5350 4950 5350 5150
Connection ~ 4750 5050
Connection ~ 5350 5050
Wire Wire Line
	5250 4950 5250 5050
Connection ~ 5250 5050
Wire Wire Line
	5150 5050 5150 4950
Connection ~ 5150 5050
Wire Wire Line
	4900 4950 4900 5050
Connection ~ 4900 5050
Wire Wire Line
	3100 3950 3100 4500
Wire Wire Line
	3100 4000 4000 4000
Wire Wire Line
	3100 4700 3100 4800
Connection ~ 3100 4750
Connection ~ 3100 4000
Connection ~ 3300 4300
Wire Wire Line
	5300 2150 5300 1850
Wire Wire Line
	5300 1850 5550 1850
Wire Wire Line
	5550 1850 5550 1950
Wire Wire Line
	5000 1800 5000 2150
Wire Wire Line
	6100 4400 6750 4400
Wire Wire Line
	6350 4300 6350 4450
Connection ~ 6350 4400
Wire Wire Line
	6100 4400 6100 4500
Wire Wire Line
	6350 4650 6350 4750
Wire Wire Line
	6350 4700 6750 4700
Wire Wire Line
	6550 4700 6550 4650
Connection ~ 6350 4700
Wire Wire Line
	6750 4700 6750 4650
Connection ~ 6550 4700
Wire Wire Line
	6750 4400 6750 4450
Wire Wire Line
	6550 4450 6550 4400
Connection ~ 6550 4400
Wire Wire Line
	4000 3650 4000 3550
Wire Wire Line
	4000 3300 4000 3450
Wire Wire Line
	3450 3300 3800 3300
Connection ~ 3550 3300
Wire Wire Line
	3450 3650 3800 3650
Wire Wire Line
	3550 3650 3550 3600
Connection ~ 3550 3650
Wire Wire Line
	3550 3300 3550 3400
Wire Wire Line
	6100 2900 6850 2900
Wire Wire Line
	6100 3000 6550 3000
Wire Wire Line
	5550 2200 5550 2150
Wire Wire Line
	5150 1800 5150 2150
Connection ~ 5150 1800
Wire Wire Line
	4800 1800 5150 1800
Wire Wire Line
	4800 1800 4800 1900
Connection ~ 5000 1800
Wire Wire Line
	4800 2100 4800 2150
Wire Wire Line
	2650 5550 2650 5650
Wire Wire Line
	2000 5550 2650 5550
Wire Wire Line
	2450 5550 2450 5650
Wire Wire Line
	2250 5550 2250 5650
Connection ~ 2450 5550
Wire Wire Line
	2000 5500 2000 6050
Connection ~ 2250 5550
Wire Wire Line
	2250 5850 2250 5950
Wire Wire Line
	2250 5900 2650 5900
Wire Wire Line
	2450 5900 2450 5850
Connection ~ 2250 5900
Wire Wire Line
	2650 5900 2650 5850
Connection ~ 2450 5900
Wire Wire Line
	2000 6150 2100 6150
Wire Wire Line
	2000 6250 2050 6250
Wire Wire Line
	2100 6150 2100 6400
Wire Wire Line
	2100 6400 2200 6400
Wire Wire Line
	2050 6250 2050 6550
Wire Wire Line
	2050 6550 2200 6550
Wire Wire Line
	1100 6250 1050 6250
Wire Wire Line
	1050 6250 1050 6350
Connection ~ 2000 5550
Wire Wire Line
	3550 2850 3550 2800
Connection ~ 3550 2850
Wire Wire Line
	3550 2600 3550 2550
Wire Wire Line
	6675 3550 6675 3650
Connection ~ 6675 3550
Connection ~ 6775 2900
Wire Wire Line
	7050 2900 7550 2900
Wire Wire Line
	7250 2500 7250 2900
Wire Wire Line
	7250 2500 7350 2500
Connection ~ 7250 2900
Wire Wire Line
	7050 3125 7250 3300
Wire Wire Line
	7250 3300 7550 3300
Wire Wire Line
	7550 2500 8350 2500
Wire Wire Line
	8350 2500 8350 2900
Wire Wire Line
	7550 3800 8350 3800
Wire Wire Line
	8350 3800 8350 3300
Wire Wire Line
	7250 3800 7350 3800
Wire Wire Line
	7250 3300 7250 3800
Connection ~ 7250 3300
Connection ~ 7850 3475
Wire Wire Line
	7950 3475 7950 3450
Wire Wire Line
	7750 3475 7950 3475
Wire Wire Line
	7750 3475 7750 3450
$Comp
L +3.3V #PWR042
U 1 1 58FDC44F
P 7850 1600
F 0 "#PWR042" H 7850 1450 50  0001 C CNN
F 1 "+3.3V" H 7850 1740 50  0000 C CNN
F 2 "" H 7850 1600 50  0001 C CNN
F 3 "" H 7850 1600 50  0001 C CNN
	1    7850 1600
	1    0    0    -1  
$EndComp
Text GLabel 7550 3100 0    60   Input ~ 0
VOCM
Text GLabel 7050 1575 0    60   Input ~ 0
VOCM
$Comp
L +3.3V #PWR043
U 1 1 58FDD1BE
P 7275 1100
F 0 "#PWR043" H 7275 950 50  0001 C CNN
F 1 "+3.3V" H 7275 1240 50  0000 C CNN
F 2 "" H 7275 1100 50  0001 C CNN
F 3 "" H 7275 1100 50  0001 C CNN
	1    7275 1100
	1    0    0    -1  
$EndComp
$Comp
L R_Small R9
U 1 1 58FDD226
P 7275 1425
F 0 "R9" H 7305 1445 50  0000 L CNN
F 1 "DNP" H 7305 1385 50  0000 L CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" H 7275 1425 50  0001 C CNN
F 3 "" H 7275 1425 50  0001 C CNN
	1    7275 1425
	1    0    0    -1  
$EndComp
$Comp
L R_Small R10
U 1 1 58FDD309
P 7275 1725
F 0 "R10" H 7305 1745 50  0000 L CNN
F 1 "DNP" H 7305 1685 50  0000 L CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" H 7275 1725 50  0001 C CNN
F 3 "" H 7275 1725 50  0001 C CNN
	1    7275 1725
	1    0    0    -1  
$EndComp
Wire Wire Line
	7275 1525 7275 1625
Wire Wire Line
	7275 1575 7050 1575
Connection ~ 7275 1575
Wire Wire Line
	7275 1325 7275 1100
$Comp
L GNDA #PWR044
U 1 1 58FDD7D7
P 7275 1900
F 0 "#PWR044" H 7275 1650 50  0001 C CNN
F 1 "GNDA" H 7275 1750 50  0000 C CNN
F 2 "" H 7275 1900 50  0001 C CNN
F 3 "" H 7275 1900 50  0001 C CNN
	1    7275 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	7275 1825 7275 1900
$Comp
L C_Small C26
U 1 1 58FDE836
P 7450 2675
F 0 "C26" V 7500 2700 50  0000 L CNN
F 1 "0.8p" V 7550 2500 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 7450 2675 50  0001 C CNN
F 3 "" H 7450 2675 50  0001 C CNN
	1    7450 2675
	0    1    1    0   
$EndComp
Wire Wire Line
	7350 2675 7250 2675
Connection ~ 7250 2675
Wire Wire Line
	7550 2675 7625 2675
Wire Wire Line
	7625 2675 7625 2500
Connection ~ 7625 2500
$Comp
L C_Small C32
U 1 1 58FDEB01
P 7450 3500
F 0 "C32" V 7550 3425 50  0000 L CNN
F 1 "0.8p" V 7350 3425 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 7450 3500 50  0001 C CNN
F 3 "" H 7450 3500 50  0001 C CNN
	1    7450 3500
	0    1    1    0   
$EndComp
Wire Wire Line
	7350 3500 7250 3500
Connection ~ 7250 3500
Wire Wire Line
	7550 3500 7650 3500
Wire Wire Line
	7650 3500 7650 3800
Connection ~ 7650 3800
$Comp
L C_Small C23
U 1 1 58FE1BB3
P 8125 1950
F 0 "C23" V 8175 2000 50  0000 L CNN
F 1 "100n" V 8175 1725 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 8125 1950 50  0001 C CNN
F 3 "" H 8125 1950 50  0001 C CNN
	1    8125 1950
	0    -1   -1   0   
$EndComp
$Comp
L C_Small C25
U 1 1 58FE310B
P 8125 2225
F 0 "C25" V 8175 2275 50  0000 L CNN
F 1 "100n" V 8175 2000 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 8125 2225 50  0001 C CNN
F 3 "" H 8125 2225 50  0001 C CNN
	1    8125 2225
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6550 3000 6550 3275
Wire Wire Line
	6550 3550 6550 3475
Wire Wire Line
	6775 2900 6775 3275
$Comp
L R_Small R29
U 1 1 59016EA8
P 8050 4125
F 0 "R29" H 8080 4145 50  0000 L CNN
F 1 "4.7k" H 8080 4085 50  0000 L CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" H 8050 4125 50  0001 C CNN
F 3 "" H 8050 4125 50  0001 C CNN
	1    8050 4125
	1    0    0    -1  
$EndComp
$Comp
L LTC6409 U4
U 1 1 58FD887F
P 7850 3100
F 0 "U4" H 8125 3350 50  0000 L CNN
F 1 "LTC6409" H 8040 2840 50  0000 L CNN
F 2 "footprints:LTC6409-UDB" H 7850 3000 50  0001 C CNN
F 3 "" H 7850 3000 50  0001 C CNN
	1    7850 3100
	1    0    0    -1  
$EndComp
$Comp
L Ferrite_Bead_Small L4
U 1 1 5901E913
P 8325 3925
F 0 "L4" V 8275 3800 50  0000 L CNN
F 1 "800m" V 8450 3875 50  0000 L CNN
F 2 "Inductors_SMD:L_0603_HandSoldering" V 8255 3925 50  0001 C CNN
F 3 "" H 8325 3925 50  0001 C CNN
	1    8325 3925
	0    1    1    0   
$EndComp
Wire Wire Line
	8050 3450 8050 4025
Wire Wire Line
	8225 3925 8050 3925
Connection ~ 8050 3925
Text GLabel 8425 3925 2    60   Input ~ 0
AMP0_EN
Wire Wire Line
	7850 3450 7850 3550
$Comp
L GNDA #PWR045
U 1 1 59023A6F
P 7850 3550
F 0 "#PWR045" H 7850 3300 50  0001 C CNN
F 1 "GNDA" H 7850 3400 50  0000 C CNN
F 2 "" H 7850 3550 50  0001 C CNN
F 3 "" H 7850 3550 50  0001 C CNN
	1    7850 3550
	1    0    0    -1  
$EndComp
$Comp
L GNDA #PWR046
U 1 1 59023BAE
P 8050 4275
F 0 "#PWR046" H 8050 4025 50  0001 C CNN
F 1 "GNDA" H 8050 4125 50  0000 C CNN
F 2 "" H 8050 4275 50  0001 C CNN
F 3 "" H 8050 4275 50  0001 C CNN
	1    8050 4275
	1    0    0    -1  
$EndComp
Wire Wire Line
	8050 4275 8050 4225
$Comp
L LTC6269 U5
U 1 1 59024956
P 9650 3100
F 0 "U5" H 9500 3350 50  0000 C CNN
F 1 "LTC6269" H 9500 2700 50  0000 L CNN
F 2 "footprints:LTC6269-10DFN" H 9600 3200 50  0001 C CNN
F 3 "" H 9700 3300 50  0001 C CNN
	1    9650 3100
	1    0    0    -1  
$EndComp
Text GLabel 8450 2850 1    60   Input ~ 0
VOUT-
Text GLabel 8450 3350 3    60   Input ~ 0
VOUT+
$Comp
L R_Small R21
U 1 1 59025B3B
P 8775 3200
F 0 "R21" V 8700 3250 50  0000 L CNN
F 1 "1k" V 8700 3075 50  0000 L CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" H 8775 3200 50  0001 C CNN
F 3 "" H 8775 3200 50  0001 C CNN
	1    8775 3200
	0    -1   -1   0   
$EndComp
$Comp
L R_Small R18
U 1 1 59025D60
P 8775 3000
F 0 "R18" V 8700 3050 50  0000 L CNN
F 1 "1k" V 8700 2875 50  0000 L CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" H 8775 3000 50  0001 C CNN
F 3 "" H 8775 3000 50  0001 C CNN
	1    8775 3000
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8350 3300 8450 3300
Wire Wire Line
	8450 3200 8450 3350
Wire Wire Line
	8350 2900 8450 2900
Wire Wire Line
	8450 2850 8450 3000
Wire Wire Line
	8450 3000 8675 3000
Connection ~ 8450 2900
Wire Wire Line
	8450 3200 8675 3200
Connection ~ 8450 3300
$Comp
L R_Small R23
U 1 1 59026524
P 9125 3425
F 0 "R23" H 9200 3400 50  0000 L CNN
F 1 "1.5k" H 9175 3475 50  0000 L CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" H 9125 3425 50  0001 C CNN
F 3 "" H 9125 3425 50  0001 C CNN
	1    9125 3425
	1    0    0    -1  
$EndComp
$Comp
L C_Small C31
U 1 1 590267B7
P 8950 3425
F 0 "C31" H 9050 3400 50  0000 L CNN
F 1 "2.8p" H 9000 3500 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 8950 3425 50  0001 C CNN
F 3 "" H 8950 3425 50  0001 C CNN
	1    8950 3425
	-1   0    0    1   
$EndComp
Wire Wire Line
	8950 3525 9125 3525
Wire Wire Line
	9125 3525 9125 4400
Wire Wire Line
	9125 3750 9350 3750
Wire Wire Line
	8875 3200 9350 3200
Wire Wire Line
	9125 3200 9125 3325
Wire Wire Line
	8950 3325 8950 3200
Connection ~ 8950 3200
Connection ~ 9125 3200
Wire Wire Line
	8875 3000 9350 3000
$Comp
L R_Small R14
U 1 1 590271B5
P 9125 2775
F 0 "R14" H 9200 2750 50  0000 L CNN
F 1 "1.5k" H 9175 2825 50  0000 L CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" H 9125 2775 50  0001 C CNN
F 3 "" H 9125 2775 50  0001 C CNN
	1    9125 2775
	1    0    0    -1  
$EndComp
$Comp
L C_Small C27
U 1 1 5902726F
P 8950 2775
F 0 "C27" H 9050 2750 50  0000 L CNN
F 1 "2.8p" H 9000 2850 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 8950 2775 50  0001 C CNN
F 3 "" H 8950 2775 50  0001 C CNN
	1    8950 2775
	-1   0    0    1   
$EndComp
Wire Wire Line
	8950 3000 8950 2875
Connection ~ 8950 3000
Wire Wire Line
	9125 3000 9125 2875
Connection ~ 9125 3000
Wire Wire Line
	8950 2675 8950 2425
Wire Wire Line
	8950 2425 10125 2425
Wire Wire Line
	9125 2425 9125 2675
Wire Wire Line
	10075 2425 10075 3100
Wire Wire Line
	10075 3100 9950 3100
Connection ~ 9125 2425
$Comp
L R_Small R26
U 1 1 590277EA
P 10700 3650
F 0 "R26" V 10625 3600 50  0000 L CNN
F 1 "36k" V 10775 3600 50  0000 L CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" H 10700 3650 50  0001 C CNN
F 3 "" H 10700 3650 50  0001 C CNN
	1    10700 3650
	0    1    1    0   
$EndComp
$Comp
L R_Small R28
U 1 1 590279CA
P 10250 3800
F 0 "R28" H 10280 3820 50  0000 L CNN
F 1 "36k" H 10280 3760 50  0000 L CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" H 10250 3800 50  0001 C CNN
F 3 "" H 10250 3800 50  0001 C CNN
	1    10250 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	9950 3650 10600 3650
Connection ~ 10250 3650
$Comp
L GNDA #PWR047
U 1 1 59027DEB
P 10250 4000
F 0 "#PWR047" H 10250 3750 50  0001 C CNN
F 1 "GNDA" H 10250 3850 50  0000 C CNN
F 2 "" H 10250 4000 50  0001 C CNN
F 3 "" H 10250 4000 50  0001 C CNN
	1    10250 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	10250 3900 10250 4000
$Comp
L +3.3V #PWR048
U 1 1 59027F6D
P 10800 3575
F 0 "#PWR048" H 10800 3425 50  0001 C CNN
F 1 "+3.3V" H 10800 3715 50  0000 C CNN
F 2 "" H 10800 3575 50  0001 C CNN
F 3 "" H 10800 3575 50  0001 C CNN
	1    10800 3575
	1    0    0    -1  
$EndComp
Wire Wire Line
	10250 3650 10250 3700
Wire Wire Line
	9950 3850 9950 4400
Connection ~ 9125 3750
Wire Wire Line
	9950 3300 10450 3300
Wire Wire Line
	10100 3300 10100 3400
Wire Wire Line
	10100 3400 9950 3400
Text GLabel 10600 2950 2    60   Input ~ 0
AMP1_EN
$Comp
L Ferrite_Bead_Small L3
U 1 1 5902B983
P 10450 3175
F 0 "L3" H 10300 3175 50  0000 L CNN
F 1 "800m" H 10175 3250 50  0000 L CNN
F 2 "Inductors_SMD:L_0603_HandSoldering" V 10380 3175 50  0001 C CNN
F 3 "" H 10450 3175 50  0001 C CNN
	1    10450 3175
	-1   0    0    1   
$EndComp
Wire Wire Line
	10450 3300 10450 3275
Connection ~ 10100 3300
Wire Wire Line
	10450 3075 10450 2950
Wire Wire Line
	10450 2950 10600 2950
$Comp
L R_Small R25
U 1 1 5902C266
P 10100 3500
F 0 "R25" H 10130 3520 50  0000 L CNN
F 1 "4.7k" H 10130 3460 50  0000 L CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" H 10100 3500 50  0001 C CNN
F 3 "" H 10100 3500 50  0001 C CNN
	1    10100 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	10100 3600 10100 3950
Wire Wire Line
	10100 3950 10525 3950
Connection ~ 10250 3950
Text GLabel 10125 2425 2    60   Input ~ 0
VOUT
$Comp
L +3.3V #PWR049
U 1 1 5902D3C4
P 10275 2675
F 0 "#PWR049" H 10275 2525 50  0001 C CNN
F 1 "+3.3V" H 10275 2815 50  0000 C CNN
F 2 "" H 10275 2675 50  0001 C CNN
F 3 "" H 10275 2675 50  0001 C CNN
	1    10275 2675
	1    0    0    -1  
$EndComp
Wire Wire Line
	9800 2675 9800 2800
$Comp
L GNDA #PWR050
U 1 1 5902D55E
P 9550 4100
F 0 "#PWR050" H 9550 3850 50  0001 C CNN
F 1 "GNDA" H 9550 3950 50  0000 C CNN
F 2 "" H 9550 4100 50  0001 C CNN
F 3 "" H 9550 4100 50  0001 C CNN
	1    9550 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	9500 4050 9500 4100
Wire Wire Line
	9600 4100 9600 4050
Wire Wire Line
	9500 4100 9600 4100
Connection ~ 9550 4100
$Comp
L C_Small C22
U 1 1 5902DE05
P 8125 1700
F 0 "C22" V 8175 1750 50  0000 L CNN
F 1 "10u" V 8175 1525 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 8125 1700 50  0001 C CNN
F 3 "" H 8125 1700 50  0001 C CNN
	1    8125 1700
	0    -1   -1   0   
$EndComp
$Comp
L C_Small C28
U 1 1 5902EA3B
P 10150 2825
F 0 "C28" H 10160 2895 50  0000 L CNN
F 1 "100n" H 10160 2745 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 10150 2825 50  0001 C CNN
F 3 "" H 10150 2825 50  0001 C CNN
	1    10150 2825
	1    0    0    -1  
$EndComp
$Comp
L C_Small C29
U 1 1 5902F743
P 10375 2825
F 0 "C29" H 10385 2895 50  0000 L CNN
F 1 "10u" H 10385 2745 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 10375 2825 50  0001 C CNN
F 3 "" H 10375 2825 50  0001 C CNN
	1    10375 2825
	1    0    0    -1  
$EndComp
$Comp
L GNDA #PWR051
U 1 1 5902F90E
P 10275 3000
F 0 "#PWR051" H 10275 2750 50  0001 C CNN
F 1 "GNDA" H 10275 2850 50  0000 C CNN
F 2 "" H 10275 3000 50  0001 C CNN
F 3 "" H 10275 3000 50  0001 C CNN
	1    10275 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	10150 2925 10150 3000
Wire Wire Line
	10150 3000 10375 3000
Wire Wire Line
	10375 3000 10375 2925
Connection ~ 10275 3000
Wire Wire Line
	9800 2675 10375 2675
Connection ~ 10075 2425
Wire Wire Line
	10375 2675 10375 2725
Connection ~ 10275 2675
Wire Wire Line
	10150 2725 10150 2675
Connection ~ 10150 2675
Wire Wire Line
	7850 1600 7850 2800
Wire Wire Line
	7850 1700 8025 1700
Wire Wire Line
	7850 1950 8025 1950
Connection ~ 7850 1700
Wire Wire Line
	7850 2225 8025 2225
Connection ~ 7850 1950
Connection ~ 7850 2225
Wire Wire Line
	7850 2725 7950 2725
Wire Wire Line
	7950 2725 7950 2800
Connection ~ 7850 2725
Text Notes 7575 1975 0    60   ~ 0
Pin 4
Text Notes 7575 2250 0    60   ~ 0
Pin 9
$Comp
L GNDA #PWR052
U 1 1 59037B66
P 8450 2275
F 0 "#PWR052" H 8450 2025 50  0001 C CNN
F 1 "GNDA" H 8450 2125 50  0000 C CNN
F 2 "" H 8450 2275 50  0001 C CNN
F 3 "" H 8450 2275 50  0001 C CNN
	1    8450 2275
	1    0    0    -1  
$EndComp
Wire Wire Line
	8450 1700 8450 2275
Wire Wire Line
	8450 2225 8225 2225
Wire Wire Line
	8450 1950 8225 1950
Connection ~ 8450 2225
Wire Wire Line
	8450 1700 8225 1700
Connection ~ 8450 1950
Wire Wire Line
	6550 3550 6775 3550
Wire Wire Line
	6775 3550 6775 3475
Wire Wire Line
	6850 3125 6550 3125
Connection ~ 6550 3125
$Comp
L C_Small C46
U 1 1 59041C2E
P 10525 3800
F 0 "C46" H 10535 3870 50  0000 L CNN
F 1 "1u" H 10535 3720 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 10525 3800 50  0001 C CNN
F 3 "" H 10525 3800 50  0001 C CNN
	1    10525 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	10525 3700 10525 3650
Connection ~ 10525 3650
Wire Wire Line
	10525 3950 10525 3900
Wire Wire Line
	10800 3650 10800 3575
$Comp
L R_Small R30
U 1 1 59042814
P 9550 4400
F 0 "R30" V 9475 4350 50  0000 L CNN
F 1 "18k" V 9625 4350 50  0000 L CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" H 9550 4400 50  0001 C CNN
F 3 "" H 9550 4400 50  0001 C CNN
	1    9550 4400
	0    1    1    0   
$EndComp
Wire Wire Line
	9125 4400 9450 4400
Wire Wire Line
	9950 4400 9650 4400
$Comp
L C_Small C45
U 1 1 590448EE
P 8900 4300
F 0 "C45" H 8910 4370 50  0000 L CNN
F 1 "4.7u" H 8910 4220 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 8900 4300 50  0001 C CNN
F 3 "" H 8900 4300 50  0001 C CNN
	1    8900 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	8900 4200 8900 4100
Wire Wire Line
	8900 4100 9125 4100
Connection ~ 9125 4100
$Comp
L GNDA #PWR053
U 1 1 59045148
P 8900 4400
F 0 "#PWR053" H 8900 4150 50  0001 C CNN
F 1 "GNDA" H 8900 4250 50  0000 C CNN
F 2 "" H 8900 4400 50  0001 C CNN
F 3 "" H 8900 4400 50  0001 C CNN
	1    8900 4400
	1    0    0    -1  
$EndComp
Text Label 9125 3755 3    60   ~ 0
+1.65V
Text Notes 4235 1700 0    60   ~ 0
Target Ioutfs=4mA\nVrefio=1.04 V (nominal)\nIref=Vrefio/Rset=126uA\nIoutfs=32*Iref=4.034mA
Text Notes 5925 2480 0    60   ~ 0
Ioutfs=4.034mA\nVoutfs=403.4mV\nVout_diff=5.1*Voutfs=2.057V\nVout=1.5*Vout_diff=3.086V
$EndSCHEMATC
