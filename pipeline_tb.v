// Testbench Program for Pipelining Processor able to perform basic 
// operations like Adding, Subtracting and Load

module pipeline_tb;

reg clk=0, reset=1;
pipeline dut(clk, reset);

always #5 clk = ~clk;

initial begin
    dut.IMEM[0] = 16'b0001_0001_0010_0101; // ADD R1, R2, 5
    dut.IMEM[1] = 16'b0010_0011_0001_0001; // SUB R3, R1, 1
    dut.IMEM[2] = 16'b0011_0100_0000_0011; // LOAD R4, MEM[3]
    dut.DMEM[3] = 32'd99;

    #12 reset = 0;

    #200 $finish;
end

initial begin
    $dumpfile("pipeline_tb.vcd");
    $dumpvars(0,pipeline_tb);
end

endmodule
