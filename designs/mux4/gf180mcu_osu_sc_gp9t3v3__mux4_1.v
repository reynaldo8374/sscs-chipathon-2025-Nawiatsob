// Copyright 2022 Google LLC
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
`timescale 1ns/10ps
`celldefine
module gf180mcu_osu_sc_gp9t3v3__mux4_1 (Y, i0, i1, i2, i3, s0, s1);
	output Y;
	input i0, i1, i2, i3, s0, s1;

	// Function
	wire ns0, ns1;
	wire and0, and1, and2, and3;

	not (ns0, s0);
	not (ns1, s1);
	and (and0, ns0, ns1, i0);
	and (and1, s0, ns1, i1);
	and (and2, ns0, s1, i2);
	and (and3, s0, s1, i3);
	or (Y, and0, and1, and2, and3);

	// Timing
	specify
		if (!S1 && !S0) (I0 => Y) = 0;
        if (!S1 && S0)  (I1 => Y) = 0;
        if (S1 && !S0)  (I2 => Y) = 0;
        if (S1 && S0)   (I3 => Y) = 0;

        if (!S1 && (I0 !== I1)) (S0 => Y) = 0;
        if (S1  && (I2 !== I3)) (S0 => Y) = 0;

        if (!S0 && (I0 !== I2)) (S1 => Y) = 0;
        if (S0  && (I1 !== I3)) (S1 => Y) = 0;
	endspecify
endmodule
`endcelldefine