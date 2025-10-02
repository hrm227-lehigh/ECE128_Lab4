module carStatus(SRV, PBRK, TRUNK, SB_P, PASS_OCC, TMP_OK, AIB_OK, BAT_OK, HOOD, PARK, BRK, KEY, DOOR, SB,TEMP_WARN, AIRBAG_WARN, BAT_WARN, TRUNK_WARN, HOOD_WARN, DOOR_WARN, SEAT_WARN, WARN_PRI1, WARN_PRI2, CHIME, START_PERMIT);
input SRV, PBRK, TRUNK, SB_P, PASS_OCC, TMP_OK, AIB_OK, BAT_OK, HOOD, PARK, BRK, KEY, DOOR, SB;
output TEMP_WARN, AIRBAG_WARN, BAT_WARN, TRUNK_WARN, HOOD_WARN, DOOR_WARN, SEAT_WARN, WARN_PRI1, WARN_PRI2, CHIME, START_PERMIT;

wire TRUNKN, HOODN, DOORN, BATN, AIBN, TMPN,SBN, SB_PN, BRKN;
wire T2, WCHIME, WCHIME1, WCHIME2, WARN1, WARN11, WARN12, WARN13, WARN2, WARN21, WARN22, WARN23, START1, START2;

//the output lights on mean that there are warnings
//the switches being on mean that the specific part is working properly
not(TRUNKN, TRUNK);
not(HOODN, HOOD);
not(DOORN, DOOR);
not(BATN, BAT_OK);
not(AIBN, AIB_OK);
not(TMPN, TMP_OK);
not(SBN, SB);
not(SB_PN, SB_P);
not(BRKN, BRK);

//start permit will be on if the key is on and the breaks are pressed
//start permit will be on iff the service mode jumper and break are pressed
and(START1, KEY, BRK);
and(START2, SRV, BRK);
or(START_PERMIT, START1, START2);


and(TRUNK_WARN, KEY, BRK, TRUNKN);
and(WARN21, KEY, BRK, TRUNKN);


and(HOOD_WARN, KEY, BRK, HOODN);
and(WARN22, KEY, BRK, HOODN);


and(DOOR_WARN, KEY, BRK, DOORN);
and(WARN23, KEY, BRK, DOORN);

and(BAT_WARN, KEY, BRK, BATN);
and(WARN11, KEY, BRK, BATN);

and(AIRBAG_WARN, KEY, BRK, AIBN);
and(WARN12, KEY, BRK, AIBN);

and(T2, KEY, BRK, TMPN);
and(WARN13, KEY, BRK, TMPN);

or(WARN1, WARN11, WARN12, WARN13);
or(WARN2, WARN21, WARN22, WARN23);

wire parkingor;
or(parkingor, PBRK, PARK);
and(WCHIME1, KEY, BRK, parkingor);
and(WCHIME2, KEY, BRKN);
or(WCHIME, WCHIME1, WCHIME2);


wire pass2, seatbelt;
and(pass2, SB_PN, PASS_OCC);
or(seatbelt, pass2, SBN);
and(SEAT_WARN, KEY, BRK, seatbelt);

assign CHIME = WCHIME;
assign WARN_PRI1 = WARN1;
assign WARN_PRI2 = WARN2;
assign TEMP_WARN = T2;

endmodule;