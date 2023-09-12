
# Samsung-PD-Training
This github repository summarizes the progress made in the samsung PD training. Quick links:

- [Day-0-Tool-Setup-Check](#Day-0-Tool-Setup-Check)
- [Day-1-Introduction-to-Verilog-RTL-design-and-Synthesis](#Day-1-Introduction-to-Verilog-RTL-design-and-Synthesis)
- [Day-2-Timing-libs-hierarchical-vs-flat-synthesis-and-efficient-flop-coding-styles](#Day-2-Timing-libs-hierarchical-vs-flat-synthesis-and-efficient-flop-coding-styles)
- [Day-3-Combinational-and-sequential-optimizations](#Day-3-Combinational-and-sequential-optimizations)
- [Day-4-GLS-Blocking-vs-Non-blocking-and-Synthesis-Simulation-mismatch](#Day-4-GLS-Blocking-vs-Non-blocking-and-Synthesis-Simulation-mismatch)
- [Day-5-DFT](#Day-5-DFT)
- [Day-6-Introduction-to-logic-synthesis](#Day-6-Introduction-to-logic-synthesis)
- [Day-7-Basic-SDC-constraints](#Day-7-Basic-SDC-constraints)
- [Day-8-Advanced-Constraints](#Day-8-Advanced-Constraints)


## Day-0-Tool-Setup-Check

<details>
 <summary> IC Compiler II </summary>
The  IC Compiler II is a tool provided by synopsys. It transforms human designed circuit descriptions into physical layouts. It can be used in designing and improving physical layout, power efficiency, better timing closure and automation. It can be invoked in terminal using below command:

```
icc2_shell
```
     
Below is the screenshot of icc2 shell:

<img width="1080" alt="icc2.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/3571aaa4834b290c9e03a5c920b1300fe168c497/docs/assets/images/iic2.jpg">
</details>

<details>
 <summary> Design Compiler </summary>
Design Compiler is a synthesis tool developed by synopsys which is used to translates high-level hardware description languages (HDLs) into gate-level representations. It is used in logic synthesis, hierarchical design and technology mapping. It can be triggered in terminal using below command:
 
```
dc_shell
```
 
Below is the screenshot  dc shell:

<img width="1080" alt="pic2.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/c1e43e418511df18b66bc80e51f2f36c58caffc9/docs/assets/images/pic2.png">
</details>

<details>
 <summary> PT Shell </summary>
PrimeTime is a tool developed by Synopsys used in performing static timing analysis and sign-off for integrated circuits. The PrimeTime shell is the environment used to interact with the primetime tool. It is used to perform timing analysis, delay calculation and power analysis. It can be triggered in terminal using below command:
 
```
pt_shell
```
     
Below is the screenshot PT Shell:

<img width="1080" alt="pt.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/c1e43e418511df18b66bc80e51f2f36c58caffc9/docs/assets/images/pt.png">
</details>

<details>
 <summary> LC Tool </summary>
Library Compiler is a tool used to create and characterize libraries of standard cells and provides an interface for designers to  integrate the generated library into their design flow. The Library Compiler shell is the user interface  used to interact with the Library Compiler tool. It can be triggered in terminal using below command:
 
```
lc_shell
```
     
Below is the screenshot lc_shell:

<img width="1080" alt="lc.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/c1e43e418511df18b66bc80e51f2f36c58caffc9/docs/assets/images/lc.png">
</details>

<details>
 <summary> Yosys Tool </summary>
Yosys is an open-source  tool for Verilog RTL (Register Transfer Level) synthesis. It is used for converting high-level hardware descriptions written in Verilog into gate-level representations. It can be opened using following command and detailed execution steps is in #day1: 
 
```
yosys
```
    
Below is the screenshot yosys:

<img width="1080" alt="yosys.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/694af0685ed92cb7f26b96ebab6e2bc40875e4c3/docs/assets/images/yosys.png">
</details>

<details>
 <summary> Iverilog Tool </summary>
Icarus Verilog is an open-source verilog simulator and compiler which is used RTL simulation, testbench development and debugging digital circuits described in the Verilog hardware description language. Following commands are used to run the simulation :  
 
```
iverilog -o NameOfOutputFile andGate.v tb_andGate.v
vvp NameOfOutputFile
```
         
     
Below is the screenshot Iverilog:

<img width="1080" alt="iverilog.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/375334654ad23ffa264268291b7ce1a112cb8be3/docs/assets/images/iverilog.png">
</details>

<details>
 <summary> GTKWave Tool </summary>
GTKWave is an open-source waveform viewer tool used for analyzing and visualizing digital signals in simulation or testing environments. It's commonly used in waveform visualization and simulation debugging. It can be opened in terminal using below command :  
 
```
gtkwave
gtkwave NameOffile.vcd
```
         
Below is the screenshot GTKWave:

<img width="1080" alt="gtkwave.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/694af0685ed92cb7f26b96ebab6e2bc40875e4c3/docs/assets/images/gtkwave.png">
</details>


<details>
 <summary> Summary </summary>
Tool Check done for : 
  icc2_shell 
  ,pt_shell 
  ,dc_shell 
  ,lc_shell 
  ,Yosys 
  ,Gtkwave 
  ,Iverilog.
</details>	

## Day-1-Introduction-to-Verilog-RTL-design-and-Synthesis

<details>
 <summary> RTL Simulation using Iverilog and GTKWave </summary>

RTL Design  is a behaviorol description of required specification. RTL Simulation is done using Iverilog which generate output executable and .vcd file. Using .vcd file  waveform is analysed in GTKWave. Below is the verilog code and test bench used as an example.

<img width="1080" alt="tb_verilog.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/d95275e930767c8e97a14d9b4929ee069c445512/docs/assets/images/tb_verilog.png">

To generate the executable following command is used:

```
iverilog -o output good_mux.v tb_good_mux.v
```

To view the waveform, first run the executable and it will generate value change dump file(vcd) and this is pushed to GTKWave and all the inputs, wire and outputs are added to waveform window for further analysis. Following commands are used in this process:

```
./output                   //Executing to generate vcd file 
gtkwave tb_good_mux.vcd    //Pushing vcd to gtkwave
```
     
Below is the waveform generated for good_mux.v :

<img width="1080" alt="simulation.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/d95275e930767c8e97a14d9b4929ee069c445512/docs/assets/images/simulation.png">
</details>

<details>
 <summary> RTL Synthesis using Yosys </summary>

 RTL synthesis is the process of converting an abstract and functional representation of a digital circuit into a gate-level representation(netlist). Yosys tool is used to perform the synthesis.
  First step is to open the Yosys shell and load the liberty file(.lib). Liberty file is a collection of logical modules which includes basic gates and modules of different flavours. 
   Second step is to load the RTL design in our case good_mux.v and define the top module of the RTL design i.e good_mux. 
   Now run the synthesis by providing the liberty file information so that synthesizer can select a optimum module among different flavours of standard cell modules and it will generate the netlist. Following are the commands to complete this process of synthesis in yosys:
 
```
yosys                                                                      // Open the yosys shell
read_liberty -lib ../my_lib/lib/sky130_fd_sc_hd__tt_025C_1v80.lib          // Reading the liberty file
read_verilog good_mux.v                                                    // Loading the RTL Design 
synth -top good_mux                                                        // Defining top module
abc -liberty ../my_lib/lib/sky130_fd_sc_hd__tt_025C_1v80.lib               // Firing the sythesis
show                                                                       // Schematic of netlist
```

Below is the schematic of netlist generated after the synthesis :
<img width="1080" alt="netlist_sch.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/d95275e930767c8e97a14d9b4929ee069c445512/docs/assets/images/netlist_sch.png">

To write and view the netlist use following following commands in yosys shell: 

```
write_verilog -noattr good_mux_netlist.v
!vim good_mux_netlist.v
```
            
Below is the good_mux_netlist.v generated after sythnesis :

<img width="1080" alt="netlist.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/d95275e930767c8e97a14d9b4929ee069c445512/docs/assets/images/netlist.png">
</details>

## Day-2-Timing-libs-hierarchical-vs-flat-synthesis-and-efficient-flop-coding-styles

<details>
 <summary> Timing Library </summary>

- Timing libraries provide a  set of timing information for standard cells. This information includes delay, setup time, hold time, area, power  and other parameters that are critical for accurately estimating the performance of the circuit.Below is the screenshot of lib file: 

<img width="1080" alt="lib_file" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/9709b1ea1ff4e277fa5be7b4a21c4abad25b1a6e/docs/assets/images2/lib_file.png">

- During the synthesis stage, the design is translated from a HDL code into a gate-level netlist. Timing libraries enable the synthesis tool to make informed decisions about cell selection and placement, optimizing the design for factors like speed, power consumption, or area and also meet timimng requirement. Fabrication processes also introduce variability due to various factors. Timing libraries incorporate these variations, offering libraries for different process corners, voltages, and temperatures(PVT). 

  Below is the screenshot of different types of nand gate: 

 <img width="1080" alt="libs.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/373c74c4e290f8fe355dc012d2724a13d1a4f64e/docs/assets/images2/libs.png">

- As we can see in above image, a nand gate of three different flavours are selected for discussion. Since nand is "!A&B", four different combinations of input is given along with specific leakage power. As the area is increase the delay of the cells is decrease but the power will increase. Therefore while selecting cell, synthesis tool will look for optimal cell so that it will satisfy both power, area and timing requirement.  

</details>

 <details>
  <summary>Hierarchical vs flat synthesis</summary>
 
 Multiple_module verilog RTL file: 
  
<img width="1080" alt="mm_rtl.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/373c74c4e290f8fe355dc012d2724a13d1a4f64e/docs/assets/images2/mm_rtl.png">
  
- Hierarchical Synthesis: Hierarchical synthesis divides the design into smaller modules or blocks. These blocks can be synthesized independently and reused across multiple projects. It allows us to handle the complexity by breaking it down into manageable pieces and focusing on optimizing individual blocks. Below is the sample of hierarchical synthesis:

<img width="1080" alt="mm_heirsynth.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/373c74c4e290f8fe355dc012d2724a13d1a4f64e/docs/assets/images2/mm_heirsynth.png">

- In above verilog file we can see multiple sub module as part of netlist , hence when synthesized (hierarchical)  we can see tool has synthesized all the individual module. Even in the schematic attached below we can see two sub module inside the main multiple module file.  

<img width="1080" alt="heir_sch.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/373c74c4e290f8fe355dc012d2724a13d1a4f64e/docs/assets/images2/heir_sch.png">

- Flat Synthesis: In a flat synthesis approach, the entire design is treated as a single entity, with all modules and components being synthesized together. This approach is simpler to set up and manage for small designs. Command used to perform flat synthesis is "flatten". Below is the figure of flat synthesis netlist:

<img width="1080" alt="mm_flatsynth.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/373c74c4e290f8fe355dc012d2724a13d1a4f64e/docs/assets/images2/mm_flatsynth.png">

- As we can see in the above netlist all the sub module is combined i.e all the modules are synthesized together. flat synthesis makes debugging  easier since  all the design components are synthesized together, making it straightforward to trace signals across the design. Below is the schematic of flat synthesized netlist: 

 <img width="1080" alt="flat_sch.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/373c74c4e290f8fe355dc012d2724a13d1a4f64e/docs/assets/images2/flat_sch.png">

- Sometimes instead synthesizing the whole design, it is useful to synthesize individual module. This is the case useful when there are same modules used multiple times so synthesizing one of those module and reusing the same again will save resources as well as time. To do this, while performing synthesis define top module as that one module you want to synthesize. Below is the synthesized netlist of the same: 
<img width="1080" alt="ss_synth.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/373c74c4e290f8fe355dc012d2724a13d1a4f64e/docs/assets/images2/ss_synth.png">
 
</details>

<details>
<summary>Efficient flop coding styles</summary>

 D Flip-flops are  memory storage elements used for data processing. D flip-flop can be built using NAND gate or with NOR gate. There are different methods to build these flip flop and they are discussed below:

  1) D flip flop with asynchronous reset:
 
 <img width="1080" alt="dff_arrtl.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/373c74c4e290f8fe355dc012d2724a13d1a4f64e/docs/assets/images2/dff_arrtl.png">

- In this type of flip flop, flip flop can be reset at any time irrespective of clock edge but latching data (D - Q pin) will still be dependent on sensitive clock edge. Below is the waveform and schematic of the flip flop:  
  
  <img width="1080" alt="dff_arwv.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/373c74c4e290f8fe355dc012d2724a13d1a4f64e/docs/assets/images2/dff_arwv.png">
- As per the description above , when the reset is going from '1' to '0' data from d is latched into flip flop at next clock edge and when the reset pin is going from '0' to '1' it is reset to '0' immediately without waiting for next clock cycle. Schematic of the same is attached below : 

  <img width="1080" alt="dff_arsch.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/373c74c4e290f8fe355dc012d2724a13d1a4f64e/docs/assets/images2/dff_arsch.png">

 Since the available D flip flop in library has active low reset and one we designed is active high reset, a inverter cell is added by synthesis tool. 

  2) D flip flop with asynchronous set:
 
 <img width="1080" alt="dff_asrtl.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/373c74c4e290f8fe355dc012d2724a13d1a4f64e/docs/assets/images2/dff_asrtl.png">

- In this type of flip flop, flip flop can be set at any time irrespective of clock edge but latching data (D - Q pin) will still be dependent on sensitive clock edge. Below is the waveform and schematic of the flip flop:  
  
  <img width="1080" alt="dff_aswv.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/373c74c4e290f8fe355dc012d2724a13d1a4f64e/docs/assets/images2/dff_aswv.png">
- As per the description above , when the set is going from '1' to '0' data from d is latched into flip flop at next clock edge and when the set pin is going from '0' to '1' it is set to '1' immediately without waiting for next clock cycle. Schematic of the same is attached below : 

  <img width="1080" alt="dff_assch.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/373c74c4e290f8fe355dc012d2724a13d1a4f64e/docs/assets/images2/dff_assch.png">

3) D flip flop with synchronous reset:
 
 <img width="1080" alt="dff_srrtl.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/373c74c4e290f8fe355dc012d2724a13d1a4f64e/docs/assets/images2/dff_srrtl.png">

- In this type of flip flop, setting and resetting is  dependent on  clock edge. Below is the waveform and schematic of the flip flop:  
  
  <img width="1080" alt="dff_srwv.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/373c74c4e290f8fe355dc012d2724a13d1a4f64e/docs/assets/images2/dff_srwv.png">
- As per the description above , when the reset is going from '1' to '0' data from d is latched into flip flop at next clock edge and when the reset pin is going from '0' to '1' it is reset to '0' in next clock cycle. Schematic of the same is attached below : 

  <img width="1080" alt="dff_srsch.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/373c74c4e290f8fe355dc012d2724a13d1a4f64e/docs/assets/images2/dff_srsch.png">
  
</details>

<details>
<summary>Optimization</summary>
- In this section, Optimization techniques used by synthesis tool  are discussed. Two designs - mult2 and mult8. RTL code for the same is attched below : 
 
 <img width="1080" alt="mul2mul8.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/373c74c4e290f8fe355dc012d2724a13d1a4f64e/docs/assets/images2/mul2mul8.png">
Below is truth table for mult2 module in which 3 bit input is multiplied with 2 and 4 bit output is generated.

```
a[2]-a[1]-a[0] * 2  y[3]-y[2]-y[1]-y[0]
  0 - 0  - 0          0 - 0  - 0 - 0
  0 - 0  - 1          0 - 0  - 1 - 0
  0 - 1  - 0          0 - 1  - 0 - 0
  0 - 1  - 1          0 - 1  - 1 - 0
  1 - 0  - 0          1 - 0  - 0 - 0
  1 - 0  - 1          1 - 0  - 1 - 0
  1 - 1  - 0          1 - 1  - 0 - 0
  1 - 1  - 1          1 - 1  - 1 - 0
```

- As we can see from above table,  design doesn't neccesarily need any logic cell/modules to operate, output is just input left shifted by one bit. therefore when synthesized, it will show that no logic cells are there to synthesize. Below is the schematic and netlist generated after synthesis :

 <img width="1080" alt="mul2synth.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/373c74c4e290f8fe355dc012d2724a13d1a4f64e/docs/assets/images2/mul2synth.png">
 <img width="1080" alt="mul2sch.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/373c74c4e290f8fe355dc012d2724a13d1a4f64e/docs/assets/images2/mul2sch.png">
- In this schematic, we can observe that input pins a[2],a[1],a[0] are directly connected to  y[3],y[2],y[1] and logic '0' is connected to y[0] and no standard cells are used.

- Similarly, Mult8 is synthesized and it is is obvious that output is just input left shifted by 3 bits. Therefore there are no modules or cells synthesizable in design. Below is the schematic and netlist of the mult8 module: 
 
 <img width="1080" alt="mul8_synth.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/373c74c4e290f8fe355dc012d2724a13d1a4f64e/docs/assets/images2/mul8_synth.png">
 <img width="1080" alt="mul8_sch.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/373c74c4e290f8fe355dc012d2724a13d1a4f64e/docs/assets/images2/mul8_sch.png">
</details>

## Day-3-Combinational-and-sequential-optimizations
<details>
 <summary>Combinational Logic Optimization</summary>
 Combinational logic optimization is a technique used to improve the efficiency and performance of digital circuits that consist of interconnected logic gates. The goal is to minimize the circuit's delay, power consumption, and area while maintaining the desired functionality. This optimization is achieved through various methods, including:
 
   1) Constant Propagtion: Constant propagation is a technique used in combinational logic optimization to replace variables or signals with their constant values in order to simplify the logic circuit. This helps reduce the complexity of the circuit and can lead to improved performance and reduced power consumption.
   
 Example:-    
 Consider a logic circuit Y = (A.B + C)' and input A is hardwired to logic '0', following simplification can be made : 
    
 ```
// if A=0
// Y = ((0.B)+C)'
// Y = (0+C) = C'
 ```

   Thus whole logic which needed two gates i.e 6 MOSFETS But now the logic is reduced to simple inverter which can be easily  built using a PMOS and an NMOS.
   
   2) Boolean logic optimization:  Applying Boolean algebra rules to simplify logic expressions and reduce the number of gates needed. Following commands are used in yosys shell to perform the combinational optimization :

```
 read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
 read_verilog opt_check.v
 synth -top opt_check
 opt_clean -purge
 abc -liberty ../sky130_fd_sc_hd__tt_025C_1v80.lib
 show
```

Example 1:-
opt_check.v RTL File :

```
module opt_check (input a , input b , output y);
	assign y = a?b:0;                             
endmodule
// Simplification
// y = (a').0 + a.b
// y  = 0 + a.b
// y = a.b         => AND gate is sufficient
```

Below is Schematic after optimization : 
<img width="1080" alt="oc1.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/68d2e1f12f100714c99a8e8a60fe7608bcefb4bf/docs/assets/images3/oc1.png">
As per the code above, circuit is optimized to simple AND gate.
 
Example 2:-
opt_check2.v RTL File :

```
module opt_check2 (input a , input b , output y);
	assign y = a?1:b;
endmodule
// Simplification
// y =  (a').b + a.1
// y = a'.b + a
// y = a + b        => OR gate is sufficient
```

Below is Schematic after optimization : 
<img width="1080" alt="oc2.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/68d2e1f12f100714c99a8e8a60fe7608bcefb4bf/docs/assets/images3/oc2.png">
As per the code above, circuit is optimized to simple OR gate.

Example 3:-
opt_check3.v RTL File :

```
module opt_check3 (input a , input b, input c , output y);
	assign y = a?(c?b:0):0;
endmodule
// Simplification
// y = a'.0 + a.(c'.0 + c.b)
// y = 0 + a.b.c
// y = a.b.c                => 3 input AND gate is sufficient

```

Below is Schematic after optimization : 
<img width="1080" alt="oc3.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/68d2e1f12f100714c99a8e8a60fe7608bcefb4bf/docs/assets/images3/oc3.png">
As per the code above, circuit is simplified to simple 3 input AND gate.

Example 4:-
opt_check4.v RTL File :

```
module opt_check4 (input a , input b , input c , output y);
	assign y = a?(b?(a & c ):c):(!c);
endmodule
// y = a'.c' + a.(b'.c + b.a.c)
// y = a'.c' + a.b.c + a.b'c
// y = a'.c' + a.c(b + b')
// y = a'.c' + a.c
// y = a 0 c                  => XNOR Gate
 
```

Below is Schematic after optimization : 
<img width="1080" alt="oc4.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/68d2e1f12f100714c99a8e8a60fe7608bcefb4bf/docs/assets/images3/oc4.png">
As per the code above, circuit is simplified to simple XNOR gate.

Example 5:-
multiple_module_opt2.v RTL File :

```
module sub_module2 (input a, input b, output y);
	assign y = a | b;
endmodule
module sub_module1 (input a, input b, output y);
	assign y = a&b;
endmodule
module multiple_modules (input a, input b, input c , output y);
	wire net1;
	sub_module1 u1(.a(a),.b(b),.y(net1)); 
	sub_module2 u2(.a(net1),.b(c),.y(y));  
endmodule
// y = net1 + c
// y = a.b + c  => one AND and an OR gate is required.
```
Below is Schematic after optimization : 
<img width="1080" alt="mmo.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/68d2e1f12f100714c99a8e8a60fe7608bcefb4bf/docs/assets/images3/mmo.png">
As per the code above, circuit is simplified to simple OR and AND gate.
</details>

<details>
 <summary>Sequential Logic Optimization</summary>
Sequential logic optimizations include: 
	
- Sequential constant propagation :-   Constant is propagated with clock involved.
  
- State optimization :-  Unused states are optimized.
   
- Retiming :- Logic is split to decrease timing of the different logic portions and increase frequency.

- Sequential logic cloning :- Physical aware synthesis is done to optimize the floop plan.

 Commands used are : 
 
 ```
 read_liberty -lib ../sky130_fd_sc_hd__tt_025C_1v80.lib
 read_verilog dff_const1.v
 synth -top dff_const1
 dfflibmap -liberty ../sky130_fd_sc_hd__tt_025C_1v80.lib
 abc -liberty ../sky130_fd_sc_hd__tt_025C_1v80.lib
 show
```

Example 1:- 
dff_const1.v RTL File :

```
module dff_const1(input clk, input reset, output reg q);
	always @(posedge clk, posedge reset)
	begin
		if(reset)
			q <= 1'b0;
		else
			q <= 1'b1;
	end
endmodule
```

Waveform : 
<img width="1080" alt="dc1wv.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/9a02b148108b4357bfdaf85ca28b8b889cb483f9/docs/assets/images3/dc1wv.png">
As we see in above image , when is reset is going from logic '1' to '0' output q is changed to '0' to '1' in next edge of clock cycle and stays the same until reset is '1' again.

Schematic: 
<img width="1080" alt="dc1syn.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/9a02b148108b4357bfdaf85ca28b8b889cb483f9/docs/assets/images3/dc1syn.png">
Thus as we see in above schematic one flip flop is enough to realize the above design.

Example 2:- 
dff_const2.v RTL File :

```
module dff_const2(input clk, input reset, output reg q);
	always @(posedge clk, posedge reset)
	begin
		if(reset)
			q <= 1'b1;
		else
			q <= 1'b1;
	end
endmodule
```

Waveform : 
<img width="1080" alt="dc2wv.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/9a02b148108b4357bfdaf85ca28b8b889cb483f9/docs/assets/images3/dc2wv.png">
As we see in above waveform, output is always '1' irrespective of  reset or clock.

Schematic: 
<img width="1080" alt="dc2syn.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/9a02b148108b4357bfdaf85ca28b8b889cb483f9/docs/assets/images3/dc2syn.png">
As per the waveform, buffer cell with input pulled to logic '1' is enough to represent the design.

Example 3:- 
dff_const3.v RTL File :

```
	module dff_const3(input clk, input reset, output reg q);
	reg q1;

	always @(posedge clk, posedge reset)
	begin
		if(reset)
		begin
			q <= 1'b1;
			q1 <= 1'b0;
		end
		else
		begin
			q1 <= 1'b1;
			q <= q1;
		end
	end
	endmodule
```

Waveform : 
<img width="1080" alt="dc3wv.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/9a02b148108b4357bfdaf85ca28b8b889cb483f9/docs/assets/images3/dc3wv.png">
In this design, when the reset is going from '1' to '0' q1 will be set to '1' in next edge of clock cycle and q will be latched a data from q1. Because of Clk-Q delay(Tc-q) q is latched with '0' and will be changed to '1' in next edge of  cock cycle.

Schematic: 
<img width="1080" alt="dc3syn.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/9a02b148108b4357bfdaf85ca28b8b889cb483f9/docs/assets/images3/dc3syn.png">
Minimum of two D flip flop are required to realize the above design and further optimization is not possible.

Example 4:- 
dff_const4.v RTL File :

```
	module dff_const4(input clk, input reset, output reg q);
	reg q1;

	always @(posedge clk, posedge reset)
	begin
		if(reset)
		begin
			q <= 1'b1;
			q1 <= 1'b1;
		end
	else
		begin
			q1 <= 1'b1;
			q <= q1;
		end
	end
	endmodule
```

Waveform : 
<img width="1080" alt="dc4wv.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/9a02b148108b4357bfdaf85ca28b8b889cb483f9/docs/assets/images3/dc4wv.png">
Similar to example3 here input to first flip flop is pulled to logic '1' there form both q and q1 will be '1' all the time irrespective of clock or reset.

Schematic: 
<img width="1080" alt="dc4syn.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/9a02b148108b4357bfdaf85ca28b8b889cb483f9/docs/assets/images3/dc4syn.png">
Tool has optimized the design and synthesized it into two buffers with input pulled to logic '1'.


Example 5:- 
dff_const5.v RTL File :

```
	module dff_const5(input clk, input reset, output reg q);
	reg q1;
	always @(posedge clk, posedge reset)
		begin
			if(reset)
			begin
				q <= 1'b0;
				q1 <= 1'b0;
			end
		else
			begin
				q1 <= 1'b1;
				q <= q1;
			end
		end
	endmodule
```

Waveform : 
<img width="1080" alt="dc5wv.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/e9d96208f4be23fab7082be957a8ee72fb3a60a2/docs/assets/images3/dc5wv.png">
When the reset is going from '1' to '0' q1 is pulled to logic '1' in next edge of clock cycle and q is pulled to logic 1 in subsequent edge of clock cycle  unless the reset pin goes high again.

Schematic: 
<img width="1080" alt="dc5syn.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/9a02b148108b4357bfdaf85ca28b8b889cb483f9/docs/assets/images3/dc5syn.png">
Since the q1 and q value is changing with respect to reset and clock, tool has optimzed the design to two D  flip-flops with first flip flop's 'D' pin connected to logic '1' and its outpuut connected to input of the next flipflop.


</details>
<details>
 <summary>Unused output Optimization</summary>
Counter_opt RTL File:- (with 2 bits out of 3 are unused)

```
module counter_opt (input clk , input reset , output q);
 reg [2:0] count;
 assign q = count[0];
 always @(posedge clk ,posedge reset)
  begin
   if(reset)
    count <= 3'b000;
   else
    count <= count + 1;
  end
endmodule
```
Schematic is attached below:-
<img width="1080" alt="co1.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/9c061cbf68cdfdad90989378360f2fa7d37ae55a/docs/assets/images3/co1.png">
We can see that tool has optimized the design to only one flip flop since 2 bits are unused.

Counter_opt RTL File:- (with all the 3 bits are used)

```
module counter_opt (input clk , input reset , output q);
 reg [2:0] count;
 assign q = (count[2:0] == 3'b001) ;
 always @(posedge clk ,posedge reset)
 begin
   if(reset)
     count <= 3'b000;
   else
     count <= count + 1;
  end
endmodule
```

Schematic is attached below:-
<img width="1080" alt="co2.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/9c061cbf68cdfdad90989378360f2fa7d37ae55a/docs/assets/images3/co2.png">
Here all the 3 bits are used therefore three flip flops and adder circuit for counting logic is given.

</details>

## Day-4-GLS-Blocking-vs-Non-blocking-and-Synthesis-Simulation-mismatch

<details>
<Summary>Introduction</Summary>

**GLS-Gate Level Simulation**:<br />
- Gate-level simulation is a type of  simulation where the netlist is simulated with orginal test bench. Since the netlist is logically same as RTL code same test bench can be used
- GLS performed to verify logic correctness  of design and ensuring the timing of design is met.
- For checking timing of design with GLS it needs to be run with delay annotations.
- Following is the steps to perform GLS :

```
      Design-Netlist  ⬂ 
  GLS Verilog Models  ⇨ Iverilog ⇨ VCD File ⇨  GTKWave
           TestBench  ⬀ 
```
- As per the above diagram, After synthesis is done netlist is used in the place of design under test code and ran with the same test-bench along with other required verilog models like sky130_fd_sc_hd.v and primitives.v.
       
**Synthesis-Simulation Mismatch**:<br />
- A synthesis simulation mismatch refers to a situation where the behavior of a  design as simulated before synthesis does not match the behavior of the same design after it has been synthesized and simulated at a gate level.
- This can happen due to multiple design:
     1. Missing sensitivity list.
     2. Blocking and Non-blocking Assignment.
     3. Non-Standard verilog coding.
- Missing sensitivity list:  The sensitivity list is a crucial consideration in  design, particularly when dealing with RTL and gate level design descriptions. A missing or incorrect sensitivity list can lead to significant discrepancies between the simulation results before and after synthesis.

**Blocking and Non-blocking statements:**
- Blocking and non-blocking statements are fundamental concepts in Verilog HDL. They are used to model signal assignments and updates in designs.
  
**1. Blocking Statements:**
- Blocking assignments are represented using the = operator in Verilog.
- When a blocking assignment is executed, it immediately updates the target signal's value before moving on to the next statement.
- Blocking assignments model a sequential behavior, similar to how instructions are executed in software.
- Example:

  ```
  a = b;      // Blocking assignment.
  c = a + b;  // Will use the updated value of 'a'.
  // Execute in the order they are written.
  ```
  
**2. Non-Blocking statements:**
- Non-blocking assignments are represented using the <= operator in Verilog.
- Evaluate the RHS of nonblocking statements at the beginning of the time step and update the LHS of nonblocking statements at the end of the time step.
- Non-blocking assignments model concurrent behavior, where multiple events can occur simultaneously and their updates are scheduled concurrently.
- Example:

  ```
  a <= b;      // Non-blocking assignment
  c <= a + b;  // Uses old value of a.
  // Execute all the statements in parallel.
  ```
 
</details>

<details>
<Summary>Lab on GLS and Simulation-Synthesis Mismatch</Summary>
	
**Steps to perform GLS and check for Simulation-Synthesis Mismatch:** 

```
// Simulation before synthesis
# iverilog -o output DUT.v TestBench.v
# ./output
# gtkwave Testbench.vcd
```

```
// Synthesis
# Yosys
>> read_liberty -lib  ../Path to .lib file
>> read_verilog DUT.v
>> synth -top modulename
>> abc -liberty ../Path to .lib file
>> write_verilog netlist.v
```

```
// Simulation after synthesis
# iverilog -o output ../Path to Primitives.v ../sky130_fd_sc_hd.v netlist.v TestBench.v
# ./output
# gtkwave TestBench.vcd
// Now compare the both results
```

**Example1:** There is no simulation-synthesis mismatch in this example.

```
module ternary_operator_mux (input i0 , input i1 , input sel , output y);
   assign y = sel?i1:i0;
endmodule
// y = i0.sel' + i1.sel 
```

Waveform before the synthesis: 
<img width="1080" alt="to_wv.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/002d0c0159831b8688ba12169779dae8adf0433d/docs/assets/imagesday4/to_wv.png">

- As we can see in the above image, when sel is '0' output y is following i0 and when sel is '1' output y is following i1 which is a desired behaviour.

Waveform after the synthesis: 
<img width="1080" alt="to_ssm.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/002d0c0159831b8688ba12169779dae8adf0433d/docs/assets/imagesday4/to_ssm.png">

- Comparing to the waveform above we can say that there's no synthesis-simulation mismatch. Below is the schematic of netlist : 

Schematic: 
<img width="1080" alt="to_sch.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/9e140f98907b57510a7dbb8d6445796e9b8eee60/docs/assets/imagesday4/to_sch.png">

**Example2:** There is a simulation-synthesis mismatch in this example:

```
module bad_mux (input i0 , input i1 , input sel , output reg y);
	always @ (sel)                                             // whenever there's a change in 'sel' value => execute
	begin
		if(sel)
			y <= i1;   // Non blocking assignment
		else 
			y <= i0;   // Non blocking assignment
	end
endmodule
```

Waveform before the synthesis: 
<img width="1080" alt="bm_wv.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/002d0c0159831b8688ba12169779dae8adf0433d/docs/assets/imagesday4/bm_wv.png">

- In above image, output y is updating only when ther is change in  sel i.e when the sel is going from '0' to '1' output y is updated with value of i1 at that instant and it will stay the same until next change but as a muultiplexer output y should follow whatever the value coming from input. Thus above design is not considering  changes in input value but only changing when there's change in sel signal.
- This design acting like dual edge flip-flop.   

Waveform after the synthesis: 
<img width="1080" alt="bm_ssm.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/002d0c0159831b8688ba12169779dae8adf0433d/docs/assets/imagesday4/bm_ssm.png">

- Synthesis tool will create netlist based on functionality of RTL code and it's simulation as seen above is following a proper multiplexer. Thus synthesis-simulation mismatch can be rectified by gate-lvel simulation done above. Below is the schematic of the netlist: 

Schematic: 
<img width="1080" alt="bm_sch.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/002d0c0159831b8688ba12169779dae8adf0433d/docs/assets/imagesday4/bm_sch.png">


**Example3:** There's no simultaion-synthesis mismatch in below example.

```
module good_mux (input i0 , input i1 , input sel , output reg y);
	always @ (*)                                              // whenever there's a change in any value => execute  
	begin
		if(sel)
			y <= i1;
		else 
			y <= i0;
	end
endmodule
```

Waveform before the synthesis: 
<img width="1080" alt="gm_wv.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/002d0c0159831b8688ba12169779dae8adf0433d/docs/assets/imagesday4/gm_wv.png">

Waveform after the synthesis: 
<img width="1080" alt="gm_ssm.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/002d0c0159831b8688ba12169779dae8adf0433d/docs/assets/imagesday4/gm_ssm.png">

- By comparing these two waveform above we can say there's no synthesis-simulation mismatch
- Previous problem was rectified by adding a '*' in always block so that whenever there's a change in select line and inputs, always block is exceuted. 

Schematic: 
<img width="1080" alt="gm_sch.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/002d0c0159831b8688ba12169779dae8adf0433d/docs/assets/imagesday4/gm_sch.png">

	
</details>

<details>
<Summary>Lab on Simulation-Synthesis Mismatch for Blocking Statements</Summary>

**Example:** Using blocking statements inside an always block.

```
module blocking_caveat (input a , input b , input  c, output reg d); 
reg x;
always @ (*)
	begin
	d = x & c; // blocking statement
	x = a | b; // blocking statement
end
endmodule
```

- There's no synthesis simulation mismatch but due to blocking statements in wrong order has caused output to accumulate previous values or junk values.
- Since the blocking statements execute in consecutive order, when d is calculated value of 'x' considered is a previous one which in turn caused a delay.
  
Waveform before and after the synthesis: 
<img width="1080" alt="tw.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/15a44a36628f7636687c21de2d5f12d96f6d564b/docs/assets/imagesday4/tw.png">

- In above window, top tab represents simulation before synthesis and bottom one is after synthesis simulation.
- As per the  logic following observation can be made:

```
d =  (a + b) . c
//At 1500ns marker is placed and following calculation can be made
d = (0 + 0) . 1
d = 0 
```
- So the correct output 'd' at 1500ns should be '0' but in top waveform where simulation is done before synthesis output  'd' is shown as '1' i.e it's taking a value of previous cycle. This problem is rectified by doing GLS(bottom tab) where the correct output is shown.
  
Schematic: 
<img width="1080" alt="bs_sch.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/002d0c0159831b8688ba12169779dae8adf0433d/docs/assets/imagesday4/bs_sch.png">
	
</details>

## Day-5-DFT 

<details>
<summary>DFT</summary>

**What is DFT?**
- Design for Testability (DFT) is a set of techniques and methodologies used to enhance the ease and efficiency of testing the chips after they are  manufactured. The  goal of DFT is to ensure that the manufactured  can be thoroughly tested to detect any defects or faults that might have occurred during the fabrication process. DFT plays a crucial role in reducing the time and cost associated with testing and debugging fabricated chips.
- There are 3  levels of testing after chips are manufactured:
    - Chip level
    - Board level
    - System level

**Advantages of DFT:**

- Improved rest coverage: DFT techniques ensure that a high percentage of potential defects can be detected during testing.
- Reduced test time: By using scan chains and optimized test patterns, the time required to test a chip is  reduced compared to other methods.
- Faster debugging: DFT allows for easier identification  of faults, speeding up the debugging process after testing.
- Higher yield: With thorough testing made possible by DFT, faulty ICs can be identified and corrected before they are shipped, leading to a higher manufacturing yield.

**Challenges:**

- Area Overhead: The additional circuitry required for DFT techniques can increase the overall chip area,  impacting the design's performance and cost.
- Complexity: Implementing DFT techniques requires specialized knowledge and tools, adding complexity to the design process.
- Power Consumption: Some DFT techniques, like scan chains, can lead to increased power consumption during testing.
- Trade-offs: Designers often need to make trade-offs between the level of test coverage, test time, area overhead, and other design metrics.

**Basic Terminology:**

- Observability: Observability refers to the ability to r capture the values of internal nodes or signals within a  circuit during the testing process.
- Controllability:  Controlability refers to the ability to set or control specific values on internal nodes or signals within a  circuit during the application of test patterns. 
- Fault:  Faults refer to defects or errors in a  circuit that can lead to incorrect or unexpected behavior.
- Error: Error is caused when there is a fault, it refers to any deviation from the expected or correct behavior of the circuit.
- Failure: It refers to a situation where a circuit does not perform its intended function correctly.
- Fault Coverage :The percentage of  defects or faults that can be detected by a set of test vectors..
             Fault coverage  = # Faults detected/# Total faults

**DFT Techniques**
- Ad-Hoc Testing:
   - Ad hoc testing refers to a non-systematic approach to testing a  circuit. It involves using individual test cases to identify potential faults or errors in the design.
   - Ad hoc testing is often performed early in the testing process to quickly uncover obvious issues before more formal testing methods are applied.
   - Steps:
      - Avoid Combinational feedback
      - All flops must be intializable
      - Partioning a large circuit into small blocks
      - Provide test control for signals which are not controllable
      - Consider the ATE requirements
- Structured Technique:
   - A structured technique involves following a systematic approach to ensure that a  circuit is designed in a way that makes it easy to test and detect faults.
   - One of the most common structured techniques in DFT is the use of scan chains. Following are the steps to consider:
      - Scan Chain Insertion: Identify flip-flops within the design and group them into scan chains. Insert additional circuitry to create scan-in and scan-out  pins for each scan chain.
      - Test Vector Generation: Utilize ATPG tools to automatically generate test vectors that will be loaded into the scan chains.
      - Scan Chain Operation: Load the generated test vectors into the scan chains through the SI pins. Clock the circuit, allowing the test vectors to propagate through the circuit. Observe the outputs from the SO pins and compare them to expected results.

**ATE functionality:**

- Scan in phase
- Parallel Measure
- Parallel Capture
- First scan out phase
- Scan out phase

</details>


## Day-6-Introduction-to-logic-synthesis

<details>
<summary>Synthesis using Design Compiler</summary>
	
**Synthesis:**
- Synthesis is the process of converting an abstract and functional representation of a digital circuit into a gate-level representation.
- Design is converted into gates and connection are made between the gates.
- This is given out as file called netlist.

**Libraries:**
- **.lib** file: Collection of logical modules which include basic logic gates of different flavour.
- **.db** file: .db is the compiled version of liberty file(.lib).

**SDC:**
- SDC is a short form of “Synopsys Design Constraint”. SDC is a common format for constraining the design which is supported by almost all tools.
- Timing, power and area constraints of design are provided through the SDC file and this file has extension .sdc.
- SDC is based on TCL language. 

**Introduction to DC:**
- Design compiler is a synthesis tool developed by synopsys.
- Design compiler should be provided with .db as it can't understand .lib file.
- DC Synthesis flow:

```
		Read STD Cell/tech.lib
			⇩
		Read Design (Verilog and Design.lib)
			⇩
		Read SDC
			⇩
		Link the Design
			⇩
		Synthesize
			⇩
		Generate Report and analyse QoR
			⇩
		Write out the Netlist
```
  
- Steps to perform synthesis in DC shell is given below:

```
> csh
> dc_shell                                        // invoking DC Shell
>> read_db ../../../path to db file               // .db is the compiled version of .lib file.
>> read_verilog lab1.v                            // reading the design
>> set target_library ../../../path to db
>> set link_library ../../../path to db
>> link
>> compile
>> write -f verilog -out netlist.v
>> write -f verilog -out lab1.ddc       
```

- To  avoid linking library all the time, create the following file and keep it in the user home directory.

**.synopsys_dc.setup**

```
set target_library /home/tharun.m/Desktop/dc_synth/DC_WORKSHOP/lib/sky130_fd_sc_hd__tt_025C_1v80.db
set link_library {* /home/tharun.m/Desktop/dc_synth/DC_WORKSHOP/lib/sky130_fd_sc_hd__tt_025C_1v80.db}
```

- To invoke gui of DC use following commands.

```
>> csh
>> design_vision      // or usethis in dc_shell //         >> gui_start
>> read_ddc lab1.ddc  // load the ddc from previos session

```
**Labs on DC:**

- RTL Code: 
<img width="1080" alt="lab1ff_code.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/55bce0aa4702736b10b68c28a48c8c01b38fc46f/docs/assets/Image5/lab1ff_code.png">

- Without linking the library synthesis is performed: 

Netlist Generated:
<img width="1080" alt="lab1ff_nolib_net.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/55bce0aa4702736b10b68c28a48c8c01b38fc46f/docs/assets/Image5/lab1ff_nolib_net.png">
- Since no library was linked befor running synthesis dc_shell will use the default library provied in it's memory.
- Tool has used a module SEQGEN for a flip flop with enable and reset.
Schematic:
<img width="1080" alt="lab1_nolib.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/55bce0aa4702736b10b68c28a48c8c01b38fc46f/docs/assets/Image5/lab1_nolib.png">

- Now link the sky130_fd_sc_hd__tt_025C_1v80.db library as per the above steps and perform synthesis.
Netlist Generated:
<img width="1080" alt="lab1ff_net.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/55bce0aa4702736b10b68c28a48c8c01b38fc46f/docs/assets/Image5/lab1ff_net.png">

Schematic:
<img width="1080" alt="lab1_sch.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/55bce0aa4702736b10b68c28a48c8c01b38fc46f/docs/assets/Image5/lab1_sch.png">  

- Now that sky130_fd_sc_hd__tt_025C_1v80.db is linked, tool will use the modules from that library.
- Since the code represent active high reset but available FF module has active low reset it has used a inverter module and a mux module for enable signals.
</details>
<details>
<summary>Labs on TCL</summary>
	
- TCL: Tool Command Language is the popular scripting language used in VLSI.
- Following are the common commands and syntax of TCL : 
  - set: Creating and storing information.
 
	
```
set a 5 
set a [expr $a+$b]
```

  - If statement 

```
if {condition} {
statements
} else {
statements
}
```
  - While statement

```
while {condition} {
statement
incr/decr
}
```
  - For statement 

```
for {looping var}  {condition} {modification} {
statement
}
```

  - Foreach statement 

```
foreach var list{
statement
}
```

  - Foreach_in_collection statement ( DC tool specific)

```
foreach_in_collection var collection {
statement
}
```

**Labs on TCL:**

- Example1: For loop
<img width="1080" alt="tcl_for.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/55bce0aa4702736b10b68c28a48c8c01b38fc46f/docs/assets/Image5/tcl_for.png">  

- Example2: While statement
<img width="1080" alt="tcl_while.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/55bce0aa4702736b10b68c28a48c8c01b38fc46f/docs/assets/Image5/tcl_while.png">  

- Example3: Foreach loop
<img width="1080" alt="tcl_foreach.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/55bce0aa4702736b10b68c28a48c8c01b38fc46f/docs/assets/Image5/tcl_foreach.png">  

- Example4: Foreach_in_collection statement
<img width="1080" alt="tcl_foreachdc.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/55bce0aa4702736b10b68c28a48c8c01b38fc46f/docs/assets/Image5/tcl_foreachdc.png">  

- Example5: Executing tcl script from dc_shell and following are the commands:

```
>> sh gvim sample.tcl
>> source sample.tcl
```

File:
<img width="1080" alt="tcl_file.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/55bce0aa4702736b10b68c28a48c8c01b38fc46f/docs/assets/Image5/tcl_file.png">

Output:
<img width="1080" alt="tcl_fileop.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/55bce0aa4702736b10b68c28a48c8c01b38fc46f/docs/assets/Image5/tcl_fileop.png">

</details>


## Day-7-Basic-SDC-constraints

<details>
<summary>Intro to STA and Constraints</summary>

**Max(setup) and Max(hold) Constraints:**

<img width="1080" alt="ff_diagram.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/bace6dab435173dde12e4499589550346fe56649/docs/assets/images7/ff_diagram.png">

- Set-up time refers to the minimum amount of time a data must be stable and valid before the clock edge  arrives for that data to be reliably latched  by a flip-flop or a latch.
- Hold time refers to the minimum amount of time a data  must remain stable and valid after the clock edge has arrived for that data to be reliably  captured by a flip-flop or latch.

<img width="1080" alt="setuphold.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/bace6dab435173dde12e4499589550346fe56649/docs/assets/images7/setuphold.png">

- As we can see in above schematic, at edge of launch clock edge data is latched into launch flop(FF1) and it assumed that it will take around one clock cycle to reach capture flop(FF2) because to Clock-Q delay and combinational delay.
- Setup check is checked in next cycle and hold check is done in present cycle.
- From the waveform we can observe the setup and hold time marked in red and blue region of the waveform repsectively.
- Two equations that are used to calculate min and max delay :
	- Max Delay   :  T<sub>clk</sub> > T<sub>c-q</sub> + T<sub>comb</sub> + T<sub>setup</sub>        ...(1)
	- Min Delay   :  T<sub>hold</sub>< T<sub>c-q</sub> + T<sub>comb</sub>				 ...(2)

**Delay:**
- Delay of the cell is a function of input transition and output load.  

**Timing Arcs:**
- Timing arcs define the timing characteristics of signals as they propagate through the circuit, providing information about the required delays, transition times, and clock relationships to ensure proper operation.
- Combinational cell: Delay information from every input pin and every output pin is contained.
- Sequential Cell: Set-up time, hold time, C-Q delay and D-Q delay for latch is contained. 

**Timing Path:**
- Timing paths are critical components in the analysis and optimization of digital integrated circuits.
- They represent specific routes or sequences of logic elements through which signals propagate.
- Critical Paths: Timing paths are often categorized as either critical or non-critical. Critical paths are those paths that determine the worst-case delay through a circuit.
- Propagation Delay: Each timing path has an associated propagation delay, which is the time it takes for a signal to travel from the source to the destination along that path. 
- Startpoint and Endpoint: In a timing path, the startpoint is the source of the signal, and the endpoint is the destination where the signal must meet specific timing requirements. 
- Setup Time and Hold Time: Timing paths are used to analyze whether a signal meets setup and hold time requirements at the destination flip-flop. 
- False Paths: False paths are paths in the design that are intentionally ignored during timing analysis because they do not impact the functionality or performance of the circuit.
- Following numerical will help understanding the timing path concept better:

<img width="1080" alt="timingpath_num.jpg" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/bace6dab435173dde12e4499589550346fe56649/docs/assets/images7/timingpath_num.jpg">

- This circuit has two timing path and assume setup time of 0.5ns(T<sub>setup</sub>) and  T<sub>c-q</sub> of 0.5ns.
- As per the two equations mentioned above (1 and 2) following calculation can be made:
   - Path 1 is Clk-Q-Inverter-And-D and Path 2 is Clk-Q-And-D:
	- =>T<sub>clk</sub> > T<sub>c-q</sub> + T<sub>comb</sub> + T<sub>setup</sub>
 	- =>T<sub>clk</sub> > 0.5 + 1.2 + 0.5 = 2.2ns .....Path1
	- =>T<sub>clk</sub> > 0.5 + 0.7 + 0.5 = 1.7ns .....Path2
   - Now the from path with max delay minimum operating frequency can be found out.
     	- => f = 1/T<sub>clkMax</sub> = 454.5MHz
  
<img width="1080" alt="regpath.jpg" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/5180c482fd50b5d6d65a5fdf36c3b221d0fc36cd/docs/assets/images7/regpath.jpg">

-  From above diagtam we can understand different types of path in the design and how they are constrained.
   - Reg2Reg Path [Clk - D - Comb-D]   : Constrained by clock.
   - Reg2Out Path [Clk - D - Output_Comb_logic - Output_Port] : Constrained by output external delay and clock period.
   - In2Reg  Path [Input_port - Input_Comb_logic - D] : Constrained by input external delay and clock period.
   - Reg2out and In2Reg are collectively called as IO Paths.
     

**IO Constraints:**

<img width="1080" alt="ioconstr.jpg" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/bace6dab435173dde12e4499589550346fe56649/docs/assets/images7/ioconstr.jpg">

- In above image we can observe the effect of input external delay(T<sub>ip_ext</sub>) and input combinational logic delay on set-up time. Both of these delay combined should be less than [ T<sub>clk</sub> - T<sub>setup</sub> ]
- Therefore input and output logic delay should be properly adjusted as per the constraints provided.
- Generally 70% External delay and 30% Internal delay thumb rule is used. 

</details>

<details>
<summary>Labs on Timing .LIB</summary>

**Liberty file(.lib):**

<img width="1080" alt="libfile.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/e0b1abc4892d6bf127dface1561af53bfab4e645/docs/assets/day7lab/libfile.png">

-  A .lib file, short for library file, contains essential information about standard cell libraries. Standard cell libraries consist of a collection of pre-designed and characterized logic gates and flip-flops. These libraries are fundamental to the design and optimization of digital circuits.
- Contents of a .lib File:
	- Cell Definitions: Each logic gate or flip-flop in the library is defined with its logical functionality, pin descriptions, and timing information.
	- Timing Information: This section provides data on the timing behavior of the library cells. It includes details like setup time, hold time, propagation delay, transition times, and more. Timing information is crucial for performing timing analysis and optimization during the physical design process.
	- Power Consumption Data: .lib files often include power consumption information for each cell, which is essential for estimating and managing power consumption in the IC.
	- Noise and Delay Models: Some .lib files may also include models for noise and signal delay, which are critical for accurate simulation and analysis.
	- Constraints: Constraints may be defined to guide the placement and routing tools during physical design.

- The detailed explanation of the .lib file is provided below:

 1) Drive Strenght:
- Drive strength is a measure of how much load a standard cell can drive.
- Lets have an example to understand drive strength.
  
<img width="1080" alt="drive.jpg" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/e0b1abc4892d6bf127dface1561af53bfab4e645/docs/assets/images7/drive.jpg">

- In above circuit, 2 input OR gate is driving 4 other gates and we know that drive strength is a function of capacitive load of the that particular cell. So total capacitance can be calculated to observe whether driving gate can handle the load.
- Lets say the driving cell(OR Gate) here won't be able to drive the four gates then we can specify the tool to use the cell with higher driving strength which will be provided in .lib file or the below solution can be implemented :  

<img width="1080" alt="drive_sol.jpg" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/e0b1abc4892d6bf127dface1561af53bfab4e645/docs/assets/images7/drive_sol.jpg">

 2) Area, Delay and Unateness:

<img width="1080" alt="and3comp.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/e0b1abc4892d6bf127dface1561af53bfab4e645/docs/assets/day7lab/and3comp.png">

- From above image of .lib file of AND gate of three different flavours we can obsereve the area, cell leakage power, pin capacitance and many other specifications 
- We can observe that as the drive strength of cell is increases it's area and leakage power also increases. 
 
<img width="1080" alt="and_delay.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/e0b1abc4892d6bf127dface1561af53bfab4e645/docs/assets/day7lab/and_delay.png">

- lib file uses a method called look-up table for delay calculation of cell. It will provide delay for different transition time and capacitance of the cell.
- In above figure we can observe the there are two table fall transition and rise transition. Index 1 represents capacitance and index 2 represents max transition.
- Delay for all the combination of capacitance and drive strength is provided and if it is not availble tool will di interpolation between two value and will find the delay of cell. 

<img width="1080" alt="andnot_unate.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/e0b1abc4892d6bf127dface1561af53bfab4e645/docs/assets/day7lab/andnot_unate.png">
	
- Unateness refers to the concept of whether a particular input to a logic gate or flip-flop has an effect on the output only when it changes from a specific logic level to the opposite logic level (either from 0 to 1 or from 1 to 0). In other words, a unate input is sensitive to transitions in one direction.
- Positive Unate Function: A function is considered positive unate with respect to a variable if, for that variable, changing its value from 0 to 1 can only increase the value of the function.
- Example: The function F = A + B is positive unate with respect to both A and B because increasing the value of either A or B from 0 to 1 can only increase the value of F.
- Negative Unate Function: A function is considered negative unate with respect to a variable if, for that variable, changing its value from 0 to 1 can only decrease the value of the function.
- Example: The function F = A.B is negative unate with respect to both A and B because increasing the value of either A or B from 0 to 1 can only decrease the value of F.
- Non-Unate Function: A function is considered non-unate with respect to a variable if changing the value of that variable from 0 to 1 can have either increasing or decreasing effects on the function's value, depending on the context.
- Example: The function F = A ^ B is non-unate with respect to both A and B because changing the value of either A or B from 0 to 1 can either increase or decrease the value of F, depending on the current values of the variables.
- In above image we can observe the unateness information provided in .lib file for two different cell , an OR gate and an inverter cell.

 <img width="1080" alt="ff_unate.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/e0b1abc4892d6bf127dface1561af53bfab4e645/docs/assets/day7lab/ff_unate.png">
	
 - In above image we can observe the unateness information provided in .lib file for flip flop.

**DC Commands for analysing .lib file:**

- Below command is used to generate the collection of standard cell with filtered name. It will provide refence name another command get_object_name is used to get the exact name of cell.

<img width="1080" alt="dc_foreach.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/e0b1abc4892d6bf127dface1561af53bfab4e645/docs/assets/day7lab/dc_foreach.png">

- Area of three different NAND gate with different drive strength is shown in below command. Command "get_lib_attribute" with area as function can be used. 

<img width="1080" alt="dc_nand_area.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/e0b1abc4892d6bf127dface1561af53bfab4e645/docs/assets/day7lab/dc_nand_area.png">

- Functionality of the pin(output) is  obtained below. Command used is  "get_lib_attribute on library object 'pin name'". 

<img width="1080" alt="dc_nand_funct.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/e0b1abc4892d6bf127dface1561af53bfab4e645/docs/assets/day7lab/dc_nand_funct.png">

- Input and output pins of the standard cell is obtained using below command.

<img width="1080" alt="dc_nand_io.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/e0b1abc4892d6bf127dface1561af53bfab4e645/docs/assets/day7lab/dc_nand_io.png">


- Instead of executing the individual commands, a TCL script can be written to obtain the desired output. Following code will get the list of input and output pin and also display the functionality of the output pin for different standard cell. 

<img width="1080" alt="dc_script.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/e0b1abc4892d6bf127dface1561af53bfab4e645/docs/assets/day7lab/dc_script.png">

- Output:

<img width="1080" alt="dc_script_op.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/e0b1abc4892d6bf127dface1561af53bfab4e645/docs/assets/day7lab/dc_script_op.png">


</details>


## Day-8-Advanced-Constraints
<details>

<summary>Clock Modelling</summary>

**Clock Generation:**

- Crystal Oscillator: Crystal oscillators are commonly used for generating high-precision clock signals. They rely on the mechanical resonance of a quartz crystal to produce a stable and accurate clock frequency. Crystal oscillators are often used when precision is crucial, such as in microcontrollers and communication systems.
- Phase-Locked Loop (PLL): PLLs are widely used for generating clock signals with precise frequency and phase relationships. A PLL takes an input reference clock and produces an output clock that is a multiple or fraction of the reference clock. PLLs are commonly used for clock multiplication, clock division, and clock phase adjustment. 
- And other external clock source are used to generate the clockbut all of these source have inherent variations in clock period due to stochastic effects.
- These non idealities will introduce  jitter. Follwing example shows effect of jitter and skew to clock:

<p align="center">
 <img width="480" alt="jitter_skew.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/a7734602619d308663950ccedead55ef03643aec/docs/assets/day8_dsk123/jitter_skew.png">
 </p>

**Clock Jitter and skew:**

- Skew: Clock skew is the variation in the time it takes for a clock signal to reach different flip-flops, registers, or other sequential elements within a digital design. In other words, it is the difference in the arrival times of the clock signal at various points in the circuit.

<p align="center">
 <img width="480" alt="ff_diagram.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/a7734602619d308663950ccedead55ef03643aec/docs/assets/images7/ff_diagram.png">
 </p>
  
- As we can see in the picture, even though both the launch flop and capture flop are connected to same clock source there will be difference in clock arrival due to wire length and other PVT varitaion. This difference in arrival time between launch clock and arrival clock is called skew.
- This skew and jitter can be incorporated into design using following equation:
     - Max Delay   :  T<sub>clk</sub>  + T<sub>skew</sub> > T<sub>c-q</sub> + T<sub>comb</sub> + T<sub>setup</sub>        
     - Min Delay   :  T<sub>hold</sub> + T<sub>skew</sub> < T<sub>c-q</sub> + T<sub>comb</sub>				
- Based on positive and negative skew is added or subtracted.
- While doing synthesis both jitter and skew is present while post CTS jitter is present.
- Types of jitter :
   - Duty Cycle Jitter: Duty cycle jitter, also known as pulse width jitter, occurs when there are variations in the width of the clock signal's high (logic 1) or low (logic 0) states. This can lead to variations in the time a signal spends in each logic state.
   - Period Jitter: Period jitter, also called cycle-to-cycle jitter, refers to variations in the time it takes for successive clock cycles to occur. It is typically measured as the difference between the periods of consecutive clock cycles.
     
 **Clock Latency and Uncertainity:** 
- Clock Latency: Clock latency refers to the delay or time it takes for a clock signal to propagate from its source (e.g., a clock generator) to its destination (e.g., a flip-flop or register) within a digital circuit.
- Source Latency: Source latency, also known as data source latency or producer latency, refers to the delay or time it takes for data to be generated or produced at the source before it is transmitted to the network or system.
- Network Latency:  Network latency, also known as communication latency or transmission latency, refers to the delay or time it takes for data to travel through a network or communication channel from the source to its destination.
- Clock Uncertainty: Clock uncertainty, also known as clock jitter or clock skew, represents the variation or uncertainty in the arrival time of a clock signal at different sequential elements (e.g., flip-flops) within a digital circuit.
- While doing synthesis both jitter and skew is present while post CTS jitter is present.

  
</details>

<details>

<summary>Constraining using Design compiler</summary>

**Exploring Cells, Pins and Ports:**

- First synthesis is done in dc_shell using following commands:

```
> csh
> dc_shell                                        // invoking DC Shell
>> read_verilog lab8_circuit.v                            // reading the design
>> link
>> compile_ultra
>> write -f verilog -out netlist.v
>> write -f verilog -out lab1.ddc       
```

- Below is the schematic of the synthesized design:
<p align="center">
 <img width="1080" alt="l1_schem.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/c8c4b245901a4fd29de0f23ff3ccbf5dfe2aeaf0/docs/assets/day8_dsk123/l1_schem.png">
</p>
  
- Now different cells, pins and ports of design and how to get their attributes are given below:

**Cells:**

- `get_cells` is the command used to list all the standard cells present in the design.
- Following snippet will list all the cells and their corresponding library name.

```
foreach_in_collection my_cells [get_cells * -hier] {
	set my_cell_name [get_object_name $my_cells];
	set rname [get_attribute [get_cells $my_cell_name] ref_name];
	echo $my_cell_name $rname;
}
```

- Output:
<p align="center">
 <img width="540" alt="l1_get_cells1.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/c8c4b245901a4fd29de0f23ff3ccbf5dfe2aeaf0/docs/assets/day8_dsk123/l1_get_cells1.png"> 
 </p>

**Ports:**

- `get_ports` is the command used to list all the input and output ports present in the design.
- Following snippet will list all the ports and also print if they are input and output pin.

```
foreach_in_collection my_port [get_ports *] {                      
       set my_port_name [get_object_name $my_port];                
       set dir [get_attribute [get_ports $my_port_name] direction];
       echo $my_port_name $dir;                                    
}
```

- Output:
<p align="center">
   <img width="540" alt="l1_getports2.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/c8c4b245901a4fd29de0f23ff3ccbf5dfe2aeaf0/docs/assets/day8_dsk123/l1_getports2.png"> 
</p>

**Pins:**

- `get_pins` is the command used to list all the input and output pins of standard cells present in the design.
- Following snippet will list all the pins and also print if they are input and output pin.

```
foreach_in_collection my_pin [get_pins *] {  
	set pin_name [get_object_name $my_pin]; 
	set dir [get_attribute $pin_name direction];
	echo $pin_name $dir;
}
```

- Output:
<p align="center">
  <img width="540" alt="l2_getpins1.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/afa4587a852f04b04111031daeb19b1bd2a8f000/docs/assets/day8_dsk123/l2_getpins1.png">
</p>

- Another example using `get_pins` is given below where the snippet will check whether the input pin is connected to clock and print those which are clock pins.

```
foreach_in_collection my_pin [get_pins *] { 
	set pin_name [get_object_name $my_pin];               
	set dir [get_attribute $pin_name direction];          
	if { [regexp $dir in ] } {                            
		if { [get_attribute [get_pins $pin_name] clock] } {   
			echo $pin_name;                                       
} } }
``` 

- Output: 
<p align="center">
  <img width="540" alt="l2_getpins2.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/afa4587a852f04b04111031daeb19b1bd2a8f000/docs/assets/day8_dsk123/l2_getpins2.png"> 
</p>

**Creating Clock:** 

- `create_clock` is the command used to create a clock.
- Following command will create a clock with different attributes.

```
// 50% duty cylce starting with rising edge 
create_clock -name MYClk -per 10 [get_ports clk] -wave {0,5}
// 50% duty cycle starting with falling edge
create_clock -name MYClk -per 10 [get_ports clk] -wave {5,10}
// 25% duty cycle
create_clock -name MYClk -per 10 [get_ports clk] -wave {0,2.5}
```

- Following snippet will print all th clock pins and clock source they are connected to:

```
foreach_in_collection my_pin [get_pins *] {  
  set pin_name [get_object_name $my_pin];                
  set dir [get_attribute $pin_name direction];           
  if { [regexp $dir in ] } {                             
    if { [get_attribute [get_pins $pin_name] clock] } {  
      set clk [get_attribute [get_pins $pin_name] clocks];
      set clk_name [get_object_name $clk];  
      echo $pin_name $dir $clk_name;                                        
  }                                                      
 }                                                      
}    
```

- Output: 
<p align="center">
  <img width="300" alt="l3_getclk3_tcllo.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/65490cac7b610d01f0319ff60e18c45e1897d772/docs/assets/day8_dsk123/l3_getclk3_tcllo.png"> 
</p>

**Report Timing:** 

- Syntax:

```
report_timing -from startpoint -to endpoint -delay_type maxormin -cap -nets -trans
```

- Above command will generate the timing report from specified startpoint to endpoint. And we can see set-up and hold specific reports using -delay_type attribute and other constraints like capacitance, transition and fanout information will also be provided.

**Setting latency and uncertainity:**

- Before setting up the latency and uncertainity, below timing report for set-up(max) and hold(min) is generated to ease the comparison.
- For example REGB to REGC path is considered:
<p align="center">
  <img alt="l4_timingrep_before1.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/65490cac7b610d01f0319ff60e18c45e1897d772/docs/assets/day8_dsk123/l4_timingrep_before1.png" width="45%" >
&nbsp; &nbsp; &nbsp; &nbsp;
  <img alt="l4_timingrep_before2.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/65490cac7b610d01f0319ff60e18c45e1897d772/docs/assets/day8_dsk123/l4_timingrep_before2.png" width="45%">
</p>

- As expected clock network delay is given 0ns. Now add latency and uncertainity to the design using following commands:

```
set_clock_latency -source 2 [get_clocks MYClk]
set_clock_latency 1 [get_clocks MYClk]
set_clock_uncertainty -hold 0.1 [get_clocks MYClk]
set_clock_uncertainty -setup 0.5 [get_clocks MYClk]
```

- Now generate the timing report again using `report_timing -from REGB_reg/CLK -to REGC_reg/D -delay_type max` and `report_timing -from REGB_reg/CLK -to REGC_reg/D -delay_type min` .
 <p align="center">
  <img alt="l4_timrep1_max.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/ab1ed54624d3360a5b540a2a7174a45613cf84fd/docs/assets/day8_dsk123/l4_timrep1_max.png" width="45%" >
&nbsp; &nbsp; &nbsp; &nbsp;
  <img alt="l4_timrep2_min.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/ab1ed54624d3360a5b540a2a7174a45613cf84fd/docs/assets/day8_dsk123/l4_timrep2_min.png" width="45%">
</p> 

- From above report we can observe the following:
   - Set-up: Slack decreased from 9.55 to 9.05.
   - Hold  : Slack decreased from 0.38 to 0.29.

**Constraining the IO:**

*Setting Up Input Delay:*
- Below commands are used to set input delay:

```
set_input_delay -max 5 -clock [get_clock MYCLK] [get_ports IN_A]
set_input_delay -max 5 -clock [get_clock MYCLK] [get_ports IN_B]
set_input_delay -min 1 -clock [get_clock MYClk] [get_ports IN_A]
set_input_delay -min 1 -clock [get_clock MYClk] [get_ports IN_B]
```

- Since there are two inputs constrain both of these input 'IN_A' and 'IN_B' separately for max and min.
- Now generate the timing report using `report_timing -from IN_A -transition_time -capacitance -nets -delay_type max`  and `report_timing -from IN_A -transition_time -capacitance -nets -delay_type min`. 
 <p align="center">
  <img alt="l5_timrep2_max.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/ab1ed54624d3360a5b540a2a7174a45613cf84fd/docs/assets/day8_dsk123/l5_timrep2_max.png" width="45%" >
&nbsp; &nbsp; &nbsp; &nbsp;
  <img alt="l5_timrep2_min.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/ab1ed54624d3360a5b540a2a7174a45613cf84fd/docs/assets/day8_dsk123/l5_timrep2_min.png" width="45%">
</p> 

- If we were to generate the timing report without constraining the input delay tool will tell us that the path is 'un-constrained' but now we can see the timing report and we can see the effect of that constraint is added under `input external delay` 

*Setting Up Input Transition:*
- Below are the commands used to set up input transition:

```
set_input_transition -max 0.3 [get_ports IN_A]
set_input_transition -max 0.3 [get_ports IN_B]
set_input_transition -min 0.1 [get_ports IN_B]
set_input_transition -min 0.1 [get_ports IN_A]
```

- Now generate the timing report using same commands previously used i.e `report_timing -from IN_A -transition_time -capacitance -nets -delay_type max`  and `report_timing -from IN_A -transition_time -capacitance -nets -delay_type min`.
 <p align="center">
  <img alt="l5_timrep3_max.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/ab1ed54624d3360a5b540a2a7174a45613cf84fd/docs/assets/day8_dsk123/l5_timrep3_max.png" width="45%" >
&nbsp; &nbsp; &nbsp; &nbsp;
  <img alt="l5_timrep3_min.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/ab1ed54624d3360a5b540a2a7174a45613cf84fd/docs/assets/day8_dsk123/l5_timrep3_min.png" width="45%">
</p> 

- From above timing report we can see the effect of this under `IN_A (in)` and  we can observe the following:
   - Set-up: Slack decreased from 4.19 to 4.08.
   - Hold  : Slack improved  from 0.99 to 1.02.

*Setting Up Output Delay:*
- Below are the commands used to set up output delay:

```
set_output_delay -max 5 -clock [get_clock MYClk] [get_ports OUT_Y]
set_output_delay -min 1 -clock [get_clock MYClk] [get_ports OUT_Y]

```

- Now generate the timing report using  commands  `report_timing -to OUT_Y -transition_time -capacitance -nets -delay_type max`  and `report_timing -to OUT_Y -transition_time -capacitance -nets -delay_type min`.
<p align="center">
  <img alt="l5_timrep4_max.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/ab1ed54624d3360a5b540a2a7174a45613cf84fd/docs/assets/day8_dsk123/l5_timrep4_max.png" width="45%" >
&nbsp; &nbsp; &nbsp; &nbsp;
  <img alt="l5_timrep4_min.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/ab1ed54624d3360a5b540a2a7174a45613cf84fd/docs/assets/day8_dsk123/l5_timrep4_min.png" width="45%">
</p> 

-  If we were to generate the timing report without constraining the output delay tool will tell us that the path is 'un-constrained' but now we can see the timing report and we can see the effect of that constraint(`output external delay`) is subtracted from required time.

*Setting Up Output Load:*

```
set_load -max 0.4 [get_ports OUT_Y]
set_load -min 0.1 [get_ports OUT_Y]
```

- We can now generate timing report and observe the effect of output load on the design.
<p align="center">
  <img alt="l5_timrep5_max.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/ab1ed54624d3360a5b540a2a7174a45613cf84fd/docs/assets/day8_dsk123/l5_timrep5_max.png" width="45%" >
&nbsp; &nbsp; &nbsp; &nbsp;
  <img alt="l5_timrep5_min.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/ab1ed54624d3360a5b540a2a7174a45613cf84fd/docs/assets/day8_dsk123/l5_timrep5_min.png" width="45%">
</p> 

- We can see the changes in `OUT_Y (net)` and there's a increase in slack for hold and decrease in slack for set-up.

*Generated Clock:*

- Generated clocks are additional clock signals created by the designer to meet the specific timing needs of different parts of the design.
- They are generated by dividing, multiplying, or modifying the primary clock signal using various clock generation circuits or modules.
- Generated clock can identified with `G` annotation under attributes.
- Follwoing is the command used to generate generated clock:

```
create_generated_clock -name MYGEN_Clk -master MYClk -source [get_ports clk] -div 1 [get_ports out_clk]
report_clocks
get_attribute [get_clocks MYGEN_Clk] is_generated
```

- Output:
<p align="center">
  <img width="300" alt="l2_gen_repclk.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/cb491fcb05afebd5526797381b2934252fe28901/docs/assets/day8_dsk123/l2_gen_repclk.png"  >
</p>

- But to inform the tool to use this generated clock as the reference clock for out_clk and constraining w.r.t generated clock use following commands to specify

```
set_clock_latency -max 1 [get_clocks MYGEN_Clk]
set_output_delay -max 5  -clock [get_clocks MYGEN_Clk] [get_ports OUT_Y]
set_output_delay -min 1  -clock [get_clocks MYGEN_Clk] [get_ports OUT_Y]
```

-Now generate the timing report using command  `report_timing -to OUT_Y -delay_type max` and `report_timing -to OUT_Y -delay_type min > gen_timrep1_min`.
<p align="center">
  <img alt="l2_gen_timrep1_max.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/cb491fcb05afebd5526797381b2934252fe28901/docs/assets/day8_dsk123/l2_gen_timrep1_max.png" width="45%" >
&nbsp; &nbsp; &nbsp; &nbsp;
  <img alt="l2_gen_timrep1_min.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/cb491fcb05afebd5526797381b2934252fe28901/docs/assets/day8_dsk123/l2_gen_timrep1_min.png" width="45%">
</p> 

- Now consider an other example with following code:

```
module lab8 circuit (input rst, input clk , input IN_A , input IN_B , output OUT_Y , output out_clk output reg out_div_clk)
reg REGA, REGB , REGC ;
always @ (posedge clk , posedge rst )
begin
	if(rst)
	begin
		REGA <= 1'b0 ;
		REGB <= 1'b0 ;
		REGC <= 1'b0 ;
		out_div_clk <= 1'b0 ;
	end
	else
	begin
		REGA= IN_A | IN_B;
		REGB<- IN_A ^ IN_B;
		REGC <= !(REGA & REGB) ;
		out_div_clk <= ~out_div_clk
	end
end

assign OUT_Y = ~REGC ;

assign out_clk = clk;

endmodule
```

- Now reset the design using `reset_design` and read the above verilog file
- Link and compile the the design.
- To add the constraints we can source the following TCL script in DC shell instead of individually defining each constraints:

```
create clock -name MYCLK -per 10 [get _ports_clk];
set _clock_latency -source 2 [get clocks MYCLK];
set_clock_latency 1 [get_clocks MYCLK]:
set_clock_uncertainty -setup 0.5 [get clocks MYCLK];
set_clock_uncertainty -hold 0.1 [get clocks MYCLK];
set_input_delay -max 5 -clock [get clocks MYCLK] [get_ports IN_ Al;
set _input_delay -max 5 -clock [get clocks MYCLK] [get_ports IN_B];
set_input-delay -min 1 -clock [get clocks MYCLK] [get_ports IN A];
set _input_delay -min 1 -clock [get clocks MYCLK] [get ports IN_B];
set_input_transition -max 0.4 [get_ports IN_A];
set_input_transition -max 0.4 [get_ports IN_B];
set_input_transition -min 0.1 [get_ports IN_A];
set_input_transition -min 0.1 [get_ports IN_B];
create_generated_clock -name MYGEN_CLK - master MYCLK -source [get_ports clk] -div 1 [<get_ports out_clk]
create_generated_clock -name MYGEN_DIV_CLK - master MYCLK -source [get_ports clk] -div 2 [<get_ports out_div_clk];
set_output_delay -max 5 -clock [get_clocks MYGEN_CLK] [get_ports OUT_Y];
set_output_delay -min 1 -clock [get_clocks MYGEN_CLK] [get_ports OUT_Y];
set_load -max 0.4 [get_ports OUT_Y];
set_load -min 0.1 [get_ports OUT_Y];
```

- Now using  `report_clocks` command we can observe the two generated clock MYGEN_CLK  which is same as source clk and MYGEN_DIV_CLK which has its frequency divided by 2.
<p></p>
<p align="center">
  <img width="300" alt="l2_gen_getports.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/df76f33eaf01cb397523a9348470a2569224d206/docs/assets/day8_dsk123/l2_gen_getports.png"  >
</p>

- This design is completely constrained.



*Virtual Clock and set_driving_cell:*
<p align="center">
  <img width="300" alt="circuit.jpg" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/19d098efca08ce3ee02aacfe29d831e1ded90bd6/docs/assets/da8_dsk4/circuit.jpg"  >
</p>

- For above design we can model the constraint using follwoing methods :
    1) Using command `set_max_latency 1.0 -from [get_ports IN_C] -to [get_ports OUT_Z]` we can model the max delay of the combinational circuit.
    2) Another way is to create a virtual clock setting input and output delay w.r.t virtual clock. Following are the commands used

