
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
- [Day-9-Optimizations](#Day-9-Optimizations)
- [Day-10-QOR](#Day-10-QOR)
- [Day-11-Intro-to-BabySoC](#Day-11-Intro-to-BabySoC)
- [Day-12-BabySoC-Modelling](#Day-12-BabySoC-Modelling)
- [Day-13-Post-synthesis-simulation](#Day-13-Post-synthesis-simulation)
- [Day-14-Synopsys-DC-and-timing-analysis](#Day-14-Synopsys-DC-and-timing-analysis)
- [Day-15-Inception-of-EDA-and-PDK](#Day-15-Inception-of-EDA-and-PDK)

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


## Day-9-Optimizations

<details>

<summary>Combinational Optimizations</summary>
	
	
**What are the optimization goals?**
* Cost function based optimizations
	+ Optimization till the cost is met
	+ Over optimization of one goal will harm other goals 
	+ Goals for synthesis: ensure to meet timing, area, and power.
	
**Combinational Logic Optimization:**

* Combinational logic optimization is a technique used to improve the efficiency and performance of digital circuits that consist of interconnected logic gates. The goal is to minimize the circuit's delay, power consumption, and area while maintaining the desired functionality.
* To squeeze the logic to get the most optimised design in terms of Area and Power saving

*1) Constant Propagtion:*

+ Constant propagation is a technique used in combinational logic optimization to replace variables or signals with their constant values in order to simplify the logic circuit. This helps reduce the complexity of the circuit and can lead to improved performance and reduced power consumption.
   
+ Example:-   Consider a logic circuit Y = (A.B + C)' and input A is hardwired to logic '0', following simplification can be made : 
    
 ```
// if A=0
// Y = ((0.B)+C)'
// Y = (0+C) = C'
 ```

+ Thus whole logic which needed two gates i.e 6 MOSFETS But now the logic is reduced to simple inverter which can be easily  built using a PMOS and an NMOS.
   
*2) Boolean logic optimization:*

+ Applying Boolean algebra rules to simplify logic expressions and reduce the number of gates needed. Following commands are used in yosys shell to perform the combinational optimization :
+ Example 1:- opt_check.v 

```
module opt_check (input a , input b , input c , output y1, output y2);
wire a1;
assign y1 = a?b:0;
assign y2 = ~((a1 & b) | c);
assign a1 = 1'b0;
endmodule
// y1 = a'.0 + a.b     = a.b                        => AND Gate
// y2 = ((a1 & b) | c)'= ((0 & b) | c)' = c'        => NOT Gate
```
+ Below is Schematic after optimization : 

<img width="1080" alt="d2_sch1.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/a9043cd93b4228dd44e358e2e89e95fd6b75d34c/docs/assets/day9/d2_sch1.png">

As per the code above, circuit is optimized to simple AND gate.
 
+ Example 2:- opt_check2.v 

```
module opt_check2 (input a , input b , output y);
	assign y = a?1:b;
endmodule
// Simplification
// y =  (a').b + a.1
// y = a'.b + a
// y = a + b        => OR gate is sufficient
```

+ Below is Schematic after optimization : 

<img width="1080" alt="d2_sch2.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/a9043cd93b4228dd44e358e2e89e95fd6b75d34c/docs/assets/day9/d2_sch2.png">

As per the code above, circuit is optimized to simple OR gate.

+ Example 3:- opt_check3.v 

```
module opt_check3 (input a , input b, input c , output y);
	assign y = a?(c?b:0):0;
endmodule
// Simplification
// y = a'.0 + a.(c'.0 + c.b)
// y = 0 + a.b.c
// y = a.b.c                => 3 input AND gate is sufficient

```

+ Below is Schematic after optimization : 

<img width="1080" alt="d2_sch3.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/a9043cd93b4228dd44e358e2e89e95fd6b75d34c/docs/assets/day9/d2_sch3.png">

As per the code above, circuit is simplified to simple 3 input AND gate.

+ Example 4:- opt_check4.v 

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

+ Below is Schematic after optimization : 

<img width="1080" alt="d2_sch4.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/a9043cd93b4228dd44e358e2e89e95fd6b75d34c/docs/assets/day9/d2_sch4.png">

As per the code above, circuit is simplified to simple XNOR gate.


*3) Resource Sharing:*

+ In physical design, resource sharing is the process of effectively  logic gates, memory components, or functional units, in order to minimize the overall size, power consumption, and complexity. 
+ The goal of resource sharing  is to minimize the number of operators and the subsequent logic in the synthesized design. This optimization is based on the principle that two similar arithmetic resources may be implemented as one single arithmetic operator if they are never used at the same time.
+  Example: y=(sel?a:c) * (sel?b:d). 

<img width="1080" alt="day9_1.jpg" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/5bf67c1f81a924268a39986c874874afd1c66f0b/docs/assets/day9/day9_1.jpg">

+ As we can see instead of using two multiplier block which take up large area and power, tool can optimize it into design with two mux and one multiplier.

**Labs:**

+ RTL code:

```
module resource_sharing_mult_check (input [3:0] a , input [3:0] b, input [3:0] c , input [3:0] d, output [7:0] y  , input sel);
   assign y = sel ? (a*b) : (c*d);
endmodule
```

+ Run1: Design is synthesized and optimized using command `compile_ultra` and following are the results:
+ Schematic: As we can see in the below schematic select line is seen in the beggining i.e from previous example we can conclude it has optimized the logic.
   
<img width="1080" alt="d2_r1sch.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/5bf67c1f81a924268a39986c874874afd1c66f0b/docs/assets/day9/d2_r1sch.png">

+ Timing and Area report:

<p align="center">
  <img alt="d2_reptime1.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/5bf67c1f81a924268a39986c874874afd1c66f0b/docs/assets/day9/d2_reptime1.png" width="45%" >
&nbsp; &nbsp; &nbsp; &nbsp;
  <img alt="d2_reparea.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/5bf67c1f81a924268a39986c874874afd1c66f0b/docs/assets/day9/d2_reparea.png" width="45%">
</p> 

+ Run2: Design is synthesized by giving different constraints and following are the results:
+ Schematic: 
   
<img width="1080" alt="d2_r2sch.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/5bf67c1f81a924268a39986c874874afd1c66f0b/docs/assets/day9/d2_r2sch.png">


+  Add Constraint `set_max_delay -from [all_inputs] -to [all_outputs] 2.5`  and compile again.
+ Timing and Area report:

<p align="center">
  <img alt="d2_reptime3.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/5bf67c1f81a924268a39986c874874afd1c66f0b/docs/assets/day9/d2_reptime3.png" width="45%" >
&nbsp; &nbsp; &nbsp; &nbsp;
  <img alt="d2_reparea3.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/5bf67c1f81a924268a39986c874874afd1c66f0b/docs/assets/day9/d2_reparea3.png" width="45%">
</p> 

+ Revert back to unoptimized state by  tightly constraining the sel path using command `set_max_delay -from sel -to [all_outputs] 0.1`.
+ Timing and Area Report:

<p align="center">
  <img alt="d2_reptime4.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/5bf67c1f81a924268a39986c874874afd1c66f0b/docs/assets/day9/d2_reptime4.png" width="45%" >
&nbsp; &nbsp; &nbsp; &nbsp;
  <img alt="d2_reparea4.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/5bf67c1f81a924268a39986c874874afd1c66f0b/docs/assets/day9/d2_reparea4.png" width="45%">
</p> 
  
+ Run3: Design is synthesized by constraining the area. command used is `set_max_area 800`.
+ Schematic:
   
<img width="1080" alt="d2_r3sch.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/5bf67c1f81a924268a39986c874874afd1c66f0b/docs/assets/day9/d2_r3sch.png">

+ Timing and Area report:

<p align="center">
  <img alt="d2_reptime5.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/5bf67c1f81a924268a39986c874874afd1c66f0b/docs/assets/day9/d2_reptime5.png" width="45%" >
&nbsp; &nbsp; &nbsp; &nbsp;
  <img alt="d2_reparea5.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/5bf67c1f81a924268a39986c874874afd1c66f0b/docs/assets/day9/d2_reparea5.png" width="45%">
</p> 


*4) Logic Sharing:*

+ In Logic Sharing if the same logic has been implemented in near-by block, instead of having an extra logic output from that nearby logic block is used.
+ As we  can see in below example, tool will optimize it to design from '1x 3-i/p AND gate', '1x 2-i/p AND gate' and '1x 2-i/p OR gate'  to design with '1x 2-i/p AND gate' and '1x 2-i/p OR gate' saving area and power.  

 <img alt="day9_2.jpg" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/14abeb8ebe33fcbf99a4787d44f63549f45bb632/docs/assets/day9/day9_2.jpg" width="1080" >


*5) Balanced Implementation vs. Preferential Implementation:*

+ In balanced implementation, all the timing paths have same latency.
+ In preferential implementation, if any path has low latency requirement it will be kept at the end and one with relaxed latency requirement can be at startpoint where latency is maximum

+ Following is the example where the path e->y is tight so logic is rearranged such that it has less number of cells to propagate.

 <img alt="day9_3.jpg" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/14abeb8ebe33fcbf99a4787d44f63549f45bb632/docs/assets/day9/day9_3.jpg">

</details>

<details>

<summary>Sequential Logic Optimisation</summary>

**Sequential Logic Optimization**
* Basic
	+ Sequential constant propagation
	+ Retiming
	+ Unused flop removal
	+ Clock gating
	
* Advanced 
	+ State optimisation
	+ Sequential logic cloning (Floor plan aware synthesis)


+ Example 1:- dff_const1.v 

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

+ Waveform : 

<img width="1080" alt="dc1wv.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/9a02b148108b4357bfdaf85ca28b8b889cb483f9/docs/assets/images3/dc1wv.png">

As we see in above image , when is reset is going from logic '1' to '0' output q is changed to '0' to '1' in next edge of clock cycle and stays the same until reset is '1' again.

+ Schematic: 

<img width="1080" alt="d2_dff1sch.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/14abeb8ebe33fcbf99a4787d44f63549f45bb632/docs/assets/day9/d2_dff1sch.png">

Thus as we see in above schematic one flip flop is enough to realize the above design.

+ Example 2:- dff_const2.v

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

+ Waveform : 

<img width="1080" alt="dc2wv.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/9a02b148108b4357bfdaf85ca28b8b889cb483f9/docs/assets/images3/dc2wv.png">

As we see in above waveform, output is always '1' irrespective of  reset or clock.

+ Schematic before optimization: 

<img width="1080" alt="d2_dff2sch_noopt1.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/14abeb8ebe33fcbf99a4787d44f63549f45bb632/docs/assets/day9/d2_dff2sch_noopt1.png">


+ Schematic after optimization: 

<img width="1080" alt="d2_dff2sch.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/14abeb8ebe33fcbf99a4787d44f63549f45bb632/docs/assets/day9/d2_dff2sch.png">

As per the waveform, output is connected to  input pulled to logic '1' .

+ Example 3:-  dff_const3.v 

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

+ Waveform : 

<img width="1080" alt="dc3wv.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/9a02b148108b4357bfdaf85ca28b8b889cb483f9/docs/assets/images3/dc3wv.png">

In this design, when the reset is going from '1' to '0' q1 will be set to '1' in next edge of clock cycle and q will be latched a data from q1. Because of Clk-Q delay(Tc-q) q is latched with '0' and will be changed to '1' in next edge of  cock cycle.

+ Schematic: 

<img width="1080" alt="d2_dff3sch.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/14abeb8ebe33fcbf99a4787d44f63549f45bb632/docs/assets/day9/d2_dff3sch.png">

Minimum of two D flip flop are required to realize the above design and further optimization is not possible.

+ Example 4:- dff_const4.v 

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

+ Waveform : 

<img width="1080" alt="dc4wv.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/9a02b148108b4357bfdaf85ca28b8b889cb483f9/docs/assets/images3/dc4wv.png">

Similar to example3 here input to first flip flop is pulled to logic '1' there form both q and q1 will be '1' all the time irrespective of clock or reset.

+ Schematic before optimization: 

<img width="1080" alt="d2_dff4sch_noopt,png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/14abeb8ebe33fcbf99a4787d44f63549f45bb632/docs/assets/day9/d2_dff4sch_noopt.png">

+ Schematic after optimization: 

<img width="1080" alt="d2_dff4sch.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/14abeb8ebe33fcbf99a4787d44f63549f45bb632/docs/assets/day9/d2_dff4sch.png">

Tool has optimized the design and synthesized it into an output directly connected to input pulled to logic '1'.


</details>

<details>

<summary>Other Optimizations</summary>

**Boundry Optimization:** 

+ Boundary optimization is a technique used while logic synthesis for proper area, timing and power optimization. Boundary optimization may result in about 5-10% of standard cell area reduction and 2-5% of timing improvement. While synthesizing a design, we have  to decide the list modules which should be boundary optimized and which should not.

*Labs:*

+ RTL Code:

```
module check_boundary (input clk , input res , input [3:0] val_in , output reg [3:0] val_out);
wire en;
internal_module u_im (.clk(clk) , .res(res) , .cnt_roll(en));
always @ (posedge clk , posedge res)
begin
	if(res)
		val_out <= 4'b0;
	else if(en)
		val_out <= val_in;	
end
endmodule
module internal_module (input clk , input res , output cnt_roll);
reg [2:0] cnt;
always @(posedge clk , posedge res)
begin
	if(res)
		cnt <= 3'b0;
	else
		cnt <= cnt + 1;
end
assign cnt_roll = (cnt == 3'b111);
endmodule
```

+ Commands to be used:

```
dc_shell> read_verilog check_boundry.v
dc_shell> link
dc_shell> compile_ultra                               => Check 1
dc_shell> reset_design 
dc_shell> read_verilog check_boundry.v
dc_shell> set_boundry_optimization u_im false 
dc_shell> compile_ultra                               => Check 2

```
+ Intially compilation is done without setting boundry optimization true and as expected desigm will contain the u_im module which is a internal module to which boundry optimization is set to false.
+ Following is the schematic of the same:

 <img width="1080" alt="d4_cb_nopt.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/8f7bb06fc0b0c91aa840c75f3884f3234f699770/docs/assets/day9/d4_cb_nopt.png">

+ We can also check the cells present in the design using `get_cells *` command and check of u_im module

 <img width="1080" alt="d4_cb_nopt_cells.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/8f7bb06fc0b0c91aa840c75f3884f3234f699770/docs/assets/day9/d4_cb_nopt_cells.png">

+ Now set the boundry optimization to true for u_im module  using command ` set_boundry_optimization u_im true` and perform the compilation again ('compile_ultra`).
+ As expected u_im module now has been absorbed into the design and also optimzed further.
+ Following the schematic:

 <img width="1080" alt="d4_cb_opt.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/8f7bb06fc0b0c91aa840c75f3884f3234f699770/docs/assets/day9/d4_cb_opt.png">

+ Now if we check with `get_cells *` no sub modules should be found and all the cells should be on same heirarchy.

 <img width="1080" alt="d4_cb_opt_cells.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/8f7bb06fc0b0c91aa840c75f3884f3234f699770/docs/assets/day9/d4_cb_opt_cells.png">
     
      
**Register Retiming:**

 <img width="1080" alt="day9_regretime.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/671917296b6dc9b3a53c951a4b4afe388493a7f8/docs/assets/day9/day9_regretime.png">

+ Retiming is an optimizing algorithm for improving the circuit performance. It moves registers across combo-logic without affecting the functionality of design at primary input/output ports. Registers shall be added and to or removed from the design while performing retiming. However, additional registers do not add clock latency to the design’s performance.
+ Critical paths are examined along with their non-critical adjacent paths. There shall be many non-critical paths with positive slack. The strategy is to leverage positive slack on one side of a sequential element to balance negative slack on the other. In essence, the process is
   + to perform timing analysis of the design.
   + calculate slack on registers.
   + sort the registers based on slack.
   + balance the path by moving registers backward or forward across combo-logic. New registers shall be added or existing registers shall be merged.

**Labs:*

+ RTL Code:

```
module check_reg_retime (input clk , input [3:0] a, input [3:0] b , output [7:0] c , input reset);
wire [7:0] mult;
assign mult = a * b;
reg [7:0] q1;
reg [7:0] q2;
reg [7:0] q3;
always @ (posedge clk , posedge reset)
begin
	if(reset)
	begin
		q1 <= 8'b0;
		q2 <= 8'b0;
		q3 <= 8'b0;
	end
	else
	begin
		q1 <= mult;
		q2 <= q1;
		q3 <= q2;
	end
end
assign c = q3;

endmodule
```

+ Commands to be used:

```
dc_shell> read_verilog check_reg_retime.v
dc_shell> link
dc_shell> compile
dc_shell> gui_start                       => Check 1 SCHEMATIC 
dc_shell> report_timing                   => Check 1 TIMING REPORT
dc_shell> reset_design 
dc_shell> link
// Attribute  -retime will perform register retiming optimzation
dc_shell> compile_ultra -retime           => Check 2 SCHEMATIC
dc_shell> report_timing                   => Check 2 TIMING REPORT
```

+ Before Optimization:
   + Schematic: Without optimization as expected, combinational block is retained as it is (mult_4) in beggining itself without splitting them across the register chain.

 <img width="1080" alt="d4_rrt_nopt_sch.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/671917296b6dc9b3a53c951a4b4afe388493a7f8/docs/assets/day9/d4_rrt_nopt_sch.png"> 

   + Timing Report: Slack of  -0.83 is provided from input port to one of the register input reason being single combinational block is in the beggining providing huge latency.  

<img width="1080" alt="d4_rrt_nopt_reptime1.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/671917296b6dc9b3a53c951a4b4afe388493a7f8/docs/assets/day9/d4_rrt_nopt_reptime1.png">

+ After Optimization:
   + Schematic: Now after compiling (`compile_ultra -retime`) combinational block is split between the register to balance the slack.

 <img width="1080" alt="d4_rrt_opt_sch.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/671917296b6dc9b3a53c951a4b4afe388493a7f8/docs/assets/day9/d4_rrt_opt_sch.png"> 

   + Timing Report: Slack is reduced from -0.83 to -0.06 and further optimization can reduce it to positive slack. 

<img width="1080" alt="d4_rrt_opt_reptime1.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/671917296b6dc9b3a53c951a4b4afe388493a7f8/docs/assets/day9/d4_rrt_opt_reptime1.png">

**Isolating Output Ports:**

<img width="1080" alt="day9_io.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/96e4271ab1878abd6c15743ca8e1bf1984ad9304/docs/assets/day9/day9_io.png">

+ In above example, we can see path from output to one of the combinational logic block. when this happpens whenever there's variation in output load it's effect is seen in inside the combinational logic block worsening the timimg path again.
+ To avoid this we can isolate the output ports by inserting a buffer behind the end of output port.
+ This will also improve the output path timing performance and make it less sensitive to load changes.

*Labs:*

RTL Code: 

```
module check_boundary (input clk , input res , input [3:0] val_in , output reg [3:0] val_out);
wire en;
internal_module u_im (.clk(clk) , .res(res) , .cnt_roll(en));
always @ (posedge clk , posedge res)
begin
	if(res)
		val_out <= 4'b0;
	else if(en)
		val_out <= val_in;	
end
endmodule
module internal_module (input clk , input res , output cnt_roll);
reg [2:0] cnt;

always @(posedge clk , posedge res)
begin
	if(res)
		cnt <= 3'b0;
	else
		cnt <= cnt + 1;
end
assign cnt_roll = (cnt == 3'b111);
endmodule
```

+ Commands to be used:  

```
dc_shell> read_verilog check_boundry.v
dc_shell> link
dc_shell> compile_ultra
// Constraining the Design
dc_shell> create_clock -per 5 -name myclk [get_ports clk]
dc_shell> set_input_delay -max 2 [all_inputs] -clock myclk
dc_shell> set_output_delay -max 2 [all_outputs] -clock myclk
dc_shell> set_load -max 0.3 [all_outputs] 
dc_shell> report_timing -nosplit -inp -cap -trans -to val_out_reg[0]/D                    => CHECK 1
dc_shell> set_isolate_ports -type buffer [all_outputs]
dc_shell> compile_ultra
dc_shell> report_timing -nosplit -inp -cap -trans -from val_out_reg[1]/Q                  => CHECK 2
```

+ Before isolating the ports:
   + Timing Report : Slack of 0.91 is provided but presence of load (0.3pF) is providing huge increment of 2.09.

<img width="1080" alt="d4_iop_nopt_timrep.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/96e4271ab1878abd6c15743ca8e1bf1984ad9304/docs/assets/day9/d4_iop_nopt_timrep.png">

   + Schematic : We can see the direct connection to intermediate combinational logic block and flops to output ports. 

<img width="1080" alt="d4_iop_nopt_sch.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/96e4271ab1878abd6c15743ca8e1bf1984ad9304/docs/assets/day9/d4_iop_nopt_sch.png">

+ After isolating the ports:
   + Timing Report : Slack has improved from 0.91 to 1.61 and we can see the buffers inserted.

<img width="1080" alt="d4_iop_nopt_timrep3.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/96e4271ab1878abd6c15743ca8e1bf1984ad9304/docs/assets/day9/d4_iop_nopt_timrep3.png">

   + Schematic : Now the 4 buffers (U38,U39,U40,U41) are added at the output stage as it is a 4 bit signal. 

<img width="1080" alt="d4_iop_opt_sch.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/96e4271ab1878abd6c15743ca8e1bf1984ad9304/docs/assets/day9/d4_iop_opt_sch.png">
     

**MultiCycle Path:**

+ A Multi-Cycle Path (MCP) is a flop-to-flop path, where the combinational logic delay in between the flops is permissible to take more than one clock cycle. Sometimes timing paths with large delays are designed such that they are permitted multiple cycles to propagate from source to destination. Unlike false paths, multicycle paths are valid and must be analyzed, but against more than one clock period.
+ By default (without any MCP constraint), setup checks are measured from the source clock edge to the destination’s next clock edge and hold checks are measured from the source clock edge to the destination’s same clock edge. In other words, we can also say hold timing analysis is performed in the same clock period where setup timing is performed.

*Labs:*

+ RTL Code:

```
module mcp_check (input clk , input res  , input [7:0] a , input [7:0] b, input en , output reg [15:0] prod);
reg valid; 
always @ (posedge clk , posedge res)
begin
	if(res)
		valid <= 1'b0;
	else 
		valid <= en;
end
always @ (posedge clk , posedge res)
begin
	if(res)
		prod <= 16'b0;
	else if (valid)
		prod <= a * b;
end
endmodule
```

+ Commands used:

```
dc_shell> read_verilog mcp_check.v
dc_shell> link
dc_shell> compile_ultra
dc_shell> report_timing                                                                              => CHECK 1 TIMING REPORT (Set-Up)
dc_shell> report_timing -delay_type min                                                              => CHECK 2 TIMING REPORT (Hold)
dc_shell> set_multicycle_path -setup 2 -from [all_inputs] -to prod_reg[*]/D
dc_shell> report_timing -from [all_inputs] -to prod_reg[*]/D > d4_mcp_opt_timrep_mcp                 => CHECK 3 TIMING REPORT (Set-Up)
dc_shell> set_multicycle_path -hold 1 -from [all_inputs] -to prod_reg[*]/D
dc_shell> report_timing -delay_type min -to prod_reg[*]/D -from [all_inputs]                         => CHECK 4 TIMING REPORT (Hold)
```

+ Before setting multicylce path: 
  + Set-up and Hold Timing Report :

 <p align="center">
  <img alt="d4_mcp_nopt_timrep1.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/96e4271ab1878abd6c15743ca8e1bf1984ad9304/docs/assets/day9/d4_mcp_nopt_timrep1.png" width="45%" >
&nbsp; &nbsp; &nbsp; &nbsp;
  <img alt="d4_mcp_opt_timrep_min.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/96e4271ab1878abd6c15743ca8e1bf1984ad9304/docs/assets/day9/d4_mcp_opt_timrep_min.png" width="45%">
</p>  
 
+ After setting multicylce path:
  + Set-up and Hold Timing Report : We can see in set-up timing report, clock myclk  increment is shown as 8ns even though period is 4ns since its a multicycle path and 0ns in hold timing report as expected.

<p align="center">
  <img alt="d4_mcp_opt_timrep_mcp.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/96e4271ab1878abd6c15743ca8e1bf1984ad9304/docs/assets/day9/d4_mcp_opt_timrep_mcp.png" width="45%" >
&nbsp; &nbsp; &nbsp; &nbsp;
  <img alt="d4_mcp_opt_timrep_min2.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/96e4271ab1878abd6c15743ca8e1bf1984ad9304/docs/assets/day9/d4_mcp_opt_timrep_min2.png" width="45%">
</p> 
      
</details>


## Day-10-QOR
<details>
<summary>Introduction</summary>

**Generating Timing Report:**

Below are the different example commands to generate the timing report and thier syntax: 

+ `report_timing -from DFFA/Clk`:
   + This command will report timing with path startpoint as 'DFFA/Clk'.
   + Endpoint will be selected based on the worst slack it gives on available different paths.
   + By default  delay type is set to max.
   
+ `report_timing -from DFFA/Clk -to DFFC/D`:
   + Here both endpoint and startpoint is specified and timing report will be done between these two points.
   
+ `report_timing -fall_from DFFA/Clk`:
   + Here  '-fall_from' is referring to the transition of the signal in DFFA/Clk  pin.
   + '-fall_from' specify the tool to select path where the signal at 'Clk' pin is transiting from '1' to '0'.

+ `report_timing -rise_from DFFA/Clk`:
   + '-rise_from' specify the tool to select path where the signal at 'Clk' pin is transiting from '0' to '1'.

+ `report_timing -delay_type min -to DFFA/Clk`:
   + By default  delay type is set to max to change the delay type use attribute '-delay_type'.  
 
+ `report_timing -delay_type min -through DFFA/Clk`:
   + This command will report the path with worst slack which is passing through 'DFFA/Clk'.  
 
+ `report_timing -delay_type max -through DFFA/Clk`:
   + Similar to previous command with delay type set  to max.

+ `report_timing -rise_from DFFA/Clk -delay_type max  -nets -cap -trans`:
   + '-nets' will give fanout at different nets available.
   + '-cap' will give load capacitance available on the different pin.
   + '-trans' provides info regarding transition time.

**Propagation Delay:**

+ Propagation delay in VLSI is normally described as the time difference between when the transitional input reaches 50% of its final value and when the output reaches 50% of its final value.
+ Lets take an example of inverter to understand the propagation delay concept:

  <img alt="prop.jpg" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/70770a7655bfcfbf51a4a790ac23313c86486206/docs/assets/day10_p1/prop.jpg" width="1080" >
 
+ In this we can observe that T<sub>HL</sub> and T<sub>LH</sub> are not same so to calculate the total propagation delay average of two are taken.

+ Following example elaborate why rise delay and fall delay are not same:

 <img alt="pdnpun.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/70770a7655bfcfbf51a4a790ac23313c86486206/docs/assets/day10_p1/pdnpun.png" width="1080" >


+ Any CMOS Circuit comprises of PUN(pull up network) and PDN(pull down network) as shown in above image.
+ For example in inverter, when input goes from 0 -> 1 nmos(PDN) is active and input goes from 1-> 0 pmos(PUN) is active.
+ nmos and pmos cannot have same delay therefore rise delay and fall delay will obviously be different.


**Timing Paths:**

+ Consider the below circuit and their timing information are given in right:

 <img alt="timpath.jpg" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/70770a7655bfcfbf51a4a790ac23313c86486206/docs/assets/day10_p1/timpath.jpg" width="1080" >

+ Lets calculate arrival time for each path with different input signal cases:
+ Case 1 : Rising input signal at DFFA            ----------- PATH ACR
   + `At = 0.5 + 0.5 + 0.65 = 1.65ns` 
+ Case 2 : Falling input signal at DFFA           ----------- PATH ACF
   + `At = 0.4 + 0.4 + 0.7 = 1.5ns`
+ Case 3 : Rising input signal at DFFB            ----------- PATH BCR
   + `At = 0.5 + 0.65  = 1.15ns`
+ Case 4 : Falling input signal at DFFB           ----------- PATH BCF
   + `At = 0.5 + 0.65  = 1ns`
+ Now lets consider different arguments for timing report commands (`report_timing -args`) and analyse which path will be reported.
+ `-delay_type min -to DFFC/D` will report path BCF because its providing minimum delay(At-Arrival Time).
+ `-delay_type max -to DFFC/D` will report path ACR because its providing maximum delay.
+ `-delay_type min -rise_to DFFC/D ` will report path BCR.
+ `-delay_type max -rise_to DFFC/D ` will report path ACF.
+ `-delay_type min -fall_to DFFC/D ` will report path BCF.
+ `-delay_type max -fall_to DFFC/D ` will report path ACR.

**Max path and nworst:**

  <img alt="mnworst.jpg" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/70770a7655bfcfbf51a4a790ac23313c86486206/docs/assets/day10_p1/mnworst.jpg" width="1080" >

+ As per above schematic max_paths and nworst attributes are explored below:
+ Command `report_timing` without any arguments will report the timing for path with WNS(worst negative slack) i.e path 4.
+ Command `report_timing -max_paths 2` will report timing for path 2 and 4 because it will consider path with WNS per endpoint.
+ Command `report_timing -nworst 2` will report timing for path 3 and 4 since those are the two path with WNS.   
 
</details>

<details>
<summary>Labs</summary>

**Lab 1:**

*Example 1:*

+ Behavioural description :

```
module lab8_circuit (input rst, input clk , input IN_A , input IN_B , output OUT_Y , output out_clk , output reg out_div_clk);
reg REGA , REGB , REGC ; 
always @ (posedge clk , posedge rst)
begin
	if(rst)
	begin
		REGA <= 1'b0;
		REGB <= 1'b0;
		REGC <= 1'b0;
		out_div_clk <= 1'b0;
	end
	else
	begin
		REGA <= IN_A | IN_B;
		REGB <= IN_A ^ IN_B;
		REGC <= !(REGA & REGB);
		out_div_clk <= ~out_div_clk; 
	end
end
assign OUT_Y = ~REGC;
assign out_clk = clk;
endmodule
```
+ Different paths in designs are given below:

  <img alt="lab8.jpg" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/3951f8d6f3d036ad8424a6dcb5598bc97cd28a3e/docs/assets/day10_p1/lab8.jpg" width="1080" >
  
+ Read the above deisgn, link and compile the same and generate timing reports.
+ Timing report1: command used `report_timing -sig 4 -nosplit -trans -cap -nets -inp -from IN_A`

  <img alt="d10_reptime1.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/3951f8d6f3d036ad8424a6dcb5598bc97cd28a3e/docs/assets/day10_p1/d10_reptime1.png" width="1080" >

+ In this report path A1 is reported because out of two paths from 'IN_A'   path A1 has the least slack value.
+ Timing report2: command used `report_timing -sig 4 -nosplit -trans -cap -nets -inp -rise_from IN_A`

  <img alt="d10_reptime2.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/3951f8d6f3d036ad8424a6dcb5598bc97cd28a3e/docs/assets/day10_p1/d10_reptime2.png" width="1080" >

+ In this report path A2 is reported.
+ We can observe the rise and fall of the signal in the report annotated  in 'r' and 'f'.
+ Cell U16 is nor gate which has negative unateness, we can observe the transition changing from rise 'r' to fall 'f'. Similarly U15 an inverter which also has a negative unate. 
+ Timing report3: command used `report_timing -sig 4 -nosplit -trans -cap -nets -inp -rise_from IN_A -to REGA_reg/D`

  <img alt="d10_reptime3.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/3951f8d6f3d036ad8424a6dcb5598bc97cd28a3e/docs/assets/day10_p1/d10_reptime3.png" width="1080" >

+ Similar to previous report path A1 is reported but endpoint is forced to 'REGA_reg/D' and input signal has rising transtion(0->1).
+ Timing report4: command used `report_timing -sig 4 -nosplit -trans -cap -nets -inp -fall_from IN_A -to REGA_reg/D -delay_type min`

  <img alt="d10_reptime4.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/3951f8d6f3d036ad8424a6dcb5598bc97cd28a3e/docs/assets/day10_p1/d10_reptime4.png" width="1080" >

+ In this report path A1 is reported with falling signal applied at startpoint and delay type of min(hold).

**Lab 2:**

*Example 1:*
+ Using same example from previous check timing issue using `check_timing` command.
+ Before sourcing the constraints:

 <img alt="d10_checktime.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/3951f8d6f3d036ad8424a6dcb5598bc97cd28a3e/docs/assets/day10_p2/d10_checktime.png" width="1080" >

+ After Sourcing the constraints:

 <img alt="d10_checktime2.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/3951f8d6f3d036ad8424a6dcb5598bc97cd28a3e/docs/assets/day10_p2/d10_checktime2.png" width="1080" >
 
*Example 2:  *
+ Behavioural code:

```
module mux_generate (input [127:0] in , input [6:0] sel  , output reg y);
//wire [3:0] i_int;
//assign i_int = {i3,i2,i1,i0};
integer k;
always @ (*)
begin
for(k = 0; k < 127; k=k+1) begin
	if(k == sel)
		y = in[k];
end
end
endmodule
```

+ This is the modified 128:1 multiplexer.
+ Here as per code pin 'sel' will be connected to multiple cells to optimize this compile the design. and generate the timing and constraint reports.
+ Timing report 1 :

 <img alt="d10_reptime02.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/3951f8d6f3d036ad8424a6dcb5598bc97cd28a3e/docs/assets/day10_p2/d10_reptime02.png" width="1080" >

+ In this report we can see the huge fanout from pin 'sel' and its effect on the timing performance of the design. We can also see the huge capacitance of >300pF on sel pins.
+ Now set the max delay and capacitance using `set_max_delay -from [all_inputs] -to [all_outputs] 3.5 ` and `set_max_capacitance 0.025 [current_design]`. Compile the design to update the new constraints
+ Timing report 2 :

<p align="center">
  <img alt="d10_reptime04_p1.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/3951f8d6f3d036ad8424a6dcb5598bc97cd28a3e/docs/assets/day10_p2/d10_reptime04_p1.png" width="45%" >
&nbsp; &nbsp; &nbsp; &nbsp;
  <img alt="d10_reptime04_p2.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/3951f8d6f3d036ad8424a6dcb5598bc97cd28a3e/docs/assets/day10_p2/d10_reptime04_p2.png" width="45%">
</p> 

+ Now after setting the constraints and recompiling the design fanout at pin 'sel' has decreased to 6 and capacitive load has decreased lower than 0.025pF.
+ Constraint report before(left) and after(afer) setting the max capacitance:

<p align="center">
  <img alt="d10_repcon01.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/3951f8d6f3d036ad8424a6dcb5598bc97cd28a3e/docs/assets/day10_p2/d10_repcon01.png" width="45%" >
&nbsp; &nbsp; &nbsp; &nbsp;
  <img alt="d10_repcon02.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/3951f8d6f3d036ad8424a6dcb5598bc97cd28a3e/docs/assets/day10_p2/d10_repcon02.png" width="45%">
</p> 

+ We can observe multiple max cap violations before setting the max capacitance and after its slack has become '0' i.e no violations.

*Example 3:*
+ Behavioural code:

```
module en_128 (input [127:0] x , output [127:0] y , input en);
	assign y[127:0] = en ?x[127:0]:128'b0;
endmodule
```

+ In this design we can observe that every single outputs need some logic decision from pin 'en' thus increasing its fanout and load.
+ Timing Report 1:

  <img alt="d10_reptime05.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/3951f8d6f3d036ad8424a6dcb5598bc97cd28a3e/docs/assets/day10_p2/d10_reptime05.png" width="1080" >

+ We can observe the fanout , capacitance and transtion time of pin 'en' which are huge and are difficult to deal while designing.
+ To avoid these huge fanout and insert buffers between use  `set_max_capacitance 0.03 [current_design]` command and recompile the design so that tool can optimize it again.
+ Generate the .ddc file and push to design vision to view the schematic :

  <img alt="d10_sch01.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/3951f8d6f3d036ad8424a6dcb5598bc97cd28a3e/docs/assets/day10_p2/d10_sch01.png" width="1080" >
  
+ Timing Report 2 :
  
  <img alt="d10_reptime07_after.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/3951f8d6f3d036ad8424a6dcb5598bc97cd28a3e/docs/assets/day10_p2/d10_reptime07_after.png" width="1080" > 

+ We can see that fanout has reduced to 17 now and intermedeiate buffers has been added.
+ But transition time is still high and it can be reduced using command `set_max_transition 0.150 [current_design]`
+ Timing Report 3 :
 
<img alt="d10_reptime08.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/3951f8d6f3d036ad8424a6dcb5598bc97cd28a3e/docs/assets/day10_p2/d10_reptime08.png" width="1080" > 

+ Constraint report before and after setting max trans value: 

<p align="center">
  <img alt="d10_repcon03.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/3951f8d6f3d036ad8424a6dcb5598bc97cd28a3e/docs/assets/day10_p2/d10_repcon03.png" width="45%" >
&nbsp; &nbsp; &nbsp; &nbsp;
  <img alt="d10_repcon04.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/3951f8d6f3d036ad8424a6dcb5598bc97cd28a3e/docs/assets/day10_p2/d10_repcon04.png" width="45%">
</p> 

</details>

## Day-11-Intro-to-BabySoC

<details>

<summary>SOC</summary>

**Introduction:**
+ A System-on-Chip (SoC) is a specialized integrated circuit (IC) that combines various components and functionalities of a computer or electronic system into a single chip. SoCs are widely used in a diverse range of applications, from smartphones and tablets to embedded systems and IoT devices. 

**Components of a SoC:**
+ A typical SoC includes several key components, which may vary depending on the specific application. Common components found in SoCs include:
  + Central Processing Unit (CPU): The CPU is the brain of the SoC, responsible for executing instructions and performing computations.
  + Memory: SoCs may include various types of memory, such as RAM (Random Access Memory) and ROM (Read-Only Memory), to store data and code.
  + Input/Output Interfaces: SoCs feature interfaces for connecting to external devices, such as USB ports, HDMI, and Ethernet.
  + Graphics Processing Unit (GPU): Many SoCs include a GPU for handling graphical tasks and rendering.
  + Connectivity: Wireless connectivity modules like Wi-Fi, Bluetooth, and cellular modems are often integrated into SoCs.
  + Peripherals: SoCs may include various peripherals like sensors, timers, and analog-to-digital converters (ADCs).
  + Security: Security features like encryption engines and secure boot mechanisms are critical in modern SoCs.
  + Power Management: SoCs incorporate power management units to optimize energy consumption.

**Applications of SoCs:**
+ SoCs find applications in a wide range of industries and devices, including:
  + Mobile Devices: SoCs power smartphones, tablets, and wearables, providing computing power and connectivity.
  + IoT (Internet of Things): SoCs enable IoT devices to gather data, process it locally, and communicate with other devices or the cloud.
  + Automotive: SoCs are used in automotive systems for infotainment, driver assistance, and engine control.
  + Consumer Electronics: Smart TVs, set-top boxes, and gaming consoles utilize SoCs for multimedia and connectivity.
  + Industrial Automation: SoCs are employed in industrial controllers, PLCs (Programmable Logic Controllers), and robotics.
  + Medical Devices: SoCs power medical imaging devices, patient monitors, and diagnostic equipment.

**About Qualcomm Snapdragon 662:**
+ The Qualcomm Snapdragon 662 is a lower mid-range ARM-based SoC largely found in Android tablets and smartphones.
+ It features 8 Kryo 260 cores  that are divided in two clusters. A fast cluster of four cores with up to 2 GHz and a power saving efficiency cluster with up to 1.8 GHz. Both clusters can also be used together.
+ In addition to the 8 CPU cores, the SoC integrates a mid range Adreno 610 GPU with a LPDDR4 memory controller  and supports Wi-Fi , Bluetooth 5, and LTE.

</details>




## Day-12-BabySoC-Modelling
<details>
<summary>Task</summary>

**Ring Counter:**

+ A ring counter is a typical application of the Shift register. The ring counter is almost the same as the shift counter. The only change is that the output of the last flip-flop is connected to the input of the first flip-flop in the case of the ring counter but in the case of the shift register it is taken as output. Except for this, all the other things are the same.
+ Commands used:

```
iverilog ringconter.v ringcounter_tb.v -o op.out    // Generating the executable
./op.out                                            // Executing
gtkwave ringcounter_tb.vcd                          // Pushing VCD to gtkwave  
```

+ Verilog Code:

<p align="center">
  <img width="400" alt="day11_taskcode.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/030818dc4c5439ffc102c5d711ef18fa8db58723/docs/assets/day11_p1/day11_taskcode.png"  >
</p>

+ Test Bench:

<p align="center">
  <img width="400" alt="day11_tasktb.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/030818dc4c5439ffc102c5d711ef18fa8db58723/docs/assets/day11_p1/day11_tasktb.png"  >
</p>

+ Waveform:

<p align="center">
  <img width="1080" alt="day11_taskwv.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/030818dc4c5439ffc102c5d711ef18fa8db58723/docs/assets/day11_p1/day11_taskwv.png"  >
</p>


</details>

<details>
<summary>VSD BabySoC</summary>

**RISC v/s CISC:**

| RISC | CISC |
| --------------------- | ---------------------|
| Fixed sized instructions | Variable sized instructions |
| Can perform only Register to Register Arithmetic operations | Can perform REG to REG or REG to MEM or MEM to MEM |
| Requires more number of registers | Requires less number of registers |
| Code size is large | Code size is small |
| An instruction executed in a single clock cycle | Instruction takes more than one clock cycle |
| An instruction fit in one word | Instructions are larger than the size of one word |
| Simple and limited addressing modes | Complex and more addressing modes |
| RISC is Reduced Instruction Cycle. | CISC is Complex Instruction Cycle |
| The number of instructions are less as compared to CISC. | The number of instructions are more as compared to RISC. |
| RISC is highly pipelined.| CISC is less pipelined. |
| RISC required more RAM. | CISC required less RAM. |

**Why RISC is preferred:**
+ Simpler instructions: RISC processors use a smaller set of simple instructions, which makes them easier to decode and execute quickly. This results in faster processing times.
+ Faster execution: Because RISC processors have a simpler instruction set, they can execute instructions faster than CISC processors.
+ Lower power consumption: RISC processors consume less power than CISC processors, making them ideal for portable devices


**Modelling the RVMYTH:**
+ RVMYTH core is a simple RISCV-based CPU, introduced in a workshop by RedwoodEDA and VSD.
+ Verilog code and test bench are attached here: [verilog code](https://github.com/05TharunKM/Samsung-PD-Training-/blob/8c1e90fe54a779bd4795ac6506b2395368133314/docs/assets/day11_p1/mythcore_test.v) & [Test Bench](https://github.com/05TharunKM/Samsung-PD-Training-/blob/8c1e90fe54a779bd4795ac6506b2395368133314/docs/assets/day11_p1/tb_mythcore_test.v) 

Waveform: 

<p align="center">
  <img width="1080" alt="day11_corewv.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/030818dc4c5439ffc102c5d711ef18fa8db58723/docs/assets/day11_p1/day11_corewv.png"  >
</p>

**Modelling the DAC:**
+ A Digital to Analog Converter commonly referred as DAC, D/A or D2A is a device that converts binary values (0s and 1s) to a set of continuous analog voltages.
+ Verilog code and test bench are attached here: [verilog code](https://github.com/05TharunKM/Samsung-PD-Training-/blob/8c1e90fe54a779bd4795ac6506b2395368133314/docs/assets/day11_p1/rvmyth_avsddac.v) & [Test Bench](https://github.com/05TharunKM/Samsung-PD-Training-/blob/8c1e90fe54a779bd4795ac6506b2395368133314/docs/assets/day11_p1/rvmyth_avsddac_TB.v) 
+ The whole digital to analog conversion process is a scaling operation – the binary count is mapped to a certain voltage range, with 0V being the minimum( and the maximum voltage being the maximum input binary voltage i.e 3.3V in our case.

Waveform: 

<p align="center">
  <img width="1080" alt="day11_dacwv.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/030818dc4c5439ffc102c5d711ef18fa8db58723/docs/assets/day11_p1/day11_dacwv.png"  >
</p>

+  We can also calculate the corresponding anolog value.
+  Consider the below data:
   + Vref = 3.3V
   + N = 10
   + Digital Data = (0101111010)<sub>2</sub> = (378)<sub>10</sub>
   + Anolog Data  = (D) x (Vref) / (2<sup>N</sup> - 1)
   + Anolog Data  = (378) x (3.3) / 2<sup>10</sup> -1) = 1.219354838709677 V  

   
<p align="center">
  <img width="400" alt="day11_daccalc.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/39ee2b0ee562ea51c71bfb6cd571cbbe88915775/docs/assets/day11_p1/day11_daccalc.png" >
</p>

**Modelling the PLL:**
+ A phase-locked loop (PLL) is an electronic circuit with a voltage or voltage-driven oscillator that constantly adjusts to match the frequency of an input signal. PLLs are used to generate, stabilize, modulate, demodulate, filter or recover a signal.
+ Verilog code and test bench are attached here: [verilog code](https://github.com/05TharunKM/Samsung-PD-Training-/blob/8c1e90fe54a779bd4795ac6506b2395368133314/docs/assets/day11_p1/rvmyth_pll.v) & [Test Bench](https://github.com/05TharunKM/Samsung-PD-Training-/blob/8c1e90fe54a779bd4795ac6506b2395368133314/docs/assets/day11_p1/rvmyth_pll_tb.v) 

Block Diagram: 

<p align="center">
  <img width="650" alt="pll.jpg" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/a4fcd623dabcee0c0fae417e752e1d9bac5cf631/docs/assets/day11_p1/pll.jpg"  >
</p>

Waveform: 

<p align="center">
  <img width="1080" alt="day12_pllwv.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/030818dc4c5439ffc102c5d711ef18fa8db58723/docs/assets/day11_p1/day12_pllwv.png"  >
</p>

**Modelling the SoC:**
+ Now interconnect all the three IPs and execute  at once.
+ Verilog code and test bench are attached here: [verilog code](https://github.com/05TharunKM/Samsung-PD-Training-/blob/8c1e90fe54a779bd4795ac6506b2395368133314/docs/assets/day11_p1/vsdbabysoc.v) & [Test Bench](https://github.com/05TharunKM/Samsung-PD-Training-/blob/8c1e90fe54a779bd4795ac6506b2395368133314/docs/assets/day11_p1/testbench.v) 

Waveform: 

<p align="center">
  <img width="1080" alt="day11_finalwv.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/030818dc4c5439ffc102c5d711ef18fa8db58723/docs/assets/day11_p1/day11_finalwv.png"  >
</p>

+ Commands used:

```
iverilog design.v testbench.v -o op.out
./op.out
gtwave design_tb.vcd
```
 
</details>


## Day-13-Post-synthesis-simulation

<details>
<summary>Synthesis and Post-synth simulation </summary>
	
**Synthesis:**
+ Synthesis refers to the process of converting a high-level hardware description of a digital circuit into a gate-level representation.
+ Design is converted into gates and connection are made between the gates.
+ This is given out as file called netlist.
+ Following commands are used to carry out synthesis in DC:

```
# csh
# dc_shell
dc_shell>> read_verilog <design.v>
dc_shell>> read_db <.db files>
// set link and target library using .synopsys_dc.setup
dc_shell>> link
dc_shell>> compile_ultra
dc_shell>> write -f verilog -o <netlist>
```

**Setting up library files:**
+ .lib file is Collection of logical modules which include basic logic gates of different flavour.
+ .db is the compiled version of liberty file(.lib) since DC can't read .lib file, library compiler is used to generate the .db file from .lib file.
+ Following commands are used:

```
# lc_shell
lc_shell>> read_lib <path to .lib file>
lc_shell>> write_lib <name> -f db -o <name>.db
lc_shell>> quit
```

+ Generate the .db file for  folowing lib files:
    1)  avsdpll.lib
    2)  avsddac.lib
    3)  sky130_fd_sc_hd__tt_025C_1v80.lib
  
**Post synthesis simulation:**

+ Post synthesis simulation is a type of simulation where the netlist is simulated with orginal test bench.
+ Since the netlist is logically same as RTL code same test bench can be used.
+ *Why perform post-synth simulation:*
     + Post-synth simulation is  performed to verify logic correctness of design.
     + A synthesis simulation mismatch refers to a situation where the behavior of a design as simulated before synthesis does not match the behavior of the same design after it has been synthesized and simulated at a gate level.
     + This can happen due to multiple design:
         1) Missing sensitivity list.
         2) Blocking and Non-blocking Assignment.
         3) Non-Standard verilog coding. 

+ Following is the steps to perform post-synth simulations :

```
      Design/Netlist.v  ⬂ 
      Verilog Models.v  ⇨ Iverilog ⇨ VCD File ⇨  GTKWave/TwinWave
           TestBench.v  ⬀ 
```

+ Following are the commands used to perform the simluation after synthesis:

```
# iverilog -DFUNCTIONAL -DUNIT_DELAY=#1 <required_files>
# ./a.out
# gtkwave <filename>.vcd 
```

</details>


<details>
<summary>Task</summary>

+ RTL Code :

```
module ringcounter (clk, rst, count)
input clk, rst; output [5:0] count;
wire clk, rst;
reg [5:0] count = 6'b1;
always@(posedge clk)
  begin
  if (rst)
    begin
    count <= count << 1;
    count[0]<< count [5];
    end
   end
always@posedge rst)
 begin
  count <= 6'b1;
 end
endmodule
```

+ As we can see above code is not synthesizable and when code is read in dc_shell it will throw an error.
+ So ring counter code is modified using synthesizable constructs and following is the new RTL Code:

```
module ringcounter(clk, rst, count); 
    input clk, rst;
    output  [5:0] count;
    wire clk, rst;
    reg [5:0] count = 6'b1;  
    always @ (posedge clk, posedge rst )
        begin  
        if ( rst == 1 )  
            begin    
            count[5:0] <= { count[4:0] , count[5] };   
        end
	else 
            count <= 6'b1;
    end 
endmodule

//TestBench
`timescale 1ns / 1ps 
module ringcounter_tb(); 
    reg clk = 0, rst = 0;
    wire [5:0] count; 
    always #1 clk = !clk;
    initial begin  
    $dumpfile("task_ringc_tbB.vcd");
    $dumpvars(0,ringcounter_tb);
        #20 rst = 1;  
        #20 rst = 0;
        #20 $finish;
    end 
    ringcounter cntr01 ( .clk(clk), .rst(rst), .count(count) ); 
endmodule 
```

**Schematic after synthesis:** 

<p align="center">
  <img width="1080" alt="day14_Tasksynt_sch.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/abfa9a47717599729a17aa774fbb5e4603ade99b/docs/assets/day13_img/day14_Tasksynt_sch.png"  >
</p>

+ Since its 6 bit ring counter we can see tool has generated 6 flip-flops.
+ And as expected output is fed back into input through net 'n27'.
  
**Comparing post-synth simulation with pre-synth simulation:** 
+ Following analysis is carried out in  Twinwave and commands used is given below:
+ Command : `twinwave  presynth.vcd pre.sav + postsynth.vcd post.sav`

<p align="center">
  <img width="1080" alt="day18_tasksynt_NWF.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/4ff46f2bc4b1121b8c36ceb27f003b29a163d2d7/docs/assets/day13_img/day18_tasksynt_NWF.png"  >
</p>

+ We can see the action of ring counter matchig before(top tab) and after(bottom tab) synthesis.
+ In ring counter there are two types based on whether the bit is shifted to right or lift. In our code we have specfied left shifting using `count[5:0] <= { count[4:0] , count[5] };` since `<<` was throwing error 'non synthesizable constructs'.
 
</details>

<details>

<summary>MYTHCORE and VSDBabySoC</summary>

**MythCore:**

+ Verilog code and test bench are attached here: [verilog code](https://github.com/05TharunKM/Samsung-PD-Training-/blob/8c1e90fe54a779bd4795ac6506b2395368133314/docs/assets/day11_p1/mythcore_test.v) & [Test Bench](https://github.com/05TharunKM/Samsung-PD-Training-/blob/8c1e90fe54a779bd4795ac6506b2395368133314/docs/assets/day11_p1/tb_mythcore_test.v)
+ Following are the steps followed to do synthesis and GLS:

```
//Generate .db file in Library Compiler
lc_shell>> read_lib <path to .lib file>
lc_shell>> write_lib <name> -f db -o <name>.db
lc_shell>> quit 
//Synthesis
dc_shell>> read_verilog mythcore.v
dc_shell>> set link_library  {* <path to avsddac.db> <path to avsdpll> <path to sky130_fd_sc_hd__tt_025C_1v80.db>}
dc_shell>> set target_library  {<path to avsddac.db> <path to avsdpll> <path to sky130_fd_sc_hd__tt_025C_1v80.db>}
dc_shell>> link
dc_shell>> compile
dc_shell>> write -f verilog -o netlist_vsdbabysoc.v
// GLS with netlist

```
+ Netlist generated is provided [here](https://github.com/05TharunKM/Samsung-PD-Training-/blob/01e1de434f5698c6c7e799e7bf72b024b32b474b/docs/assets/day13_files/net2.v).
+ Schematic is provided below:

<p align="center">
  <img width="1080" alt="day13_postsynth_schem.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/01e1de434f5698c6c7e799e7bf72b024b32b474b/docs/assets/day13_img/day13_postsynth_schem.png"  >
</p>

+ while generating the executable and VCD  use following files as input for iverilog:
	1) Design/Netlist.v
	2) TestBench.v
	3) primitives.v
	4) sky130_fd_sc_hd.v
	5) avsddac.v and avsdpll.v for VSDBabySoC Simulation.      
+ If any errors appear while simulation open `sky130_fd_sc_hd.v` file and correct this statement `endif SKY130_FD_SC_HD__LPFLOW_BLEEDER_FUNCTIONAL_V ` to `endif //SKY130_FD_SC_HD__LPFLOW_BLEEDER_FUNCTIONAL_V`.
+ And if error still persist use below command to generate the executable.

```
#  iverilog -DFUNCTIONAL -DUNIT_DELAY=#1 nelistt.v tb_mythcore.v  primitives.v sky130_fd_sc_hd.v -o out1
# ./out1.out
```

+ To ease the comparision generate two seprate VCD files and save them in different name.
+ Now check for Synth-Simulation mismatch using 'twinwave' and commands used is `twinwave  presynth.vcd pre.sav + postsynth.vcd post.sav`.
  
<p align="center">
  <img width="1080" alt="day13_synthWV.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/01e1de434f5698c6c7e799e7bf72b024b32b474b/docs/assets/day13_img/day13_synthWV.png"  >
</p>

+ As we can observe in above waveforms, top tab being pre-synth waveform and bottom tab being post-synth waveform there's no Synthesis-simulation mismatch.
+ Detailed analysis of wavefrom is give in last section.

**VSDBabySoC:**
+ Verilog code and test bench are attached here: [verilog code](https://github.com/05TharunKM/Samsung-PD-Training-/blob/8c1e90fe54a779bd4795ac6506b2395368133314/docs/assets/day11_p1/vsdbabysoc.v) & [Test Bench](https://github.com/05TharunKM/Samsung-PD-Training-/blob/8c1e90fe54a779bd4795ac6506b2395368133314/docs/assets/day11_p1/testbench.v)
+ Similar to previous procedure, perform synthesis and use twinwave to compare the results.
+ Schematic :

<p align="center">
  <img width="1080" alt="day17_VSDsynt_sch.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/01e1de434f5698c6c7e799e7bf72b024b32b474b/docs/assets/day13_img/day17_VSDsynt_sch.png"  >
</p>

+ Waveform :

<p align="center">
  <img width="1080" alt="day16_VSDsynt_WF.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/01e1de434f5698c6c7e799e7bf72b024b32b474b/docs/assets/day13_img/day16_VSDsynt_WF.png"  >
</p>

+ We can see there's no Synthesis-simulation mismatch in this case and logic of netlist is same as that of RTL Code.

**Waveform Analysis:**

+ Consider following waveform of MythCore :

<p align="center">
  <img width="1080" alt="WVDetail.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/01e1de434f5698c6c7e799e7bf72b024b32b474b/docs/assets/day13_img/WVDetail.png"  >
</p>

- Following are minimum necessary pins selected to analyse the operation of core.
- There are 4 markers A,B,C and D to ease the analysis.
- `clk`: Source clock Pin.
- `reset`: Reset is intially pulled to logic '1' state where core is inactive and after 20ns it is pulled to logic '0' that's when execution starts.
- `CPU_pc_a0[31:0]`:
	+ This is program counter and it can be seen incrementing/decrementing by 4.
        + Incr/Decr of 4 because instruction is 32 bit long which means 4 Byte per instruction.
- `CPU_src1/2_value_a1/2[31:0]:`
	+ After Fetch cycle, to increment/decrement PC or for doing any ALU operation these registers are used.
 	+ These are directly connected to inputs of ALU.
- `CPU_result_a3[31:0]`:
	+ After the ALU operation this register will store the output temprorily until its outputted in port `out[9:0]`.
 	+ At marker 'A' we can see value of 1 which is previously calculated value from ALU and its being outputted at present cycle.
  	+ After two cylces(at marker A)  next output(2+1) is calculated and ouputted through `out[9:0]`  after one clock cycle.
  	+ Similarly at marker B,C and D we can observe the present output and next output being calculated after two clock cycle.
-  `out[9:0]` : This is 10-bit output of the Mythcore module.
-  This analysis is purely based on my understanding and if there are any mistake please correct me.  
</details>


## Day-14-Synopsys-DC-and-timing-analysis

<details>

<summary>PVT Concept and Timing analysis</summary>

+ In VLSI design and timing verification, PVT corners are a set of specific operating conditions or scenarios used to analyze and validate the performance and timing of a integrated circuit. PVT stands for Process, Voltage, and Temperature, which are three critical factors that can affect the behavior and performance of integrated chips.

<p align="center">
  <img alt="P_VT.jpg" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/df744b1dd201f8459ec99be52fb7a24f6bf32414/docs/assets/Day14/P_VT.jpg" width="30%" >
&nbsp; &nbsp; &nbsp; &nbsp;
  <img alt="P_V_T.jpg" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/df744b1dd201f8459ec99be52fb7a24f6bf32414/docs/assets/Day14/P_V_T.jpg" width="30%">
&nbsp; &nbsp; &nbsp; &nbsp;
  <img alt="PV_T.jpg" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/df744b1dd201f8459ec99be52fb7a24f6bf32414/docs/assets/Day14/PV_T.jpg" width="30%">	
</p> 

+ Process Corner: The process corner represents variations in the manufacturing process. Manufacturing processes can introduce variations in parameters like transistor threshold voltage, channel length, oxide thickness, and doping levels. These variations can lead to differences in the electrical characteristics of transistors. The three main process corners are:
	 + Fast Process Corner: This corner represents the best-case scenario in terms of speed and performance. It assumes that the transistors in the circuit are at the upper limits of their specified parameters, resulting in faster operation.
	 + Nominal Pocess Corner: In the nominal corner, the manufacturing process parameters are assumed to be close to their target or average values. This corner represents the typical or average behavior of the process.  
	 + Slow Process Corner: This corner represents the worst-case scenario in terms of speed and performance. It assumes that the transistors are at the lower limits of their specified parameters, resulting in slower operation.
+ Voltage Corner: The voltage corner refers to variations in the supply voltage (Vdd) applied to the integrated circuit. Operating a chip at a lower voltage can reduce power consumption but may also reduce its performance. The three main voltage corners are:
 	+ Low Voltage Corner: This corner represents the scenario where the chip is operating at the lowest allowed supply voltage. It helps evaluate the circuit's performance and timing under low-power conditions.
  	+ Nominal Voltage Corner: The supply voltage (Vdd) is set to a typical or standard value. This is the voltage at which the circuit is typically expected to operate. 
 	+ High Voltage Corner: This corner represents the scenario where the chip is operating at the highest allowed supply voltage. It helps evaluate the circuit's performance and timing under high-performance conditions.
+ Temperature Corner: The temperature corner accounts for variations in operating temperature. Temperature can impact the speed of electronic components. The three main temperature corners are:
 	+ Low Temperature Corner: This corner represents the scenario where the chip is operating at the lowest expected temperature. Lower temperatures typically result in slower operation.
  	+ Temperature: The operating temperature is set to a typical or standard value, which is usually around room temperature (25°C or 298 K). 
 	+ High Temperature Corner: This corner represents the scenario where the chip is operating at the highest expected temperature. Higher temperatures can lead to faster operation but may also introduce reliability concerns.

**Static Timing Analysis:**

+ Static timing analysis  is a method of finding the timing performance of a design by checking all the paths for timing violations.
+ STA breaks a design down into timing paths, calculates the signal propagation delay along each path, and checks for violations of timing constraints inside the design and at the input/output interface.
+ STA then checks for violations of timing constraints like set-up and hold:
    + Setup constraint specifies how much time is necessary for data to be available at the input of a sequential device before the clock edge that captures the data in the device. This constraint enforces a maximum delay on the data path relative to the clock edge.
    + Hold constraint specifies how much time is necessary for data to be stable at the input of a sequential device after the clock edge that captures the data in the device. This constraint enforces a minimum delay on the data path relative to the clock edge.

Refernces:
+ [https://www.synopsys.com/glossary/what-is-static-timing-analysis.html]


</details>


<details>
<summary>Task</summary>

+ **Synthesis for different corners:**
   + To generate the timing report for different pvt corners we need synthesize the design by providing corner specific library file(.db).
   + Following 13 are the corners provided:
        1) ff_100C_1v65
        2) ff_100C_1v95
        3) ff_n40C_1v56
        4) ff_n40C_1v76
        5) ff_n40C_1v65
        6) ss_100C_1v40
        7) ss_100C_1v60
        8) ss_n40C_1v28
        9) ss_n40C_1v35
        10) ss_n40C_1v40
        11) ss_n40C_1v76
        12) ss_n40C_1v44
        13) tt_025C_1v80
   + Naming convention breakdown :
      1)  Process : 'ff', 'ss', 'sf' and 'fs'. S-> slow and F-> Fast
      2)  Voltage : Low, typical and high voltage. Varies from 1.28 v to 1.95 V in above case.
      3)  Temperature : Low, typical and high temperature. Varies from -40<sup>o</sup>C to 100<sup>o</sup>C. 
   + To run the synthesis using .db files corresponding to above corners following method can be used :

