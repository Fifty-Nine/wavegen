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
LIBS:rev3-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 4
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 650  700  800  750 
U 58FAEA06
F0 "Power" 60
F1 "power.sch" 60
$EndSheet
$Sheet
S 1550 700  750  750 
U 58FAF61B
F0 "FTDI" 60
F1 "FTDI.sch" 60
F2 "ADBUS[7..0]" I R 2300 800 60 
F3 "ACBUS[7..0]" I R 2300 900 60 
F4 "BDBUS[7..0]" I R 2300 1000 60 
F5 "BCBUS[7..0]" I R 2300 1100 60 
$EndSheet
$Sheet
S 2400 700  750  750 
U 58FB9077
F0 "Connectors" 60
F1 "Connectors.sch" 60
F2 "ADBUS[7..0]" I L 2400 800 60 
F3 "BDBUS[7..0]" I L 2400 1000 60 
F4 "BCBUS[7..0]" I L 2400 1100 60 
F5 "ACBUS[7..0]" I L 2400 900 60 
$EndSheet
Wire Bus Line
	2300 800  2400 800 
Wire Bus Line
	2400 900  2300 900 
Wire Bus Line
	2300 1000 2400 1000
Wire Bus Line
	2400 1100 2300 1100
$EndSCHEMATC
