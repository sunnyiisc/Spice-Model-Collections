v 20130925 2
C 45100 59400 1 0 0 photo-transistor-1.sym
{
T 44900 59900 5 6 0 1 0 0 1
device=photo-transistor
T 45100 59400 5 10 0 0 0 6 1
footprint=CONNECTOR_FLAT 1 2
T 45360 59500 5 10 1 1 0 0 1
refdes=Q402
T 45100 59100 5 10 1 0 0 0 1
model=sdp8405-003
T 45100 58900 5 10 1 0 0 0 1
description=sdp8405-003 in radiodom.ru with error: spd8405-003
}
C 44000 59200 1 0 1 led-3.sym
{
T 43050 59850 5 10 0 0 0 6 1
device=LED
T 43550 59750 5 10 1 1 0 6 1
refdes=D?
T 44000 59000 5 10 1 1 0 6 1
model=al107b or al172
T 44000 58800 5 10 1 1 0 6 1
description=al107b or al172; U=1.7V; I = 100mA; -> R=100 Ohm
}
C 35700 57100 1 0 0 diode-bridge-1.sym
{
T 36600 58075 5 10 1 1 0 0 1
refdes=U?
T 36900 57175 5 8 0 0 0 0 1
device=DIODE-BRIDGE
T 35700 57100 5 10 1 1 0 0 1
model=in5822 shottky diode 3A
}
C 38100 58600 1 270 0 capacitor-1.sym
{
T 38800 58400 5 10 0 0 270 0 1
device=CAPACITOR
T 38600 58400 5 10 1 1 270 0 1
refdes=C?
T 39000 58400 5 10 0 0 270 0 1
symversion=0.1
}
C 38900 58600 1 270 0 capacitor-2.sym
{
T 39600 58400 5 10 0 0 270 0 1
device=POLARIZED_CAPACITOR
T 39400 58400 5 10 1 1 270 0 1
refdes=C?
T 39800 58400 5 10 0 0 270 0 1
symversion=0.1
}
C 42000 59300 1 0 0 resistor-2.sym
{
T 42400 59650 5 10 0 0 0 0 1
device=RESISTOR
T 42200 59600 5 10 1 1 0 0 1
refdes=R?
T 42200 59300 5 10 1 1 0 0 1
value=100
}
C 40900 59300 1 0 0 resistor-variable-2.sym
{
T 41450 59700 5 10 1 1 0 0 1
refdes=R?
T 41700 60200 5 10 0 1 0 0 1
device=VARIABLE_RESISTOR
T 41100 59300 5 10 1 1 0 0 1
value=10k
}
N 36700 59100 36700 59400 4
N 36700 59400 40900 59400 4
N 39100 59400 39100 58600 4
N 38300 58600 38300 59400 4
N 36700 57100 36700 56500 4
N 36700 56500 44500 56500 4
N 39100 56500 39100 57700 4
N 38300 57700 38300 56500 4
N 41800 59400 42000 59400 4
N 42900 59400 43100 59400 4
N 44000 59400 44500 59400 4
N 44500 56500 44500 59400 4
N 41400 59900 41400 60300 4
N 41400 60300 40800 60300 4
N 40800 60300 40800 59400 4