```
# csh
# dc_shell
// Reading the vsdbabysoc file and mythcore file and set the vsdbabysoc as top module.
dc_shell >> read_file {vsdbabysoc.v mythcore_test.v} -autoread -format verilog -top vsdbabysoc
dc_shell >> set target_library {<corner_specific_db> avsddac.db avsdpll.db }
dc_shell >> set link_library {*  <corner_specific_db>  avsddac.db avsdpll.db }
// Source the constraints (provided below)
dc_shell >> source cons.tcl
// Now link and compile the design
dc_shell >> link
dc_shell >> compile_ultra
// Check  the reports and save it in a file for further analysis
dc_shell >> report_timing -delay_type min >> hold.txt
dc_shell >> report_timing -delay_type max >> setup.txt
dc_shell >> report_qor >> QOR.txt
```

   + Below is constraint file sourced before linking.

 <p align="center">
  <img width="600" alt="constraints.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/7be874f05fccfaa31df3061100cddc15ebcf2a4f/docs/assets/DAY15_files/constraints.png"  >
</p>
     
   + Now we have to run the synthesis by providing different library each time and report the timing .
   + Since this each step is time consuming it is possible to automate the process by a tcl script.

<p align="center">
  <img width="600" alt="autom.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/7be874f05fccfaa31df3061100cddc15ebcf2a4f/docs/assets/DAY15_files/autom.png"  >
