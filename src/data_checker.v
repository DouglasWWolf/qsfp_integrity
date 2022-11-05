//===================================================================================================
//                            ------->  Revision History  <------
//===================================================================================================
//
//   Date     Who   Ver  Changes
//===================================================================================================
// 05-Nov-22  DWW  1000  Initial creation
//===================================================================================================

module data_checker
(

    input clock, resetn,
    output reg[31:0] ERRORS, SECONDS,

    //=================================  AXI Input Stream interface  ================================
    input[255:0] AXIS_TDATA,
    input        AXIS_TVALID
    //===============================================================================================

);
    genvar x;
    reg[31:0] second_timer;

    always @(posedge clock) begin


        if (resetn == 0) begin
            ERRORS       <= 0;
            SECONDS      <= 0;
            second_timer <= 0;
        end else begin
            
            second_timer <= second_timer + 1;

            if (second_timer == 402832031) begin
                second_timer <= 0;
                SECONDS      <= SECONDS + 1;
            end

            if (AXIS_TVALID) begin
                if (AXIS_TDATA[ 31: 16] != AXIS_TDATA[15:0]) ERRORS <= ERRORS + 1;
                if (AXIS_TDATA[ 47: 32] != AXIS_TDATA[15:0]) ERRORS <= ERRORS + 1;
                if (AXIS_TDATA[ 63: 48] != AXIS_TDATA[15:0]) ERRORS <= ERRORS + 1;
                if (AXIS_TDATA[ 79: 64] != AXIS_TDATA[15:0]) ERRORS <= ERRORS + 1;
                if (AXIS_TDATA[ 95: 80] != AXIS_TDATA[15:0]) ERRORS <= ERRORS + 1;
                if (AXIS_TDATA[111: 96] != AXIS_TDATA[15:0]) ERRORS <= ERRORS + 1;
                if (AXIS_TDATA[127:112] != AXIS_TDATA[15:0]) ERRORS <= ERRORS + 1;
                if (AXIS_TDATA[143:128] != AXIS_TDATA[15:0]) ERRORS <= ERRORS + 1;
                if (AXIS_TDATA[159:144] != AXIS_TDATA[15:0]) ERRORS <= ERRORS + 1;
                if (AXIS_TDATA[175:160] != AXIS_TDATA[15:0]) ERRORS <= ERRORS + 1;
                if (AXIS_TDATA[191:176] != AXIS_TDATA[15:0]) ERRORS <= ERRORS + 1;
                if (AXIS_TDATA[207:192] != AXIS_TDATA[15:0]) ERRORS <= ERRORS + 1;
                if (AXIS_TDATA[223:208] != AXIS_TDATA[15:0]) ERRORS <= ERRORS + 1;
                if (AXIS_TDATA[239:224] != AXIS_TDATA[15:0]) ERRORS <= ERRORS + 1;
                if (AXIS_TDATA[255:240] != AXIS_TDATA[15:0]) ERRORS <= ERRORS + 1;
            end
        end
    end
    
endmodule
