# PIPELINE-PROCESSOR-DESIGN

*COMPANY*: CODTECH IT SOLUTIONS

*NAME*: HUSNA FIRDOS

*INTERN ID*: CT04DR1337

*DOMAIN*: VLSI

*DURATION*: 4 WEEKS

*MENTOR*:  NEELA SANTHOSH KUMAR

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
          
he waveform clearly showed the movement of instructions through the four pipeline stages over time and how the PC, pipeline registers, ALU result, and general-purpose registers changed with each clock cycle. It was easy to see when an instruction entered the pipeline, when it reached the execute stage, and when the result was written back. The register values updated exactly at the Write-Back stage, proving that the pipeline timing worked correctly. The waveform closely matched the values printed in the terminal, confirming that the ADD, SUB and LOAD instructions produced correct outputs and that the processor design and testbench were functioning properly without glitches or invalid data transitions.

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
The 4-stage pipelined processor successfully executed ADD, SUB and LOAD instructions and produced correct results in both the terminal output and GTKWAVE waveform. The movement of instructions through the stages happened in proper timing order, and register values were updated only after the Write-Back stage, proving that the pipelining mechanism worked correctly. The simulation confirmed that the design behaved exactly as expected and demonstrated the performance advantage of pipelining compared to single-cycle execution.

# OUTPUT 

#### GTKWAVE

<img width="1496" height="946" alt="Image" src="https://github.com/user-attachments/assets/3d31eddb-f5e2-445e-801d-5c3697fb07ec" />

#### VS TERMINAL:

<img width="1282" height="831" alt="Image" src="https://github.com/user-attachments/assets/d9ab2dec-53cd-4417-ad33-35ce8f9265f4" />