</p>

   + In this script we have initaily appended every library(.db) in the directory into a list and save the name of library.
   + Later using 'for' loop,  parse this list and every time we parse it will take the different library of the list.
   + Each time design is linked and compiled for differnt libs(.db).
   + And using commands `report_qor`, `report_timing -delay_type min` and `report_timing -delay_type max` output is written into report file in the name of library.

 + Outputs for all the 13 corners are observed considering timing performance, area and cell count.
 + QoR and Timing reports are  provided below : 

**ff_100C_1v65:**

<p align="center">
  <img width="1080" alt="ff_100C_1v65%20.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/5829e1b3c0148be73e8510a6b03e49a479da5617/docs/assets/DAY15_P2/ff_100C_1v65%20.png"  >
</p>

**ff_100C_1v95:**

<p align="center">
  <img width="1080" alt="ff_100C_1v95.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/5829e1b3c0148be73e8510a6b03e49a479da5617/docs/assets/DAY15_P2/ff_100C_1v95.png"  >
</p>

**ff_n40C_1v56:**

<p align="center">
  <img width="1080" alt="ff_n40C_1v56.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/5829e1b3c0148be73e8510a6b03e49a479da5617/docs/assets/DAY15_P2/ff_n40C_1v56.png"  >
</p>

**ff_n40C_1v65:**

