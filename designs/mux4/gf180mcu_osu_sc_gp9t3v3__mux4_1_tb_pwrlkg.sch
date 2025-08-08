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
C {devices/code_shown.sym} 715 -945 0 0 {name=NGSPICE only_toplevel=true
value="
.control
save all

let VDD = 3.3
let idx = 0
let total_leakage = 0

repeat 64
  let logic_A = (($&idx)%2)
  let logic_B = ((floor($&idx/2))%2)
  let logic_C = ((floor($&idx/4))%2)
  let logic_D = ((floor($&idx/8))%2)
  let logic_s0 = ((floor($&idx/16))%2)
  let logic_s1 = ((floor($&idx/32))%2)
  let a = logic_A*VDD
  let b = logic_B*VDD
  let c = logic_C*VDD
  let d = logic_D*VDD
  let s0 = logic_s0*VDD
  let s1 = logic_s1*VDD
  alter @V2[dc] = $&a
  alter @V3[dc] = $&b
  alter @V4[dc] = $&c
  alter @V5[dc] = $&d
  alter @V6[dc] = $&s0
  alter @V7[dc] = $&s1
  op
  echo input combination s1s0dcba = $&logic_s1$&logic_s0$&logic_D$&logic_C$&logic_B$&logic_A
  let leakage_power = abs(I(V1))*VDD
  let total_leakage = total_leakage + leakage_power
  print leakage_power
  let idx = $&idx + 1
end

let avg_leakage_power = total_leakage/64
print avg_leakage_power

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
