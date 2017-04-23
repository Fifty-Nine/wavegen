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
Sheet 4 5
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
L CONN_02X09 J2
U 1 1 58FB9080
P 2000 1650
F 0 "J2" H 2000 2150 50  0000 C CNN
F 1 "CONN_02X09" V 2000 1650 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x09_Pitch2.54mm" H 2000 450 50  0001 C CNN
F 3 "" H 2000 450 50  0001 C CNN
F 4 "S2011EC-40-ND" H 2000 1650 60  0001 C CNN "DigiKey "
	1    2000 1650
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR020
U 1 1 58FB91A4
P 1650 1150
F 0 "#PWR020" H 1650 1000 50  0001 C CNN
F 1 "+3.3V" H 1650 1290 50  0000 C CNN
F 2 "" H 1650 1150 50  0001 C CNN
F 3 "" H 1650 1150 50  0001 C CNN
	1    1650 1150
	1    0    0    -1  
$EndComp
$Comp
L GNDD #PWR021
U 1 1 58FB91BA
P 2300 3450
F 0 "#PWR021" H 2300 3200 50  0001 C CNN
F 1 "GNDD" H 2300 3300 50  0000 C CNN
F 2 "" H 2300 3450 50  0001 C CNN
F 3 "" H 2300 3450 50  0001 C CNN
	1    2300 3450
	1    0    0    -1  
$EndComp
Entry Wire Line
	1200 1250 1300 1350
Entry Wire Line
	1200 1350 1300 1450
Entry Wire Line
	1200 1450 1300 1550
Entry Wire Line
	1200 1550 1300 1650
Entry Wire Line
	1200 1650 1300 1750
Entry Wire Line
	1200 1750 1300 1850
Entry Wire Line
	1200 1850 1300 1950
Entry Wire Line
	1200 1950 1300 2050
Wire Wire Line
	2300 1250 2300 3450
Wire Wire Line
	2300 1250 2250 1250
Wire Wire Line
	1750 1250 1650 1250
Wire Wire Line
	1650 1150 1650 2550
Wire Bus Line
	1200 1250 1200 1950
Wire Wire Line
	1300 2050 1750 2050
Wire Wire Line
	1750 1950 1300 1950
Wire Wire Line
	1300 1850 1750 1850
Wire Wire Line
	1300 1750 1750 1750
Wire Wire Line
	1300 1650 1750 1650
Wire Wire Line
	1300 1550 1750 1550
Wire Wire Line
	1300 1450 1750 1450
Wire Bus Line
	2950 1450 2950 2150
Entry Wire Line
	2850 1350 2950 1450
Entry Wire Line
	2850 1450 2950 1550
Entry Wire Line
	2850 1550 2950 1650
Entry Wire Line
	2850 1650 2950 1750
Entry Wire Line
	2850 1750 2950 1850
Entry Wire Line
	2850 1850 2950 1950
Entry Wire Line
	2850 1950 2950 2050
Entry Wire Line
	2850 2050 2950 2150
Wire Wire Line
	2850 2050 2250 2050
Wire Wire Line
	2250 1950 2850 1950
Wire Wire Line
	2850 1850 2250 1850
Wire Wire Line
	2250 1750 2850 1750
Wire Wire Line
	2850 1650 2250 1650
Wire Wire Line
	2250 1550 2850 1550
Wire Wire Line
	2250 1450 2850 1450
$Comp
L CONN_02X09 J3
U 1 1 58FB9420
P 2000 2950
F 0 "J3" H 2000 3450 50  0000 C CNN
F 1 "CONN_02X09" V 2000 2950 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x09_Pitch2.54mm" H 2000 1750 50  0001 C CNN
F 3 "" H 2000 1750 50  0001 C CNN
F 4 "S2011EC-40-ND" H 2000 2950 60  0001 C CNN "DigiKey "
	1    2000 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	1650 2550 1750 2550
Connection ~ 1650 1250
Wire Wire Line
	2250 2550 2300 2550
Connection ~ 2300 2550
Wire Wire Line
	1300 1350 1750 1350
Wire Bus Line
	1200 2550 1200 3250
Entry Wire Line
	1200 2550 1300 2650
Entry Wire Line
	1200 2650 1300 2750
Entry Wire Line
	1200 2750 1300 2850
Entry Wire Line
	1200 2850 1300 2950
