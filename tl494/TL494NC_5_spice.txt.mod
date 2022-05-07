.SUBCKT TL494_5   Vcc OCT CT1 ET1 CT2 ET2 GND VREF Rt Ct DTC FB -IN2 IN2 -IN1 IN1  Ctctr
*                             1      2      3     4     5      6      7      8      9  10 11  12   13   14    15   16    17

* ОУ1 с ограничением скорости 0.5V/uS
; введено принудительное смещение нуля на 2 мВ   
E1 7 GND TABLE {V(IN1,-IN1)-2m} = (-50m,-5000) (50m,5000)
R11 11 7 100k
C2 11 GND 100n
D1ogr1 V1_4 11 $GENERIC
D1ogr2 11 V4_5 $GENERIC
V1_4 V1_4 GND 1.42
V4_5 V4_5 GND 4.5

* ОУ2 с ограничением скорости 0.5V/uS
E2 8 GND TABLE {V(IN2,-IN2)-2m} = (-50m,-5000) (50m,5000)
R12 12 8 100k
C3 12 GND 100n
D2ogr1 V1_4 12 $GENERIC
D2ogr2 12 V4_5 $GENERIC

E1out 13 GND  Value={IF( V(11)>V(12), V(11,GND), V(12,GND) )}      ;           развязка по выходному импедансу
D1 13 FB $GENERIC

Gsup Vcc GND TABLE {V(Vcc,GND) } = (1,0) (7,7.5m) (40,9m) ; ток потребления
I1 FB GND DC  0.6M ;AC 1 0
ERt Rt GND TABLE {V(Vcc,GND) } = (1,0) (6,3)
Evref VREF GND TABLE {V(Vcc,GND) } = (1,0) (6,5)

* измеряем ёмкость на Ct выводе
atest %vd (Ct,GND) Ctm ctest  ; Ctm делаем от 0V
.model ctest cmeter(gain=1.0)   ; 1F=1V

*делаем треугольный генератор
Efreq Freq 0  VALUE = { 1.1/ V(CTm)*(-I(ERt))/3   *(V(Vcc,GND)>6.5) }   ; частота по формуле даташита
atri1 Freq %vd(Ctctr,GND)  ramp1  ; Freq от 0V ,    Ctctr от GND
.model ramp1 triangle(cntl_array=[1.0e4 1.0e5] freq_array=[1.0e4 1.0e5]
+            out_low=0  out_high=3 duty_cycle=0.99)

Ecmp CMP GND  VALUE={IF(V(FB)<(V(DTC)+0.82), V(DTC,GND)+0.12, V(FB,GND)-0.7  )}  ; общий уровень компарирования пилы  
Ecmp1 CMP1 GND  VALUE={ V(Qa)*(V(OCT,GND)>2) + (10-10*(V(Vcc,GND)>7))+ V(CMP,GND)}
Ecmp2 CMP2 GND  VALUE={ (10-V(Qa))*(V(OCT,GND)>2) + (10-10*(V(Vcc,GND)>7))+ V(CMP,GND)}
EM7 M77 0 VALUE={10-10*(   (V(CMP)<V(Ctctr)   ) *(V(Vcc,GND)>7)     )   } 
Rm7 M77 M7  1k
Cm7 M7 0 50p 

Efreq2 Freq2 0  VALUE = { 2/(abs (V(CMP)-V(Ctctr) )+0.04) *V(Freq)* (V(Ctctr)<(V(CMP)+2m ))   }   ; частота тем выше чем ближе к порогу компаратора слева
asqr2 Freq2 Ftol sqr2
.model sqr2 square(cntl_array=[1.0e4 1.0e5] freq_array=[1.0e4 1.0e5]  rise_time=20n fall_time=20n )

aadc3 [M7]  [M7d]  ADC3
.MODEL ADC3 adc_bridge (in_low= 1  in_high =9  rise_delay= 20n fall_delay= 20n)
*Flop pins  D  C  S R  Q ~Q
Aflop  ~Q  M7d  NULL NULL  NULL  ~Q  flop
.model flop d_dff( ic=1 clk_delay=10n rise_delay=10n fall_delay=10n )
adac22  [~Q]  [Qa]   DAC22
.MODEL  DAC22 dac_bridge (out_low=0 out_high = 10 t_rise=10n t_fall=10n)
RQA Qa 0  10k

S1 CT1 -S1 Ctctr  CMP1 SV1 
S2 CT2 -S2 Ctctr  CMP2 SV1
D2 -S1 ET1 $GENERIC
D3 -S2 ET2 $GENERIC
.MODEL SV1 VSWITCH (RON=10 VON=0.005 VOFF=-0.005)
.MODEL $GENERIC D (BV=500 CJO=2.5P IS=8N M=100M N=2 RS=400M TT=1N VJ=700M)
.ENDS TL494_5
                                                                                                                                     *