<p align="center">
  <img width="1080" alt="ff_n40C_1v65.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/5829e1b3c0148be73e8510a6b03e49a479da5617/docs/assets/DAY15_P2/ff_n40C_1v65.png"  >
</p>

**ff_n40C_1v76:**

<p align="center">
  <img width="1080" alt="ff_n40C_1v76.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/5829e1b3c0148be73e8510a6b03e49a479da5617/docs/assets/DAY15_P2/ff_n40C_1v76.png"  >
</p>

**ss_100C_1v40:**

<p align="center">
  <img width="1080" alt="ss_100C_1v40.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/5829e1b3c0148be73e8510a6b03e49a479da5617/docs/assets/DAY15_P2/ss_100C_1v40.png"  >
</p>

**ss_100C_1v60:**

<p align="center">
  <img width="1080" alt="ss_100C_1v60.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/5829e1b3c0148be73e8510a6b03e49a479da5617/docs/assets/DAY15_P2/ss_100C_1v60.png"  >
</p>

**ss_n40C_1v28:**

<p align="center">
  <img width="1080" alt="ss_n40C_1v28.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/5829e1b3c0148be73e8510a6b03e49a479da5617/docs/assets/DAY15_P2/ss_n40C_1v28.png"  >
</p>

**ss_n40C_1v35:**

