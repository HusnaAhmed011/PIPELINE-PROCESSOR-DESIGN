# PIPELINE-PROCESSOR-DESIGN


## Description:-
### Software used for Implementation:
The whole project was implemented in the Visual Studio Code, and Icarus Verilog (iverilog) was installed and embedded in the terminal. The compilation was carried out with the help of the following command:

         code: iverilog -o pipeline_tb.vvp pipeline_tb.v pipeline_tb.v
         
This assembles the testbench and the design module into one simulation. The following was used to run the simulation:

         code: vvp pipeline_tb.vvp
         
The result is shown in the waveform output, which verified the CPU state values cycle-by-cycle in the terminal.

### GTKWAVE - Waveform Simulator:
GTKWave was then applied to open the generated VCD file to visualize the transitions between the signal:

          code: gtkwave
          
The waveform was a clear display of how instructions moved through the four stages of pipeline over a period of time and the changes in PC, pipeline registers, ALU result, and general-purpose registers on every clock cycle. Once an instruction was enrolled into the pipeline it was simple to know when it had been received, it was at the execute stage and the result had been written back. The value of the registers at the Write-Back stage corresponded to the correct value, which demonstrated that the pipeline timing was correct. With the waveform almost the same as the values displayed in the terminal, it was confirmed that the ADD, SUB and LOAD instructions were generating the right output as well as ensuring that the processor design and testbench were working correctly with no glitches or invalid data transitions.

### Behavioural & Testbench :
The processor is written in behavioural Verilog using clock-driven
 
    code: always@(posedge clk)
 
blocks, which model each pipeline stage (IF, ID, EX, WB). Instructions move through these stages one cycle at a time, and the
 
    code: case(opcode) 
 
 statement in the execute stage performs ADD, SUB, and LOAD operations. The register values update only in the Write-Back stage, which reflects real pipeline behaviour.
The testbench generates the clock and reset signals and then observes how data flows through the pipeline.The statement 

    code: $display
    
print the values of PC and registers at each cycle.

## Conclusion:

The pipelined processor achieved a success with the implementation of ADD, SUB and LOAD commands and also generated the right output in the terminal output and the GTKWAVE waveform. The flow of instructions through the stages, as well as the updating of register values were performed in the correct order of sequence and this proved that the pipelining mechanism was working in the right way. The simulation was able to confirm that the design actually worked as desired, and also illustrated the performance benefit of pipelining over single-cycle execution.

# OUTPUT 

#### GTKWAVE:

<img width="1496" height="946" alt="Image" src="https://github.com/user-attachments/assets/3d31eddb-f5e2-445e-801d-5c3697fb07ec" />

#### VS TERMINAL:

<img width="1282" height="831" alt="Image" src="https://github.com/user-attachments/assets/d9ab2dec-53cd-4417-ad33-35ce8f9265f4" />