1) set_driving_cell:
   
- `set_max_latency 1.0 -from [get_ports IN_C] -to [get_ports OUT_Z]` is the command used to contsrain the input and output ports.
- Before setting the latency timing report will give path is unconstrained So the after running the above command we will get following output:
- Outputs:
<p align="center">
  <img alt="l14_setmax_timrep.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/b0cb1b8c434f4685e72575c82b6fa955af5e9e64/docs/assets/da8_dsk4/l14_setmax_timrep.png" width="45%" >
&nbsp; &nbsp; &nbsp; &nbsp;
  <img alt="l14_setmax_timrep1.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/b0cb1b8c434f4685e72575c82b6fa955af5e9e64/docs/assets/da8_dsk4/l14_setmax_timrep1.png" width="45%">
</p> 

- Since design is not compiled after setting the constraints it is not optimized and it shows negative slack which means presence of violations. Now compile the design using command `compile_ultra` and below timing report(right) is generated using command `report_timing -to OUT_Z`.

  
2) Virtual clock:
   
- Vitual clock is a clock created without a clock defination point.
- To contrain the IO using this method following commands are used:

```
// for virtual clock there's no clock defination and latency
create_clock -name MY_VClk -period -5
set_output_delay -max 2.5 -clock MY_VClk [get_ports OUT_Z]
set_input_delay -max 1.5 -clock MY_VClk [get_ports IN_C]
set_input_delay -max 1.5 -clock MY_VClk [get_ports IN_B]
```