<p align="center">
  <img width="1080" alt="ss_n40C_1v35.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/5829e1b3c0148be73e8510a6b03e49a479da5617/docs/assets/DAY15_P2/ss_n40C_1v35.png"  >
</p>

**ss_n40C_1v40:**

<p align="center">
  <img width="1080" alt="ss_n40C_1v40.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/5829e1b3c0148be73e8510a6b03e49a479da5617/docs/assets/DAY15_P2/ss_n40C_1v40.png"  >
</p>

**ss_n40C_1v44:**

<p align="center">
  <img width="1080" alt="ss_n40C_1v44.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/5829e1b3c0148be73e8510a6b03e49a479da5617/docs/assets/DAY15_P2/ss_n40C_1v44.png"  >
</p>

**ss_n40C_1v76:**

<p align="center">
  <img width="1080" alt="ss_n40C_1v76.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/5829e1b3c0148be73e8510a6b03e49a479da5617/docs/assets/DAY15_P2/ss_n40C_1v76.png"  >
</p>

**tt_025C_1v80:**

<p align="center">
  <img width="1080" alt="tt_025C_1v80.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/5829e1b3c0148be73e8510a6b03e49a479da5617/docs/assets/DAY15_P2/tt_025C_1v80.png"  >
</p>

+ Now the table of worst negative slack(WNS), worst hold slack(WHS), total negative slack(TNS) and total hold slack(THS) for all the 13 corners is created to ease the analysis and  plotting the graph. 

