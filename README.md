
# Samsung-PD-Training
This github repository summarizes the progress made in the samsung PD training. Quick links:

- [Day-0-Tool-Setup-Check](#Day-0-Tool-Setup-Check)
- [Day-1-Introduction-to-Verilog-RTL-design-and-Synthesis](#Day-1-Introduction-to-Verilog-RTL-design-and-Synthesis)
- [Day-2-Timing-libs-hierarchical-vs-flat-synthesis-and-efficient-flop-coding-styles](#Day-2-Timing-libs-hierarchical-vs-flat-synthesis-and-efficient-flop-coding-styles)
- [Day-3-Combinational-and-sequential-optimizations](#Day-3-Combinational-and-sequential-optimizations)
- [Day-4-GLS-Blocking-vs-Non-blocking-and-Synthesis-Simulation-mismatch](#Day-4-GLS-Blocking-vs-Non-blocking-and-Synthesis-Simulation-mismatch)

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


  
**Why GLS?**:<br />
We perform this to verify logical correctness of the design after synthesizing it. Also ensuring the timing of the design is met.
</details>
<details>
<Summary>Lab on GLS and Simulation-Synthesis Mismatch</Summary>
</details>
<details>
<Summary>Lab on Simulation-Synthesis Mismatch for Blocking Statements</Summary>
	
</details>
