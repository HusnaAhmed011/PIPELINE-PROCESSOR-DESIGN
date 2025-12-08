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

         code: iverilog -o pipeline_tb.vvp pipeline_tb.v
         
This assembles the testbench and the ALU module into one simulation. The following was used to run the simulation:

         code: vvp pipeline_tb.vvp
         
The results of each operation were shown in the terminal output, which verified that the ALU gave a correct result with addition, subtraction, AND, OR, NOT, XOR and XNOR. Every test case yielded the expected outcomes and this confirmed that the ALU was operating well.

### GTKWAVE - Waveform Simulator:
GTKWave was then applied to open the generated VCD file to visualize the transitions between the signal:

          code: gtkwave
          
GTKWave gave a clear picture of the variation of A, B, op and alu_out with time. The graphical wave form provided the actual time each operation was performed and it was proved that the ALU output was updated as soon as the operation code was altered. This confirmed that the design had been used correctly as a combinational circuit and that there was no glitching or undesirable transitions. The waveform also was comparable to what the printed terminal outputs showed, which also confirmed that the design was correct and the testbench.

### Behavioural & Testbench :
The ALU is coded in a behavioral 
 
    code: always@(*)
 
 block in which the operations are chosen by a 
 
    code: case(op) 
 
 statement. This allows the module to directly use Verilog operators to do addition, subtraction, AND, OR and NOT without having to model gates.

The testbench is a reg signal driver that produces input values and op-codes and drives them into the ALU and their result is registered by means of 

    code: $display("Operation %b", alu_out);
    
and waveform dumps. It checks every step of operation serially so that the ALU can give the same output in all modes.

## Conclusion:
The ALU implemented all the necessary functions, addition, subtraction, AND, OR and NOT depending on the op-code, and the simulation completely confirmed its proper work. Besides the obligatory functions, XOR and XNOR were applied and tested as additional functionality and both functions worked properly in the final waveform and end terminal results.

# OUTPUT 

#### GTKWAVE:

<img width="1496" height="946" alt="Image" src="https://github.com/user-attachments/assets/3d31eddb-f5e2-445e-801d-5c3697fb07ec" />

#### VS TERMINAL:

<img width="1282" height="831" alt="Image" src="https://github.com/user-attachments/assets/d9ab2dec-53cd-4417-ad33-35ce8f9265f4" />