<p align="center">
  <img width="600" alt="PVT_VAL.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/5829e1b3c0148be73e8510a6b03e49a479da5617/docs/assets/DAY15_files/PVT_VAL.png"  >
</p>


+ To analyse the trend of this variations different graphs are plotted:

   1) How Worst negative slack varries across different corners.
 
<p align="center">
  <img width="700" alt="WNS.PNG" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/5829e1b3c0148be73e8510a6b03e49a479da5617/docs/assets/DAY15_files/WNS.PNG"  >
</p>
     
   2) How Worst hold slack varries across different corners.

<p align="center">
  <img width="700" alt="WHS.PNG" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/5829e1b3c0148be73e8510a6b03e49a479da5617/docs/assets/DAY15_files/WHS.PNG"  >
</p>

   3) How Total negative slack varries across different corners.

<p align="center">
  <img width="700" alt="TNS.PNG" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/5829e1b3c0148be73e8510a6b03e49a479da5617/docs/assets/DAY15_files/TNS.PNG"  >
</p>

   4) How Total hold slack varries across different corners.

<p align="center">
  <img width="700" alt="THS.PNG" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/5829e1b3c0148be73e8510a6b03e49a479da5617/docs/assets/DAY15_files/THS.PNG"  >
</p>

+ As we can see in above graphs, set-up violations seems to be high and hold violations are low  in fast corners.
+ There are low set-up violations and high hold violations in case of slow corners.
+ From the graph we can infer that ff_n40_1v65, ss_100c_1v40 and ss_100c_1v60 have optimum set-up and hold violations.

