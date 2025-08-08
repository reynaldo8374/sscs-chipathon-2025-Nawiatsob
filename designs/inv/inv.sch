v {xschem version=3.4.7 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 60 -100 80 -100 {lab=VDD}
N 80 -150 80 -100 {lab=VDD}
N 60 -150 80 -150 {lab=VDD}
N 60 -0 80 0 {lab=GND}
N 80 0 80 50 {lab=GND}
N 60 50 80 50 {lab=GND}
N 60 30 60 70 {lab=GND}
N 60 -170 60 -130 {lab=VDD}
N 60 -70 60 -30 {lab=xxx}
N 10 -100 20 -100 {lab=vi}
N 10 -100 10 -0 {lab=vi}
N 10 -0 20 -0 {lab=vi}
N 60 -50 180 -50 {lab=xxx}
N -40 -50 10 -50 {lab=vi}
C {symbols/nfet_03v3.sym} 40 0 0 0 {name=M1
L=0.28u
W=0.22u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X
}
C {symbols/pfet_03v3.sym} 40 -100 0 0 {name=M2
L=0.28u
W=0.22u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_03v3
spiceprefix=X
}
C {vdd.sym} 60 -170 0 0 {name=l1 lab=VDD}
C {gnd.sym} 60 70 0 0 {name=l2 lab=GND}
C {ipin.sym} -40 -50 0 0 {name=p1 lab=vi}
C {opin.sym} 180 -50 0 0 {name=p2 lab=vo}
