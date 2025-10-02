module carStatus_tb;
reg SRV, PBRK, TRUNK, SB_P, PASS_OCC, TMP_OK, AIB_OK, BAT_OK, HOOD, PARK, BRK, KEY, DOOR, SB;
wire TEMP_WARN, AIRBAG_WARN, BAT_WARN, TRUNK_WARN, HOOD_WARN, DOOR_WARN, SEAT_WARN, WARN_PRI1, WARN_PRI2, CHIME, START_PERMIT;

carStatus uut(SRV, PBRK, TRUNK, SB_P, PASS_OCC, TMP_OK, AIB_OK, BAT_OK, HOOD, PARK, BRK, KEY, DOOR, SB, TEMP_WARN, AIRBAG_WARN, 
BAT_WARN, TRUNK_WARN, HOOD_WARN, DOOR_WARN, SEAT_WARN, WARN_PRI1, WARN_PRI2, CHIME, START_PERMIT);

initial begin
	#10 SRV = 1; PBRK = 0; TRUNK = 0; SB_P = 0; PASS_OCC = 0; TMP_OK = 0; AIB_OK = 0; BAT_OK = 0; HOOD = 0; PARK = 0; BRK = 1; KEY = 0; DOOR = 0; SB = 0;
	#10 SRV = 0; PBRK = 0; TRUNK = 0; SB_P = 0; PASS_OCC = 0; TMP_OK = 0; AIB_OK = 0; BAT_OK = 0; HOOD = 0; PARK = 0; BRK = 0; KEY = 0; DOOR = 0; SB = 0;
	#10 SRV = 0; PBRK = 1; TRUNK = 1; SB_P = 1; PASS_OCC = 1; TMP_OK = 1; AIB_OK = 1; BAT_OK = 1; HOOD = 1; PARK = 1; BRK = 1; KEY = 1; DOOR = 1; SB = 1;
	#10 SRV = 0; PBRK = 0; TRUNK = 0; SB_P = 0; PASS_OCC = 0; TMP_OK = 1; AIB_OK = 1; BAT_OK = 1; HOOD = 0; PARK = 0; BRK = 1; KEY = 1; DOOR = 0; SB = 0;
	#10 SRV = 0; PBRK = 0; TRUNK = 1; SB_P = 0; PASS_OCC = 0; TMP_OK = 1; AIB_OK = 1; BAT_OK = 1; HOOD = 1; PARK = 0; BRK = 1; KEY = 1; DOOR = 1; SB = 0;
	#10 SRV = 0; PBRK = 0; TRUNK = 1; SB_P = 0; PASS_OCC = 0; TMP_OK = 1; AIB_OK = 1; BAT_OK = 1; HOOD = 1; PARK = 0; BRK = 1; KEY = 1; DOOR = 1; SB = 1;
	#10 SRV = 0; PBRK = 0; TRUNK = 1; SB_P = 1; PASS_OCC = 1; TMP_OK = 1; AIB_OK = 1; BAT_OK = 1; HOOD = 1; PARK = 0; BRK = 1; KEY = 1; DOOR = 1; SB = 1;

	#10 SRV = 0; PBRK = 0; TRUNK = 1; SB_P = 1; PASS_OCC = 1; TMP_OK = 1; AIB_OK = 1; BAT_OK = 1; HOOD = 1; PARK = 0; BRK = 1; KEY = 1; DOOR = 1; SB = 1;

	#10 SRV = 0; PBRK = 0; TRUNK = 1; SB_P = 0; PASS_OCC = 0; TMP_OK = 1; AIB_OK = 1; BAT_OK = 1; HOOD = 0; PARK = 0; BRK = 1; KEY = 1; DOOR = 1; SB = 1;

	#10 SRV = 0; PBRK = 0; TRUNK = 1; SB_P = 0; PASS_OCC = 0; TMP_OK = 0; AIB_OK = 1; BAT_OK = 1; HOOD = 1; PARK = 0; BRK = 1; KEY = 1; DOOR = 1; SB = 1;

	
	#10 $stop;
end

	
endmodule