</details>




## Day-15-Inception-of-EDA-and-PDK

<details>
<summary>Theory</summary>

**Introduction to QFN-48 Package, chip, pads, core, die and IPs:**

+ Package : Package is the one device that has semiconductor components wire-bonded to a die. Die are housed in a package, which was wire-bonded to an external device to connect it to the outside world. Quadruple in-line packages (QIP) and dual in-line packages (DIP) are examples of packages.
+ QFN: The term "QFN" stands for "quad flat no lead package." It is a small, leadless package with a moderate capacity for heat dissipation. The purpose of a QFN packaging is to attach the IC's silicon die to the circuit board like an IC package.
+ Followings are the components inside the package:

<p align="center">
  <img alt="chip.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/675c9815954bf9390c1159ab675b6762cd53eedd/docs/assets/DAY15_X/chip.png" width="30%" >
&nbsp;
  <img alt="dpd.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/675c9815954bf9390c1159ab675b6762cd53eedd/docs/assets/DAY15_X/dpd.png" width="30%">
&nbsp;
  <img alt="ip.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/675c9815954bf9390c1159ab675b6762cd53eedd/docs/assets/DAY15_X/ip.png" width="30%">	
</p> 

   + Pad: Surface-mount pins that connect the inner core to the outside (I/O). It provides good ESD protection by preventing charges from the outside from damaging the internal core.
   + Core: The major logic gates (NMOS/PMOS) and cell blocks, such as macro cells and foundry IPs, make up the core.
   + Die: The silicon chip (IC)  which  resides inside a packaging or chip.
   + Foundry IPs: Cells with more particular functionality that are patent-protected or owned by a corporation, have a greater price than macros, and are not searchable online.
   + Macros: A protocol for data transport employing basic features