- Outputs:
<p align="center">
  <img alt="l14_vclk_timrep.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/b0cb1b8c434f4685e72575c82b6fa955af5e9e64/docs/assets/da8_dsk4/l14_vclk_timrep.png" width="45%" >
&nbsp; &nbsp; &nbsp; &nbsp;
  <img alt="l14_vclk_timrep1.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/b0cb1b8c434f4685e72575c82b6fa955af5e9e64/docs/assets/da8_dsk4/l14_vclk_timrep1.png" width="45%">
</p> 

- In generate the timing report(left one) using `report_timing -from IN_d -to OUT_Z ` as expected without optimization it has resulted in violation.
- To get rid of violtion compile the design again using command `compile_ultra` and generate the timing report again. From timinng report one the right side we can observe that tool has optimized the design to '0' slack.



*Special case:*

- Lets consider case where there are two flops on input/output of top level and one of the flop has active low clock i.e it's sensitive clock edge is falling edge.
- To constrain this design we have specify the tool that delay is w.r.t to falling edge of the clock and it can be done using following command:

```
set_input_delay -max 3 -clock clk -clock_fall -add [get_ports IN_A]
set_output_delay -max 3 -clock clk -clock_fall -add [get_ports OUT_Y]
// -clock will specify the falling edge
// -add will make sure previously set input delay is not overwritten
```

*set_driving_cell:*

- While set_input_transition is used for top level primary design when the interface specifications are provided(IO ports of the chip).
- But when we are working inside the design if we know the cell driving the input pin then `set_driving_cell` will make more sense and provide better accuracy.
- Following is the syntax to use the command:
- `set_driving_cell -lib_cell nameoflibcell [all_inputs]` 



</details>