Entry Wire Line
	1200 2950 1300 3050
Entry Wire Line
	1200 3050 1300 3150
Entry Wire Line
	1200 3150 1300 3250
Entry Wire Line
	1200 3250 1300 3350
Wire Wire Line
	1300 3350 1750 3350
Wire Wire Line
	1750 3250 1300 3250
Wire Wire Line
	1300 3150 1750 3150
Wire Wire Line
	1750 3050 1300 3050
Wire Wire Line
	1300 2950 1750 2950
Wire Wire Line
	1750 2850 1300 2850
Wire Wire Line
	1300 2750 1750 2750
Wire Wire Line
	1750 2650 1300 2650
Entry Wire Line
	2850 2650 2950 2750
Entry Wire Line
	2850 2750 2950 2850
Entry Wire Line
	2850 2850 2950 2950
Entry Wire Line
	2850 2950 2950 3050
Entry Wire Line
	2850 3050 2950 3150
Entry Wire Line
	2850 3150 2950 3250
Entry Wire Line
	2850 3250 2950 3350
Entry Wire Line
	2850 3350 2950 3450
Wire Wire Line
	2250 3350 2850 3350
Wire Wire Line
	2850 3250 2250 3250
Wire Wire Line
	2250 3150 2850 3150
Wire Wire Line
	2850 3050 2250 3050
Wire Wire Line
	2250 2950 2850 2950
Wire Wire Line
	2850 2850 2250 2850
Wire Wire Line
	2250 2750 2850 2750
Wire Wire Line
	2850 2650 2250 2650
Wire Bus Line
	2950 2750 2950 3450
Wire Wire Line
	2850 1350 2250 1350
Text Label 1300 1350 0    60   ~ 0
ADBUS0
Text Label 1300 1450 0    60   ~ 0
ADBUS1
Text Label 1300 1550 0    60   ~ 0
ADBUS2
Text Label 1300 1650 0    60   ~ 0
ADBUS3
Text Label 1300 1750 0    60   ~ 0
ADBUS4
Text Label 1300 1850 0    60   ~ 0
ADBUS5
Text Label 1300 1950 0    60   ~ 0
ADBUS6
Text Label 1300 2050 0    60   ~ 0
ADBUS7
Text HLabel 1200 1250 0    60   Input ~ 0
ADBUS[7..0]
Text HLabel 1200 2550 0    60   Input ~ 0
BDBUS[7..0]
Text HLabel 2950 3450 2    60   Input ~ 0
BCBUS[7..0]
Text HLabel 2950 2150 2    60   Input ~ 0
ACBUS[7..0]
Text Label 1300 2650 0    60   ~ 0
BDBUS0
Text Label 1300 2750 0    60   ~ 0
BDBUS1
Text Label 1300 2850 0    60   ~ 0
BDBUS2
Text Label 1300 2950 0    60   ~ 0
BDBUS3
Text Label 1300 3050 0    60   ~ 0
BDBUS4
Text Label 1300 3150 0    60   ~ 0
BDBUS5
Text Label 1300 3250 0    60   ~ 0
BDBUS6
Text Label 1300 3350 0    60   ~ 0
BDBUS7
Text Label 2350 3350 0    60   ~ 0
BCBUS7
Text Label 2350 3250 0    60   ~ 0
BCBUS6
Text Label 2350 3150 0    60   ~ 0
BCBUS5
Text Label 2350 3050 0    60   ~ 0
BCBUS4
Text Label 2350 2950 0    60   ~ 0
BCBUS3
Text Label 2350 2850 0    60   ~ 0
BCBUS2
Text Label 2350 2750 0    60   ~ 0
BCBUS1
Text Label 2350 2650 0    60   ~ 0
BCBUS0
Text Label 2350 2050 0    60   ~ 0
ACBUS7
Text Label 2350 1950 0    60   ~ 0
ACBUS6
Text Label 2350 1850 0    60   ~ 0
ACBUS5
Text Label 2350 1750 0    60   ~ 0
ACBUS4
Text Label 2350 1650 0    60   ~ 0
ACBUS3
Text Label 2350 1550 0    60   ~ 0
ACBUS2
Text Label 2350 1450 0    60   ~ 0
ACBUS1
Text Label 2350 1350 0    60   ~ 0
ACBUS0
$EndSCHEMATC