**RISC-V ISA:**
+ ISA : 
   + The ISA serves as a interface between the hardware and the software, defining both the tasks the processor is able to perform and how they are carried out.
   + The ISA is the only means for a user to communicate with the hardware. Because it is the part of the machine that is visible to the assembly language programmer, the compiler  and the application programmer.
   + The ISA specifies the types of data and the registers  can be used, how your hardware stores main memory and the instructions your microprocessor can run. It is possible to  add more instructions or capabilities to the ISA, or add support for bigger addresses and more data values.
+ RISC-V :
   + RISC (or RISC-V) is the name given to a computer architecture philosophy that was first proposed in the 1980’s.
   + RISC-V is a non-proprietary instruction set architecture(ISA) you can use RISC-V CPUs in microprocessors or microcontrollers without paying royalties to anyone for their use.
 
**SoC Design and OpenLane:**
+ Designing SoC in an automated way requires following tools:
   + Hardware Description Language (HDL) which is Register Transfer Level (RTL) model of the design.
   + Tool used for automation(EDA tools).
   + Process Design Kit (PDK) data

<p align="center">
  <img alt="asic.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/675c9815954bf9390c1159ab675b6762cd53eedd/docs/assets/DAY15_X/asic.png" width="500" >
</p>

+ Process Design Kit(PDK): the interface between the fabrications and the designers.
   + Collection of files used to model a fabrication process for EDA tools used to design an IC.
   + Process Design Rules: DRC, LVS, PEX.
   + Device models.
   + Digital Standard Cell Libraries.
   + I/O libraries

* What is OpenLANE?
   + Started as an Open-Surce Flow for a True Open Source Tape-Out Experiment.
   + striVe is a family of open everything SoCs i.e. Open PDK, Open EDA, Open RTL
* OpenLANE ASIC Flow: 
   + Main goal: to produce a clean GDSII with no human intervention (no-human-in-the-loop) Here Clean refers to :
	 - No LVS violations
	 - No DRC violations
	 - No timing violations
   + Tuned for SkyWater 130 nm Open PDK, also supports XFAB180 and GF130G
   + Containerized
	 - Functional out of the box
	 - Instructions to build and run natively will follow.
	 - Can be used to harden Macros and Chips.
   + Two modes of operation:
	 - Autonomous
	 - Interactive
   + Design Space Exploration feature:
	 - Finding the best set of flow configurations.
   + Comes with large number of design examples.
 	 - 43 designs with their best configurations.

 
 **Communication of Software and Hardware:**
 
* Operating System (OS)
  + Handle IO operations
  + Allocate memory
  + Low level system functions

* Compiler
  + Converting the programming language into the respective intructions 
  + The syntax of the instruction is depending upon what kind of the hardware is, i.e. if the hardware belongs to RISc-V format, the syntax would have the syntax of RISc-V file format instructions

* Assembler
  + Take particular instructions and convert it into the respective binary number which is machine language program
  + Consisting of logic 1 and logic 0 where the computer/hardware understands the language
 
**RTL2GDS Flow:** 

* The flow started from RTL design and ended with final layout in GDSII format by using the function of PDK.  
* OpenLANE is based on several open source project i.e. OpenROAD, KLayout, Yosys, QFlow, ABC, Magic VLSI Layout Tool, Fault, and etc.

*Synthesis:*
  
* The process of converting RTL to a circuit out of components from the standard cell library (SCL)
* The result of the circuit is described in HDL and usually refered to as gate level netlist, also it is functional equivalent to RTL

* "Standard Cells" have regular layout and each cell has different views/models:
  + Electrical, HDL, SPICE
  + Layout (Abstract and detailed)

<p align="center">
  <img alt="synth.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/675c9815954bf9390c1159ab675b6762cd53eedd/docs/assets/DAY15_X/synth.png" width="600" >
</p>

*Floor and Power Planning:*
  
* Chip Floor Planning: partition the chip die between different system building blocks and place the IO pads  
* Macro Floor Planning: dimensions, pin locations, rows and definition
* Power Planning: the power is provided  to the every macros, standard cells, and all other cells are present in the design. Typically, the power distribution network using upper metal layers since they are thicker than lower metal layers
  
<p align="center">
  <img alt="plan.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/675c9815954bf9390c1159ab675b6762cd53eedd/docs/assets/DAY15_X/plan.png" width="600" >
</p>

*Placement:*
  
* The process of placing the cells on the floor plan rows, aligned with the sites. Also, the process of finding a suitable physical location for each cell in the block.
* Macros would place the gate level netlist cells on the rows and the cells should be placed very close to each other to reduce an interconnect delays and enable successful routing 
* Usually done in two steps: 
  + Global: a very first stage of the placement where cells are placed inside the core area for the first time looking at the timing and congestion, it aims at generating a rough placement solution that may violate some placement constraints while maintaining a global view of the whole netlist
  + Detailed: the position obtained from global placements are minimally altered 
  
<p align="center">
  <img alt="place.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/675c9815954bf9390c1159ab675b6762cd53eedd/docs/assets/DAY15_X/place.png" width="600" >
</p>

**Clock tree synthesis (CTS)**
  
* The process of routing the clock by creating the clock before entering major routing process 
  
* Create clock distribution network
  + To deliver the clock to all sequential elements i.e. Flip Flop
  + With minimum skew (zero is hard to achieve) 
  + Achieve a good shape
  + Usually in a Tree (H, X, ...)

<p align="center">
  <img alt="cts.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/675c9815954bf9390c1159ab675b6762cd53eedd/docs/assets/DAY15_X/cts.png" width="600" >
</p>

**Routing**
  
* The process of implementing the interconnect using the available metal layers
* Metal is tracks from a routing grid
* As the routing grid is huge, it used divide and conquere approach:
  + Global Routing: generating routing guides
  + Detailed Routing: using routing guides to implement the actual wiring

<p align="center">
  <img alt="route.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/675c9815954bf9390c1159ab675b6762cd53eedd/docs/assets/DAY15_X/route.png" width="1080" >
</p>

**Sign-off**
  
* Final layout which undergoes verifications 
* Physical verifications
  + Design Rule Checking (DRC) -> ensuring the final layout obeys all the design rules
  + Layout vs Schematic (LVS) -> ensuring the final layout matches the gate level netlist of the design
* Timing verification
  + Static Timing Analysis (STA) -> ensuring all the timing constraints are met and the circuit will run at designated clock frequencies

*OpenLANE Flow:*

**Synthesis exploration**
  
* Synthesis exploration utility is used to generate report that shows the design delay and area 
* From the exploration, we can pick the best strategy to proceed with
* Also, synthesis exploration utility can be used to sweep the design configurations and generate reports
* The report is observed and ensuring the number of violations generated after generating the final layout 
* The best configurations can be picked from the design

**DFT**
  
* After synthesis, DFT is ready to be testing before fabrication (optional step) using open source project which is Fault
* Performing several steps including:
  + Scan Insertion 
  + Automatic Test Pattern Generation (ATPG)
  + Test Patterns Compaction 
  + Fault Coverage
  + Fault Simulation

**Physical implementation**
  
* Also called automated PnR (Place and Route) 
* Using OpenRoad open source to perform the implementation
* Involves several steps including
  + Floor/Power Planning
  + End Decoupling Capacitors and Tap cells insertion
  + Placement: Global and Detailed
  + Post placement optimization
  + Clock Tree Synthesis (CTS)
  + Routing: Global and Detailed

**Logic Equivalent Check (LEC)**
  
* Everytime the netlist is modified, verifications must be performed
  + CTS modifies the netlist
  + Post Placement optimization modifies the netlist  
* LEC is used to formally confirm that the function did not change after modifying the netlist 
* Open source application used: Yosys

**Dealing with Antenna Rules Violations**
  
* A special step during physical implementation is called Antenna Diodes Insertion 
* This step is required for antenna worst violations 
* When a metal wire segment is fabricated and it is long enough, it can act as antenna
  + Reactive ion etching causes charge to accumulate on the wire
  + Transistor gates can be damaged during fabrication   
* Solutions
  + Bridging attaches a higher layer intermediary.
  + Add antenna diode cell to leak away charges.
* With OpenLANE, we took preventive approach by:
  + Adding a fake antenna diode next to every cell input after placement
  + Run the antenna checker (Magic) on the routed layout
  + If the checker reports violations on the cell input pin, replace the fake diode cell by a real one 

**Static Timing Analysis (STA)**
  
* RC Extraction: .def to  .spef.
* STA: OpenSTA (using OpenROAD). 
* Involving timing reports to check violations in timing paths. 
  
**Physical verification DRC & LVS**
  
* Magic is used for Design Rule Checking and SPICE Extraction from Layout
* Magic and Netgen are used for LVS where extracted SPICE by Magic vs verilog netlist are used

 
</details>


<details>
<summary>Labs</summary>


 
</details>
