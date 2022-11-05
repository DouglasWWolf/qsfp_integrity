//===================================================================================================
//                            ------->  Revision History  <------
//===================================================================================================
//
//   Date     Who   Ver  Changes
//===================================================================================================
// 05-Nov-22  DWW  1000  Initial creation
//===================================================================================================

module data_generator
(

    input clock, BUTTON,
   

    //=================================  AXI Output Stream interface  ================================
    output[255:0] AXIS_TDATA,
    output reg    AXIS_TVALID,
    input         AXIS_TREADY
    //===============================================================================================

);
    genvar x;
    reg[15:0] counter;

    assign AXIS_TDATA[15:0] = counter + BUTTON;
    for (x=1; x<16; x=x+1) assign AXIS_TDATA[x*16+15 : x*16] = counter;
       
    always @(posedge clock) begin
        AXIS_TVALID <= 1;

        if (AXIS_TVALID & AXIS_TREADY) counter <= counter + 1;
    end

endmodule
