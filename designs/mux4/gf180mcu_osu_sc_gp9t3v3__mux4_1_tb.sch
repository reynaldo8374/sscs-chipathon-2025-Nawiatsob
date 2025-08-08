v {xschem version=3.4.7 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 465 -330 465 -250 {lab=GND}
N 300 -390 300 -310 {lab=i3}
N 300 -390 400 -390 {lab=i3}
N 240 -430 240 -310 {lab=i2}
N 240 -430 400 -430 {lab=i2}
N 180 -470 180 -310 {lab=i1}
N 180 -470 400 -470 {lab=i1}
N 120 -510 120 -310 {lab=i0}
N 120 -510 400 -510 {lab=i0}
N 450 -330 450 -260 {lab=s1}
N 520 -450 640 -450 {lab=out}
N 460 -620 460 -570 {lab=VDD}
N 240 -230 240 -210 {lab=s1}
N 240 -230 450 -230 {lab=s1}
N 450 -260 450 -230 {lab=s1}
N 300 -220 300 -210 {lab=s0}
N 300 -220 480 -220 {lab=s0}
N 480 -330 480 -220 {lab=s0}
N 590 -450 590 -420 {lab=out}
N 590 -360 590 -320 {lab=GND}
C {title.sym} 160 -40 0 0 {name=l1 author="Nawiatsob-Rey"}
C {vsource.sym} 180 -180 0 0 {name=V1 value=3.3 savecurrent=false}
C {vsource.sym} 120 -280 0 0 {name=V2 value=3.3 savecurrent=false}
C {vdd.sym} 180 -210 0 0 {name=l2 lab=VDD}
C {gnd.sym} 180 -150 0 0 {name=l5 lab=GND}
C {vsource.sym} 180 -280 0 0 {name=V3 value=3.3 savecurrent=false}
C {vsource.sym} 240 -280 0 0 {name=V4 value=3.3 savecurrent=false}
C {vsource.sym} 300 -280 0 0 {name=V5 value=3.3 savecurrent=false}
C {vsource.sym} 240 -180 0 0 {name=V6 value=3.3 savecurrent=false}
C {vsource.sym} 300 -180 0 0 {name=V7 value=3.3 savecurrent=false}
C {lab_wire.sym} 300 -390 0 0 {name=p1 sig_type=std_logic lab=i3}
C {lab_wire.sym} 300 -510 0 0 {name=p2 sig_type=std_logic lab=i0
}
C {lab_wire.sym} 300 -470 0 0 {name=p3 sig_type=std_logic lab=i1}
C {lab_wire.sym} 300 -430 0 0 {name=p4 sig_type=std_logic lab=i2
}
C {lab_wire.sym} 450 -230 0 0 {name=p5 sig_type=std_logic lab=s1
}
C {lab_wire.sym} 480 -220 0 1 {name=p6 sig_type=std_logic lab=s0
}
C {lab_wire.sym} 640 -450 0 1 {name=p7 sig_type=std_logic lab=out
}
C {devices/code_shown.sym} 570 -170 0 0 {name=MODELS only_toplevel=true
format="tcleval( @value )"
value="
.include $::180MCU_MODELS/design.ngspice
.lib $::180MCU_MODELS/sm141064.ngspice typical
"}
C {devices/code_shown.sym} 735 -1085 0 0 {name=NGSPICE only_toplevel=true
value="
.control
save all

let fsig = 1000k
let tper = 1/fsig
let tfr = 0.01*tper
let ton = 0.5*tper-2*tfr

* Define timing parameters
* let ttrans = 2m         ; waktu transisi simultan
*let trf = 10n           ; waktu rise/fall
*let ton = 500u          ; waktu sinyal tetap di level tinggi
*let per = 4m            ; periode pulsa
let tstop = 20*tper          ; total waktu simulasi
let tstep = 0.001*tper          ; resolusi waktu simulasinya
let tsem = 3*tper
let tkol = 0.5*tsem-2*tfr

let tv4s = 2*tper
let tv5s = 1.5*tper

let tv4k = 0.5*tv4s-2*tfr
let tv5k = 0.5*tv5s-2*tfr

* Set constant input data untuk mux
alter @V2[DC] = 0     ; i0
alter @V3[DC] = 3.3    ; i1
alter @V4[PULSE] = [ 0 3.3 0 $&tfr $&tfr $&tv4k $&tv4s 0 ]
alter @V5[PULSE] = [ 0 3.3 0 $&tfr $&tfr $&tv5k $&tv5s 0 ]

* Set S0 (V6): 0 -> 3.3V, mulai di ttrans
alter @V6[PULSE] = [ 0 3.3 0 $&tfr $&tfr $&tkol $&tsem 0 ]

* Set S1 (V7): 3.3 -> 0V, mulai di ttrans
alter @V7[PULSE] = [ 3.3 0 0 $&tfr $&tfr $&ton $&tper 0 ]

* Simulasi
op
tran $&tstep $&tstop

* Plot output dan selector
plot v(out)+30 v(s0)+20 v(s1)+25 v(i0) v(i1)+5 v(i2)+10 v(i3)+15  

write mux4_tb.raw
.endc
"}
C {lab_wire.sym} 120 -250 0 0 {name=p8 sig_type=std_logic lab=GND}
C {lab_wire.sym} 180 -250 0 0 {name=p9 sig_type=std_logic lab=GND}
C {lab_wire.sym} 240 -250 0 0 {name=p10 sig_type=std_logic lab=GND}
C {lab_wire.sym} 300 -250 0 0 {name=p11 sig_type=std_logic lab=GND}
C {lab_wire.sym} 465 -250 0 0 {name=p12 sig_type=std_logic lab=GND}
C {lab_wire.sym} 460 -620 0 0 {name=p13 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 300 -150 0 0 {name=p14 sig_type=std_logic lab=GND}
C {lab_wire.sym} 240 -150 0 0 {name=p15 sig_type=std_logic lab=GND}
C {noconn.sym} 640 -450 0 0 {name=l3}
C {mux4/gf180mcu_osu_sc_gp9t3v3__mux4_1.sym} 740 -460 0 0 {name=x2}
C {capa.sym} 590 -390 0 0 {name=C1
m=1
value=1.5f
footprint=1206
device="ceramic capacitor"}
C {lab_wire.sym} 590 -320 0 0 {name=p16 sig_type=std_logic lab=GND}
