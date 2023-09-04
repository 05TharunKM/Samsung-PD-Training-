
# Samsung-PD-Training
This github repository summarizes the progress made in the samsung PD training. Quick links:

- [Day-0-Tool-Setup-Check](#Day-0-Tool-Setup-Check)
- [Day-1-Introduction-to-Verilog-RTL-design-and-Synthesis](#Day-1-Introduction-to-Verilog-RTL-design-and-Synthesis)
- [Day-2-Timing-libs-hierarchical-vs-flat-synthesis-and-efficient-flop-coding-styles](#Day-2-Timing-libs-hierarchical-vs-flat-synthesis-and-efficient-flop-coding-styles)
- [Day-3-Combinational-and-sequential-optimizations](#Day-3-Combinational-and-sequential-optimizations)
- [Day-4-GLS-Blocking-vs-Non-blocking-and-Synthesis-Simulation-mismatch](#Day-4-GLS-Blocking-vs-Non-blocking-and-Synthesis-Simulation-mismatch)
- [Day-5-DFT](#Day-5-DFT)
- [Day-6-Introduction-to-logic-synthesis](#Day-6-Introduction-to-logic-synthesis)

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

- Example5: Executing tcl script from dc_shell

File:
<img width="1080" alt="tcl_file.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/55bce0aa4702736b10b68c28a48c8c01b38fc46f/docs/assets/Image5/tcl_file.png">

Output:
<img width="1080" alt="tcl_fileop.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/55bce0aa4702736b10b68c28a48c8c01b38fc46f/docs/assets/Image5/tcl_fileop.png">

</details>
