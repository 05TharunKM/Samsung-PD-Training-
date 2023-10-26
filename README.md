
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
- [Day-16-Understand-importance-of-good-floorplan-vs-bad-floor-plan-and-introduction-to-library-cells](#Day-16-Understand-importance-of-good-floorplan-vs-bad-floor-plan-and-introduction-to-library-cells)
- [Day-17-Design-and-characterise-one-library-cell-using-Layout-tool-and-spice-simulator](#Day-17-Design-and-characterise-one-library-cell-using-Layout-tool-and-spice-simulator)
- [Day-18-Pre-layout-timing-analysis-and-importance-of-good-clock-tree](#Day-18-Pre-layout-timing-analysis-and-importance-of-good-clock-tree)
- [Day-19-Final-Step-RTL-to-GDSII](#Day-19-Final-Step-RTL-to-GDSII)
- [Day-20-Floorplanning-and-power-planning-labs](#Day-20-Floorplanning-and-power-planning-labs)
- [Day-21-Placement-and-CTS-labs](#Day-21-Placement-and-CTS-labs)
- [Day-22-CTS-Analysis-Labs](#Day-22-CTS-Analysis-Labs)
- [Day-23-Clock-gating-technique](#Day-23-Clock-gating-technique)
- [Day-24-Timing-violations-and-ECO](#Day-24-Timing-violations-and-ECO)

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

[Source](https://vsdiat.com/)
 
</details>


<details>
<summary>Labs</summary>

**Exploring directory structure:**

+ Basic commands that are used to explore the directory structure are:
   - `cd` : change directory.
   - `ls -ltr` : list files chronologically.
+ Output:

<p align="center">
  <img alt="dir_struct.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/d7c7f1a2c38584ce3f13457b9a74e211248aa6fa/docs/assets/DAY15_X/dir_struct.png" width="1080" >
</p>

+ To observe the directory structure easily use below command:
   - `tree -d -L #` : this will create a tree of directory where -d is for list the files along directory and -L is depth of directory structure to print.

+ Output:

<p align="center">
  <img alt="dir_tree.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/d7c7f1a2c38584ce3f13457b9a74e211248aa6fa/docs/assets/DAY15_X/dir_tree.png" width="1080" >
</p>

**Synthesis of Picorv32a:**

*Step 1:*

+ Initially docker should be invoked using command `docker` to enter the openlane tools environment.
+ Then using flow.tcl file open interactive version of openalane environment. command to be used is `./flow.tcl -interactive`
+ Output:

<p align="center">
  <img alt="openlane_inter.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/d7c7f1a2c38584ce3f13457b9a74e211248aa6fa/docs/assets/DAY15_X/openlane_inter.png" width="1080" >
</p>


*Step 2:*

+ Now to intialize the the package use command `package require openlane 0.9`.
+ And to prepare the design for synthesizing use command `prep -design picorv32a`.
+ Now run the synthesis using command `run_synthesis`
+ Output:
   + After succesfully executing design preparation step.

<p align="center">
  <img alt="des_prep.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/0e4133f130c8870527e594fa2ddf22218e9d21df/docs/assets/DAY15_X/des_prep.png" width="1080" >
</p>

 
   + After Synthesis is done it will output message 'synthesis was successful'.

<p align="center">
  <img alt="synth_done.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/0e4133f130c8870527e594fa2ddf22218e9d21df/docs/assets/DAY15_X/synth_done.png" width="1080" >
</p>

*Step 3:*

+ Now to analyse the output open directory `openlane/designs/picorv32a/runs/run_name/`.
+ There are 4 important output directory to observe - tmp, results, reports and logs.
+ To open the generated netlist open results dirctory, select synthesis results and open the .v file.
+ For timing reports browse reports directory where timing report, cell counts and other reports are there.
+ Outputs:
   + Netlist:

<p align="center">
  <img alt="netlist.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/52c5df2e8d101dcbb52569ecf4b315221a40b0f5/docs/assets/DAY15_X/netlist.png" width="1080" >
</p>

   + Timing Report:
     
<p align="center">
  <img alt="timrep.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/52c5df2e8d101dcbb52569ecf4b315221a40b0f5/docs/assets/DAY15_X/timrep.png" width="1080" >
</p>

   + Cell Count:

<p align="center">
  <img alt="cell_count.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/52c5df2e8d101dcbb52569ecf4b315221a40b0f5/docs/assets/DAY15_X/cell_count.png" width="1080" >
</p>

   + Flop Ratio:

<p align="center">
  <img alt="flop_ratio.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/52c5df2e8d101dcbb52569ecf4b315221a40b0f5/docs/assets/DAY15_X/flop_ratio.png" width="1080" >
</p>

   +  Flop ratio = number of ff/ number of cell =  1613/14876 ~ 0.10 (10%)
   +  Area =  147712.918400 

</details>

## Day-16-Understand-importance-of-good-floorplan-vs-bad-floor-plan-and-introduction-to-library-cells

<details>
<summary>Chip Floor planning considerations</summary>

**What is core and die section of a chip?** 

<p align="center">
  <img alt="coredie.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/1e3547f2a2ecaff92ff93098ea26ec98b6ca50f1/docs/assets/Day16_theory/coredie.png" width="500" >
</p>

+ Core:
  + The core usually refers to the central or essential part of an integrated circuit. It is the portion of the chip that contains the primary functional blocks, such as the CPU core in a microprocessor or the logic gates in ASIC.
+ Die:
  + A die is the individual silicon chip or wafer that is fabricated during the semiconductor manufacturing process.
  + It contains the active components of the IC, including transistors, logic gates, memory cells, and other functional elements.
  + The die is typically a square or rectangular piece of silicon wafer, and it represents the fundamental building block of an IC.

**Floorplanning:**
+ Consider below simple design and floorplanning is explained below with corresponding examples.

<p align="center">
  <img alt="netlist.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/1e3547f2a2ecaff92ff93098ea26ec98b6ca50f1/docs/assets/Day16_theory/netlist.png" width="500" >
</p>
   

**Define Width and Height of Core and Die:** 

+ Convert these symbolic representation into physical cells with dimensions

<p align="center">
  <img alt="phys_netl.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/1e3547f2a2ecaff92ff93098ea26ec98b6ca50f1/docs/assets/Day16_theory/phys_netl.png" width="500" >
</p>

 + Assume Height and Width of all the std cells as 1 units to simplfy the analysis.
 + Area of each cells calculated is 1sq units
 + Now arrange the cells in core like below :

<p align="center">
  <img alt="arrange.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/2de3ed205ff8a528fc6ae0a039333e92848f8082/docs/assets/Day16_theory/arrange.png" width="500" >
</p>

 + Now total area of die is calculated.
 + Below is the calculations for aspect ratio and core utilization factor.

```
                          Area Occupied by Core
 >> Utilization Factor = ------------------------
                          Area Occupied by Die
                    Height
>> Aspect Ratio  = ---------
                    Width
Example1:
Core Area = area(FF) +area(FF) + area(A1) + area(O1) =  1 + 1 + 1 + 1 = 4 sq. units
Die  Area = 8 sq. units
Utilzation factor = 4/8 = 0.5 ~ 50%
Aspect ratio = 4/4 =1 (Square)

Example2:
Core Area = area(FF) +area(FF) + area(A1) + area(O1) =  2 + 2 + 1 + 1 = 6 sq. units
Die  Area = 8 sq. units
Utilzation factor = 6/8 = 0.75 ~ 75%
Aspect ratio = 4/4 =1 (Square)
```  

**Pre Placed Cells:**

+ Pre-placed cells refer to specific functional blocks or standard cells that are predetermined and fixed at specific locations on the chip's layout. These cells are typically essential components of the integrated circuit (IC) and include items like memory blocks, input/output pads, or other critical logic cells.
+ Now consider below combinational circuit :

<p align="center">
  <img alt="combo.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/2de3ed205ff8a528fc6ae0a039333e92848f8082/docs/assets/Day16_theory/combo.png" width="45%" >
&nbsp; &nbsp; &nbsp; &nbsp;
  <img alt="combo_split" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/2de3ed205ff8a528fc6ae0a039333e92848f8082/docs/assets/Day16_theory/combo_split.png" width="45%">
&nbsp; &nbsp; &nbsp; &nbsp;
</p> 

+ Here whole combinational network is split into two parts block 1 and block 2.
+ Then nextend the IO pins of the two blocks and detach those blocks.
+ Now instead of implementing the whole block which would ahe taken more time now two blocks are given two diffent users to implement.

<p align="center">
  <img alt="ips.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/2de3ed205ff8a528fc6ae0a039333e92848f8082/docs/assets/Day16_theory/ips.png" width="500" >
</p>

+ Since this combinmational sections is split into two different blocks we can use them multiple times in the circuit similar to IPs.
+ Similarly, there are any other blocks/IP's like
   + Memory
   + Clock-gating cell
   + Comparator
   + Mux
+ All of these IPs/Blocks can be implemented once and used multiple times in design.
+ This is  called as pre-placed cells since the cells are being just placed once in a chip where we have to define the locations of the blocks and it is done before the routing.
+ The locations of these blocks on top-level chip will be fixed.
+ The arrangement of these IP’s in a core is referred as Floorplanning
+ Automated PnR tools will places the remaining logical cells in the design.

**Decoupling capacitors:**
+ Decoupling capacitors, often referred to decaps, are an essential component in physical design. They are used to stabilize and improve the performance of integrated circuits by mitigating voltage fluctuations or noise on the power supply lines.
* Consider diagram below;

<p align="center">
  <img alt="nocap.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/2de3ed205ff8a528fc6ae0a039333e92848f8082/docs/assets/Day16_theory/nocap.png" width="500" >
</p>
  
+ During switching  operation, if its '0' to '1' transition the circuit draws switching current  from sourceand if its '1' to '0' transition circuit will discharge into voltage source.
+ Now, because the resistance of wire length there will be a voltage drop across them and full Vdd Volts is not provided to circuit.
+ This will result in outputs signal fluctuating out of logical margins thus becoming noise. consider below graph to understand noise margin 

<p align="center">
  <img alt="nmargin.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/2de3ed205ff8a528fc6ae0a039333e92848f8082/docs/assets/Day16_theory/nmargin.png" width="500" >
</p>
  
* If the voltage lies between Vol and Vll , it will be considered as logic '0'.
* If the voltage lies between Vih and Voh , it will be considered as logic '1'.
* Any voltage that lies between Vll and Vih will be considered as noise.
* To ensure that the voltage don't enter noisy region uninterupted voltage source should be provided.

<p align="center">
  <img alt="dcap.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/2de3ed205ff8a528fc6ae0a039333e92848f8082/docs/assets/Day16_theory/dcap.png" width="500" >
</p>

* To solve this issue, we have to add decoupling capacitors.
* Decoupling capacitor would decouple the circuit from the main supply. 
* Everytime the circuit switches, it draws current from Cap instead of main supply.
* Below is the arrangements of decoupling capacitors along with other blocks.
 
<p align="center">
  <img alt="floored.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/2de3ed205ff8a528fc6ae0a039333e92848f8082/docs/assets/Day16_theory/floored.png" width="500" >
</p>

**Power Planning:** 
+ In above example, decoupling capacitors are added across the design to stabilize the supply voltage.
+ But consider case below: 

<p align="center">
  <img alt="pp1.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/2de3ed205ff8a528fc6ae0a039333e92848f8082/docs/assets/Day16_theory/pp1.png" width="500" >
</p> 

+ In above design there are multiple IPs in core and consider there's a load  being driven by driver cell.
+ The signals from the driver are 16bit signals.
+ Now when there's switching between logics following effects are observed :

<p align="center">
  <img alt="pp2_1.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/2de3ed205ff8a528fc6ae0a039333e92848f8082/docs/assets/Day16_theory/pp2_1.png" width="45%" >
&nbsp; &nbsp; &nbsp; &nbsp;
  <img alt="pp2_2.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/2de3ed205ff8a528fc6ae0a039333e92848f8082/docs/assets/Day16_theory/pp2_2.png" width="45%">
&nbsp; &nbsp; &nbsp; &nbsp;
</p>

+ Here in 16 bit bus, whenever there's a switching we can assume each bits to have there own capacitance.
+ In image left there's inverting switch and most of the logic level were '0' and are pulled to logic '1'.This result in large amount of current being drawn from supply.
+ Similarly when there's a switch from '1' to '0' large amount of charge is discharged. 
+ Single voltage supply and decoupling capacitor can't sustain that much current and charges being discharged.
+ To avoid this power planning is done. Below is the picture of power planning for above example(left) and When whole die power planning is done(right):

<p align="center">
  <img alt="vddss.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/2de3ed205ff8a528fc6ae0a039333e92848f8082/docs/assets/Day16_theory/vddss.png" width="45%" >
&nbsp; &nbsp; &nbsp; &nbsp;
  <img alt="pp.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/2de3ed205ff8a528fc6ae0a039333e92848f8082/docs/assets/Day16_theory/pp.png" width="45%">
&nbsp; &nbsp; &nbsp; &nbsp;
</p>

**Pin placement and logical cell placement blockage:**

<p align="center">
  <img alt="pinp1.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/2de3ed205ff8a528fc6ae0a039333e92848f8082/docs/assets/Day16_theory/pinp1.jpg" width="500" >
</p> 

+ For the above design, the input port placed on left side of die and output ports on right side of die.
+ Input ports and output ports are placed randomly.
+ Clock ports which are CLK1, CLK2 and Clkout have bigger size pads  compared to data ports.(Bigger the size, least the resistance)
+ Area around the pins are reserved so that no cells are placed on that.
+ Location where logical cell are placed is blocked for further placement process.

<p align="center">
  <img alt="pinp2.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/2de3ed205ff8a528fc6ae0a039333e92848f8082/docs/assets/Day16_theory/pinp2.jpg" width="500" >
</p> 


**Labs:** 

*Configuring floorplan process:*
+ Using switches we set the many constraints like which metal layer  to use and what should be utilization factor and many more .
+ Following is different switches available: 

<p align="center">
  <img alt="readme.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/572fa620f8baec6fbd6eb4e17f2ea3ced15438ab/docs/assets/Day16_theory/readme.png" width="500" >
</p> 

+ Using these switches in tcl files - 1) floorplan.tcl 2)config.tcl 3)sky130A_sky130_fd_sc_hd.tcl we can configure the  floorplanning process.
+ If same switches are being used multiple times and is setting it to different vaues, tool will consider the configuration file with highest priority.(sky130A_sky130_fd_sc_hd.tcl>config.tcl>floorplan.tcl). i.e tool defaults will be  overidden by design config files.

<p align="center">
  <img alt="tcls.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/572fa620f8baec6fbd6eb4e17f2ea3ced15438ab/docs/assets/Day16_theory/tcl.png" width="500" >
</p> 

+ Now to run the floorplanning use command `run_floorplan`.
+ After running floorplan, reports, logs and results are stord in directory '/openlane/designs/picorv32a/runs/runname/()'.
+ To view the layout of floorplan with magic tool use below comand:
+ `magic -T /Desktop/work/tools/openlane_working_dir/pdks/sky130A/libs.tech/magic/sky130A.tech lef read ../../tmp/merged.lef def read picorv32a.floorplan.def &`

<p align="center">
  <img alt="magic.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/572fa620f8baec6fbd6eb4e17f2ea3ced15438ab/docs/assets/Day16/magic.png" width="500" >
</p> 

+ To explore the floor plan use below steps :
    + Select : hover on the cells and press `s`.
    + Zooom : Press `z` and `z` + `shift` to zoom out.
    + Use command what in commmand line to see the detail of selected item.
    + In following example which metal  is used for  horizontal metal layer and vertical metal layer has been explored:

<p align="center">
  <img alt="m_horm3.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/572fa620f8baec6fbd6eb4e17f2ea3ced15438ab/docs/assets/Day16/m_horm3.png" width="45%" >
&nbsp; &nbsp; &nbsp; &nbsp;
  <img alt="m_verm2.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/572fa620f8baec6fbd6eb4e17f2ea3ced15438ab/docs/assets/Day16/m_verm2.png" width="45%">
&nbsp; &nbsp; &nbsp; &nbsp;
</p>
    
</details>


<details>
<summary>Library Binding and Placement</summary>

**Netlist binding and initial place design:**

+ A library file contains essential information about standard cell libraries.
+ Standard cell libraries consist of a collection of pre-designed and characterized logic gates and flip-flops.
+ These libraries are fundamental to the design and optimization of digital circuits.
+ Contents of a .lib File:
   + Cell Definitions: Each logic gate or flip-flop in the library is defined with its logical functionality, pin descriptions, and timing information.
   + Timing Information: This section provides data on the timing behavior of the library cells. It includes details like setup time, hold time, propagation delay, transition times, and more. Timing information is crucial for performing timing analysis and optimization during the physical design process.
   + Power Consumption Data: .lib files often include power consumption information for each cell, which is essential for estimating and managing power consumption in the IC.
   + Noise and Delay Models: Some .lib files may also include models for noise and signal delay, which are critical for accurate simulation and analysis.
   + Constraints: Constraints may be defined to guide the placement and routing tools during physical design.

<p align="center">
  <img alt="flavours.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/572fa620f8baec6fbd6eb4e17f2ea3ced15438ab/docs/assets/Day16_theory/flavours.jpg" width="500" >
</p> 

**Placement:**

+ The physical view of logic gates will be placed into the floorplan.
+ These placed cells will have real dimensions.
+ As specified above cells with different flavours are provided in library and they are selected based the timing and power requirement.
+ The location of cells in the floorplan is decided by taking into considerations of the connections of the cells to  inputs and outputs ports.

<p align="center">
  <img alt="floorplaneed.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/572fa620f8baec6fbd6eb4e17f2ea3ced15438ab/docs/assets/Day16_theory/floorplaneed.jpg" width="500" >
</p> 

+ Optimizing is done based on wire length estimations.
+ If the distance between two cells is too long signal integrity will be lost due wire resistance and causes worse slew.
+ Before routing, based on  wire length and capacitance estimation buffers are added.
+ These buffers will act as repeaters that replicate the original signal.
+ Finally basic check is done to verify its timing performance.
+ Below is final floorplan after optimized placement:

<p align="center">
  <img alt="optm_fp.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/572fa620f8baec6fbd6eb4e17f2ea3ced15438ab/docs/assets/Day16_theory/optm_fp.png" width="500" >
</p> 

**Lab**

+ Placement is done two steps global and detailed.
   + Global placement: assigns general locations to movable objects. It used to reduce wire length.
   + Detailed placement: refines object locations to legal cell sites and enforces non-overlapping constraints.
+ The detailed locations enable more accurate estimations of the circuit delay for the purpose of timing optimization.
+ Legalization is an essential step where the overlaps between gates/macros must be removed.
+ To run the placement use command `run_placement`.
+ Half Parameter Wire Length (HPWL) is applied to reduce wire length
+ To view the layout after placemnt use command below : 

```
cd /Desktop/work/tools/openlane_working_dir/openlane/designs/picorv32a/runs/<runName/results/placement
magic -T /Desktop/work/tools/openlane_working_dir/pdks/sky130A/libs.tech/magic/sky130A.tech lef read ../../tmp/merged.lef def read picorv32a.placement.def &
```

<p align="center">
  <img alt="placement_magic.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/572fa620f8baec6fbd6eb4e17f2ea3ced15438ab/docs/assets/Day16/placement_magic.png" width="500" >
</p>  
 
</details>

<details>
<summary>Cell design and characterization flow</summary>

+ In this section, how the standard cells like inverter buffers etc are designed and implemented is discussed.
+ There are 3 steps in cell design flow: 

<p align="center">
  <img alt="cdflow.jpg" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/572fa620f8baec6fbd6eb4e17f2ea3ced15438ab/docs/assets/Day16_theory/cdflow.jpg" width="500" >
</p> 

*Inputs:* 

+ PDK: Process Design Kits (PDKs) are an essential component of the VLSI design. They are sets of files, libraries, and documentation provided by semiconductor foundries to  designers to facilitate the design of integrated circuits (ICs) using their manufacturing processes.
+ DRC and LVS Rules:

<p align="center">
  <img alt="drclvs.jpg" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/572fa620f8baec6fbd6eb4e17f2ea3ced15438ab/docs/assets/Day16_theory/drclvs.jpg" width="500" >
</p> 

   + DRC is a process used to check whether the layout of an IC adheres to the manufacturing design rules specified by the semiconductor foundry. These rules define constraints and limits on various aspects of the layout, such as minimum feature size, spacing between features, alignment, and more.
   +  LVS is a process used to verify that the layout of an IC matches its schematic or logical representation. It ensures that the connections and devices in the layout accurately reflect the intended design.

+ SPICE Model: SPICE (Simulation Program with Integrated Circuit Emphasis) models are essential components for simulating and analyzing the behavior of designs. SPICE is a widely used simulation tool that allows designers to predict how circuit  will perform under various conditions. SPICE models provide a mathematical representation of electronic components and their behavior.

 <p align="center">
  <img alt="spice.jpg" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/572fa620f8baec6fbd6eb4e17f2ea3ced15438ab/docs/assets/Day16_theory/spice.jpg" width="500" >
</p>  


*Design steps:*

+ Circuit design: 

 <p align="center">
  <img alt="cdes.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/572fa620f8baec6fbd6eb4e17f2ea3ced15438ab/docs/assets/Day16_theory/cdes.png" width="500" >
</p>  

  + Euler's path is a concept from graph theory that has applications in circuit design. It refers to a path that visits every edge (connection) of a graph exactly once.
  + A stick diagram is a simple, abstract representation of a circuit's layout. It uses lines and rectangles to represent wires and components without detailing their exact shapes or dimensions.
  + In a complementary CMOS design, both PMOS and NMOS transistors are used together to implement various logic functions. The W/L ratio for PMOS and NMOS transistors can be different based on the specific requirements of the circuit. The W/L ratio determines the operating characteristics of these transistors, including their drive strength and speed. 

+ Layout design: Layout design in VLSI  refers to the process of physically designing the placement and interconnection of transistors, gates, and other components on a semiconductor chip. 
   + Follwoing is simple example of layout design: 

 <p align="center">
  <img alt="lay.jpg" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/572fa620f8baec6fbd6eb4e17f2ea3ced15438ab/docs/assets/Day16_theory/lay.jpg" width="500" >
</p>  

+ Steps in characterizing the design.
   1) Review model fileReview extracted SPICE netlist.
   2) Define the behavior of the buffers.
   3) Review sub-circuit of inverters.
   4) Attach necessary power sources.
   5) Apply the stimulus.
   6) Provide necessary output capacitance.
   7) Provide necessary command (using trans/dc simulations)

*Outputs:*

+ Circuit Description Language (CDL), GDSII, LEF, extracted spice netlist (.cir) Timing noise, power .libs, function.

**General timing characterization parameters:**

+ Propagation delay measures the time it takes for a signal to propagate through a logic gate or a combinational circuit.

 <p align="center">
  <img alt="slew.jpg" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/572fa620f8baec6fbd6eb4e17f2ea3ced15438ab/docs/assets/Day16_theory/slew.jpg" width="500" >
</p>  

+ Slew is defined as the time taken by signal to rise from 10 %( 20%) to the 90 %( 80%) of its maximum value. This is known as “rise time”.
+ Similarly Slew for “fall time” can be defined as the time taken by a signal to fall from 90 %( 80%) to the 10 %( 20%) of its maximum value.

<p align="center">
  <img alt="slew2.jpg" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/572fa620f8baec6fbd6eb4e17f2ea3ced15438ab/docs/assets/Day16_theory/slew2.png" width="500" >
</p>  

 
</details>



## Day-17-Design-and-characterise-one-library-cell-using-Layout-tool-and-spice-simulator

<details>
<summary>Labs for CMOS inverter using ngspice</summary>

**IO Placer Revision:**

+ Using commands below change the modes and observe the layout using magic:

```
set ::env(FP_IO_MODE) 2   // 0,1,2
run_floorplan
```

+ Below is Layout of three different modes generated after floorplanning:

<p align="center">
  <img alt="L0_modes.jpg" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/ff9a8f97e81078d8beadebf28c01d2e6192a871f/docs/assets/DAY17_p1/L0_modes.png" width="500" >
</p>  

**SPICE deck creation for CMOS inverter:**

+ SPICE Deck : Similar to netlist contain component connectivity, tap connectivity etc.
+ Component connectivity:

<p align="center">
  <img alt="L1_inv.jpg" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/ff9a8f97e81078d8beadebf28c01d2e6192a871f/docs/assets/DAY17_p1/L1_inv.png" width="500" >
</p> 

+ Here both the drain of nmos and pmos is shorted and taken as output. Body terminal is pulled to 'Vdd' for pmos and 'gnd' for nmos.
+ Component  values:
   - pmos - w/l = 0.375u/0.25u
   - nmos - w/l = 0.375u/0.25u
(Ideally W/L of pmos is bigger than W/L of nmos)
   - Cload = 10fF
   - Vin = 2.5v
   - Vdd = 2.5v
+ Identifying nodes:
   - Node 1 : Vin = in
   - Node 2 : Vdd = vdd
   - Node 3 : Vout= out
   - Node 4 : Vss = 0
+ Writing the SPICE Deck :

```
*** Model Description   ***
*** Netlist Description ***

***<Name>  <Drain> <Gate> <Source> <Substrate>****
M1 out in vdd vdd pmos  W=0.375u L=0.25u
M2 out in 0 0 nmos W=0.375u L=0.25u

***<Name> <Node1> <Node2> <value>***
cload out 0 10f

Vdd vdd 0 2.5
Vin in 0 2.5

***Simulation Commands***
.op
.dc Vin 0 2.5 0.05

***.include tsmc_0.25um_model.mod***
.LIB "tsmc_0.25um_mod" CMOS_MODELS
.end
```

+ Outputs:
   -  (W/L)<sub>nmos</sub> = (W/L)<sub>pmos</sub> = 1.5
   -  (W/L)<sub>nmos</sub> =  1.5 , (W/L)<sub>pmos</sub> = 3.75 

<p align="center">
  <img alt="L23_c1.jpg" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/ff9a8f97e81078d8beadebf28c01d2e6192a871f/docs/assets/DAY17_p1/L23_c1.png" width="45%" >
&nbsp; &nbsp; &nbsp; &nbsp;
  <img alt="L23_c2.jpg" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/ff9a8f97e81078d8beadebf28c01d2e6192a871f/docs/assets/DAY17_p1/L23_c2.png" width="45%">
&nbsp; &nbsp; &nbsp; &nbsp;
</p>

+ Shapes of waveform is same. This implies that cmos inverter is a robust device.
+ Static behavior evaluation : CMOS inverter robustness
   - Switching threshold(vm) : Vmm is the point where Vin = Vout.
       * In first device vm is around 0.9v
       * In second devive vm is around 1.2v
   - At the point both pmos and nmos is turned and are in saturation.
   - Idsp = Idsn
+ Calculating rise delay and fall delay.
+ Find the time at which input and output is 50% of the Vdd and take the difference.
+ For rise delay difference of time between points where ouput(rising) is 50% of Vdd and input(falling) is 50% of Vdd.
+ Similarly for fall delay difference of time between points where ouput(falling) is 50% of Vdd and input(rising) is 50% of Vdd.  

**Lab steps to git clone vsdstdcelldesign:**

+ Commands used :

```
cd ~/Desktop/work/tools/openlane_working_dir/openlane
git clone https://github.com/nickson-jose/vsdstdcelldesign.git
cd vsdstdcelldesign/
// copy the sky130A.tech file to current working directory.
magic -T sky130A.tech sky130_inv.mag
```

+ Output :

<p align="center">
  <img alt="L5_inv.jpg" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/ff9a8f97e81078d8beadebf28c01d2e6192a871f/docs/assets/DAY17_p1/L5_inv.png" width="500" >
</p> 

</details>

<details>
<summary>Inception of Layout and CMOS Fabrication</summary>

**16-mask CMOS process:**

*Selecting a substrate:*

+ P-type, high resistivity of 5-50 ohms, doping level of 10<sup>15</sup> cm<sup>-3</sup> and orientation of 100.
+ Doping of substrate should be less than well doping level.

<p align="center">
  <img alt="Screenshot%202023-10-16%20010515.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/82bcf36ce748aea8b9466630db766b622c0a061d/docs/assets/DAY17_p1/Screenshot%202023-10-16%20010515.png" width="500" >
</p> 


*Creating the active region for transistor:*

+ Create an isolation between buckets.
   1) Grow a SiO<sub>2</sub> ~ 40nm
   2) Grow a Si<sub>3</sub>N<sub>4</sub> ~ 80nm
   3) Deposit a layer of photoresist ~ 1um.
   4) Masking: washing out the patterns.(mask1)
   5) Remove Mask, etch out the Si<sub>3</sub>N<sub>4</sub> layer and remove photoresist layer.
   6) Place in oxidation furnace for SiO<sub>2</sub> to grow 
   7) Now two buckets are completely isolated from each other.
   8) Etch out Si<sub>3</sub>N<sub>4</sub> using phoshoric acid. 

<p align="center">
  <img alt="Screenshot%202023-10-16%20010515.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/82bcf36ce748aea8b9466630db766b622c0a061d/docs/assets/DAY17_p1/Screenshot%202023-10-16%20010515.png" width="500" >
</p> 

*N-Well and P-Well formation:*

+ Deposit a layer of photoresis and place mask2 and expose to UV light.
+ Dope with Boron using ion-implantation. (~200keV)
+ This will from the p-well.
+ Now remove photoresist layer.
+ Using the same process above(mask3) create an n-well using phosphorous ion-implantation.
+ Take the substrate to high temperature furnace for diffusion.
+ Difusion will create deeper wells(Twin tub process).

<p align="center">
  <img alt="Screenshot%202023-10-16%20010556.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/82bcf36ce748aea8b9466630db766b622c0a061d/docs/assets/DAY17_p1/Screenshot%202023-10-16%20010556.png" width="500" >
</p> 

*Gate formation:*

+ Using mask4 do ion-implantations with boron (~60keV)
+ This will create thin p type layer.
+ Using same prosess(mask5) create an thin n type layer.
+ Now remove oxide layer using HF and regrow the oxide layer for high quakity oxide(~10nm).
+ Grow thin polysilicon layer(~.4um).
+ To get low sheet resistance implant it with N-type material.
+ Now using mask6 etch out photoresist and polysilicon to create two gates.
+ And etch out polysilicon from gate terminal.

<p align="center">
  <img alt="Screenshot%202023-10-16%20010614.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/82bcf36ce748aea8b9466630db766b622c0a061d/docs/assets/DAY17_p1/Screenshot%202023-10-16%20010614.png" width="500" >
</p> 

*Lightly doped drain(LDD) formation:*

+ Two doping Profiles:
    -  Hot electron effect: High energy carriers will break Si-Si bonds and crosses 3.2eV barrier between Si conduction band SiO2 conduction band, it will enter oxide layer.
    -  Short channel effect: For short channels, drain field will penetrates channel (making the gate difficults to control the current- source and drain)
+ Start by adding Mask7 to protect the desired area and the rest steps of photolithography is same.
+ Then do the ion implantation process by doping it with Phosphorus (N-type material) which gives out lightly doped channel.
+ Repeat the same Mask8.
+ Ion implantation with Boron.
+ Create some spaces around gate to protect further source and drain formation using plasma anisotropic etching.

 <p align="center">
  <img alt="Screenshot%202023-10-16%20010636.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/82bcf36ce748aea8b9466630db766b622c0a061d/docs/assets/DAY17_p1/Screenshot%202023-10-16%20010636.png" width="500" >
</p> 

*Source and drain formation:*

+ Thin layer of screen oxide is added to avoid channel link entering the substrate.
+ Add Mask9 and repeat the same steps of photolithography.
+ Do ion-implantation with Arsenic(~75keV) which results in N+ N- P.
+ Add Mask10 and repea the same step as above.
+ Do ion implantation with Boron (~50oeV) which gives P+ P- N.
+ Place into high temperature furnace(high temperature annealing) to penetrate more into N-well and P-well.

<p align="center">
  <img alt="Screenshot%202023-10-16%20010650.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/82bcf36ce748aea8b9466630db766b622c0a061d/docs/assets/DAY17_p1/Screenshot%202023-10-16%20010650.png" width="500" >
</p> 

*Local interconnect formation:*

+ Remove the thin screen oxide to expose  drain, source and gate region for contact formation.
+ Etch the thin oxide in Hydrofluoric acid.
+ Deposit Titanium(metal with low resistivity)  using sputtering.
+ Create a contact between Titanium that has been deposited by heating the wafer in N<sub>2</sub> ambient for 60sec at about  650-700<sup>o</sup>C.
+ This results in low resistance TiSi<sub>2</sub> that can be used for local interconnect.
+ Add Mask11 and repeat the photolithography process.
+ Etch the  extra TiN for RCA cleaning.
+ RCA is solution of
    - De-ionized water (H<sub>2</sub>O), 5 parts.
    - Ammonium hydroxide (NH<sub>4</sub>OH), 1 parts.
    - Hydroxide peroxide (H<sub>2</sub>Osub>2</sub>), 1part
+ Local TiN interconnects were used to contact locally.

<p align="center">
  <img alt="Screenshot%202023-10-16%20010707.pn" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/82bcf36ce748aea8b9466630db766b622c0a061d/docs/assets/DAY17_p1/Screenshot%202023-10-16%20010707.png" width="500" >
</p> 

*Higher level metal formation:*

+ The surface topography is not suitable for metal contact since it is non-linear.
+ To fix that, thick layer of SiO<sub>2</sub>(borophosphosilicate glass).
+ Phosphorus will act as a barrier protection against mobile sodium ion and boron will reduce the temperature.
+ Polish the surface and get a flat surface using chemical mechanical polishing.
+ Add Mask12 and repeat the  lithography process.

+ Etch off the SiO<sub>2</sub>.
+ Remove the photoresist, deposit a thin layer of titanium nitrate and blanket tungsten layer.
+ Remove extra tungsten layer using chemical mechanical polishing.
+ Add Aluminium to allow contact hole to contact higher metal layer.
+ Now put Mask13 and do the same lithography process.
+ Plasma etch the aluminium and remove the photoresist.
+ Deposit SiO<sub>2</sub> and polish again

+ Add Mask14 and repeat the same process.
+ Deposit titanium nitrate that acts as barrier and deposit tungsten to make the contacts.
+ Add Mask15 as 3rd level interconnect using Aluminium (more thicker).
+ Give protection layer for the chip.
+ Add Mask16 to contact outside of the chip and repeat the same process.

<p align="center">
  <img alt="Screenshot%202023-10-16%20010734.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/82bcf36ce748aea8b9466630db766b622c0a061d/docs/assets/DAY17_p1/Screenshot%202023-10-16%20010734.png" width="500" >
</p> 


**Lab:**

+ Commands used :

```
cd vsdstdcelldesign/
// copy the sky130A.tech file to current working directory.
magic -T sky130A.tech sky130_inv.mag
```
+ Outputs: 

<p align="center">
  <img alt="layout.jpg" src="" width="500" >
</p> 


+ Connection between gate,drain and source is given in below picture:

<p align="center">
  <img alt="allcon.jpg" src="" width="500" >
</p> 


+ pmos and nmos :

<p align="center">
  <img alt="pmos.jpg" src="" width="45%" >
&nbsp; &nbsp; &nbsp; &nbsp;
  <img alt="nmos.jpg" src="" width="45%">
&nbsp; &nbsp; &nbsp; &nbsp;
</p>

+ To check DRC errors select whole area and use command `what` in tkcon window.

<p align="center">
  <img alt="drc.jpg" src="" width="500" >
</p> 

+ Observations: 
   - To get the dimension of the layout use command `box`.
   - First layer is locali(blue) where the 'Gnd' and 'Vdd' is placed.
   - 'Gnd' and 'Vdd' is metal1(purple).
   - Square checked blue box is an interconnect between locali and metal1.
   - Crossed check box on nsub is a contact cut b/w nwell and local1 for pmos.
   - Similarly another contact cut is placed for pwell and locali incase of nmos.

+ To simluate this layout we need to generate the netlist and below commands are used:

```
//tkcon
% extract all
% ext2spice cthresh 0 rthresh 0
% ext2spice -o sky130_invtharun

```

+ SPICE generated:

<p align="center">
  <img alt="spice.jpg" src="" width="500" >
</p> 

</details>


<details>
<summary>Sky130 Tech file Labs</summary>

<p align="center">
  <img alt="Screenshot%202023-10-15%20234737.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/611690237fc6bddd232e5051054b75e2f1868586/docs/assets/Day17_p2/Screenshot%202023-10-15%20234737.png" width="1080" >
</p>

<p align="center">
  <img alt="Screenshot%202023-10-15%20234856.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/611690237fc6bddd232e5051054b75e2f1868586/docs/assets/Day17_p2/Screenshot%202023-10-15%20234856.png" width="1080" >
</p>
<p align="center">
  <img alt="Screenshot%202023-10-15%20235654.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/611690237fc6bddd232e5051054b75e2f1868586/docs/assets/Day17_p2/Screenshot%202023-10-15%20235654.png" width="1080" >
</p>

<p align="center">
  <img alt="Screenshot%202023-10-16%20000358.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/611690237fc6bddd232e5051054b75e2f1868586/docs/assets/Day17_p2/Screenshot%202023-10-16%20000358.png" width="1080" >
</p>
<p align="center">
  <img alt="Screenshot%202023-10-16%20000541.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/611690237fc6bddd232e5051054b75e2f1868586/docs/assets/Day17_p2/Screenshot%202023-10-16%20000541.png" width="1080" >
</p>
<p align="center">
  <img alt="Screenshot%202023-10-16%20002454.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/611690237fc6bddd232e5051054b75e2f1868586/docs/assets/Day17_p2/Screenshot%202023-10-16%20002454.png" width="1080" >
</p>
<p align="center">
  <img alt="Screenshot%202023-10-16%20002717.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/611690237fc6bddd232e5051054b75e2f1868586/docs/assets/Day17_p2/Screenshot%202023-10-16%20002717.png" width="1080" >
</p>
<p align="center">
  <img alt="Screenshot%202023-10-16%20003606.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/611690237fc6bddd232e5051054b75e2f1868586/docs/assets/Day17_p2/Screenshot%202023-10-16%20003606.png" width="1080" >
</p>
<p align="center">
  <img alt="Screenshot%202023-10-16%20003708.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/611690237fc6bddd232e5051054b75e2f1868586/docs/assets/Day17_p2/Screenshot%202023-10-16%20003708.png" width="1080" >
</p>
 <p align="center">
  <img alt="Screenshot%202023-10-16%20004226.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/611690237fc6bddd232e5051054b75e2f1868586/docs/assets/Day17_p2/Screenshot%202023-10-16%20004226.png" width="1080" >
</p>
<p align="center">
  <img alt="Screenshot%202023-10-16%20004903.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/611690237fc6bddd232e5051054b75e2f1868586/docs/assets/Day17_p2/Screenshot%202023-10-16%20004903.png" width="1080" >
</p>
</details>



## Day-18-Pre-layout-timing-analysis-and-importance-of-good-clock-tree

<details>
<summary>Timing Modelling using delay tables</summary>

**Lab1:**

- Library Exchange Format (LEF)
  + A specification in which representing the physical layout of an integrated circuit in an ASCII format.
  + It includes design rules and abstract information about the standard cells.
  + LEF only has basic information required at that level to serve the purpose of the concerned CAD tool.
  + Containing information on input, output, power and group port, does not consists logic path information.
  +  Objective: extract LEF file from .mag file and then plug the file into the picorv32a flow.
  +  Guidelines:
        * The input and output ports must lie on the intersection of the vertical and horizontal tracks.
        * The width of standard cell should be on the track pitch, and the height should be on the track vertical pitch

- Go to directory   `/Desktop/work/tools/openlane_working_dir/pdks/sky130A/libs.tech/openlane/sky130_fd_sc_hd` and open tracks.info

<p align="center">
  <img alt="trackinfo.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/f730a87514ad10be31329a3a606b62d96e10ea45/docs/assets/Day18/trackinfo.png" width="1080" >
</p>

- Set the grid based on the tracks.info.

<p align="center">
  <img alt="grid_tkcon.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/f730a87514ad10be31329a3a606b62d96e10ea45/docs/assets/Day18/grid_tkcon.png" width="1080" >
</p>

+ Ports are on the intersection of the horizontal and vertical tracks.
+ It ensures that the routes can reach the ports from x and y direction.
+ Verified that both input and output ports have fulfilled the guideline where input and output ports lies at the intersection of horizontal and vertical tracks

<p align="center">
  <img alt="grids.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/f730a87514ad10be31329a3a606b62d96e10ea45/docs/assets/Day18/grids.png" width="1080" >
</p>

**Lab2:**

- Define the  classes of ports using following commands i tkcon:

<p align="center">
  <img alt="portset.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/f730a87514ad10be31329a3a606b62d96e10ea45/docs/assets/Day18/portset.png" width="1080" >
</p>

- Save sky130A_invtharun.mag

<p align="center">
  <img alt="saveinvtharun.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/f730a87514ad10be31329a3a606b62d96e10ea45/docs/assets/Day18/saveinvtharun.png" width="1080" >
</p>

- Open the saved file using command `magic -T sky130A.tech sky130_invtharun.mag`.
- In tkcon use cmmand `lef write`.

<p align="center">
  <img alt="lefwrite.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/f730a87514ad10be31329a3a606b62d96e10ea45/docs/assets/Day18/lefwrite.png" width="1080" >
</p>

- Generated lef file:

<p align="center">
  <img alt="lefcontent.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/f730a87514ad10be31329a3a606b62d96e10ea45/docs/assets/Day18/lefcontent.png" width="1080" >
</p>

 **Lab3:**

- Commands used:

```
cd ~/Desktop/work/tools/openlane_working_dir/openlane/vsdstdcelldesign
cp sky130A_vsdinv.lef /Desktop/work/tools/openlane_working_dir/openlane/designs/picorv32a/src
cd ~/Desktop/work/tools/openlane_working_dir/openlane/vsdstdcelldesign/libs
cp sky130_fd_sc_hd__*  /Desktop/work/tools/openlane_working_dir/openlane/designs/picorv32a/src
cd ~/Desktop/work/tools/openlane_working_dir/openlane/designs/picorv32a/
vim config.tcl
``` 

- run the  synthesis


<p align="center">
  <img alt="synthdone.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/f730a87514ad10be31329a3a606b62d96e10ea45/docs/assets/Day18/synthdone.png" width="1080" >
</p>

 **Delay Tables:**

+ *In VLSI design, a delay table, often referred to as a delay model or delay characterization, is a critical component used to estimate the propagation delay of signals through various components of an integrated circuit (IC). The purpose of a delay table is to provide information about how long it takes for a signal to travel from one point to another within the IC.*

  - Timing Analysis: Delay tables are primarily used in timing analysis. They help designers ensure that signals meet the required setup and hold times, and that the circuit operates within specified performance parameters.
  - Input-to-Output Delay: A delay table typically provides information about the delay from the input of a component (like a logic gate or a flip-flop) to its output. This information helps designers understand how long it takes for a change at the input to affect the output.
  - Variation with Process and Temperature: Delay tables may include information about how the delay varies with process technology and temperature, as these factors can significantly affect the performance of the IC.
  - Rise and Fall Delays: The delay table often distinguishes between the rise and fall delays, as these can be different due to various reasons, including transistor characteristics and capacitance effects.
  - Load Capacitance: The delay of a component is often dependent on the load capacitance it drives. Therefore, delay tables may provide information for different load capacitance values.
  - Library Cells: Delay tables are associated with library cells, which are predefined logic functions with known delay characteristics. These libraries are used extensively in digital VLSI design.
  - Slew Rate: Some delay tables also provide information about the slew rate of signals, which is the rate of change of voltage with respect to time.
  - Path Delay: In addition to individual component delay, delay tables can also be used to estimate the delay of signal paths, helping designers understand the critical paths in their design.

+ Each type of cell will be having its own individual delay table, as the internal pmos and nmos width/length ratio gets varied, the resistance changes, then RC constant gets varied as well, meaning the delay of each cell gets varied.
+ The values of delay which are not available in the table are extrapolated based on the given data.
+ Similarly, we will also have a characterization table for input transition.
+ The latency at the endpoints will be the sum of the delays of each individual cell in that path.
+ The total skew value between two endpoints will be non-zero if the output load driven for a cell is varied, meaning different delay numbers are seen between endpoints, this is why it is preferred to have the nodes at each level driving the same load.
+ Another case in which we can retain the skew to be zero in the presence of varied load, is by using a different buffer size at the same level that can achieve the same level of delay as the other buffer in same level based on its delay table.
+ These are factors which should be looked into in the early stages of the clock tree design stage.
+ Now we must look into power aware CTS, where we have to consider endpoints which are only active under certain conditions.
+ In this case, we do not need to propagate the clock into those cells during the period of inactivity.

**Lab4:**

+ Use following switches from readme file to control the opetimization and other factors in synthesis.
  - SYNTH_STRATEGY: control the area and timing.
  - SYNTH_BUFFERING: control if we want to buffer high fanout net.
  - SYNTH_SIZING: control in cell sizing instead of buffering.
  - SYNTH_DRIVING_CELL: ensure more drive strength cell to drive input.
+ Use below commands in bash to set the switches:

```
echo $::env(SYNTH_STRATEGY)
set ::env(SYNTH_STRATEGY) "DELAY 0"
echo $::env(SYNTH_STRATEGY)
echo $::env(SYNTH_BUFFERING)
echo $::env(SYNTH_SIZING)
set ::env(SYNTH_SIZING) 1
echo $::env(SYNTH_SIZING)
echo $::env(SYNTH_DRIVING_CELL)
```

+ Delete the old neltist `rm -rf picorv32a.synthesis.v` and re run the synthesis `run_synthesis`
+ `run_floorplan`

<p align="center">
  <img alt="fpdone.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/f730a87514ad10be31329a3a606b62d96e10ea45/docs/assets/Day18/fpdone.png" width="1080" >
</p>

+ and `run_placement`.

<p align="center">
  <img alt="placedone.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/f730a87514ad10be31329a3a606b62d96e10ea45/docs/assets/Day18/placedone.png" width="1080" >
</p>

+ Now got to directory `/Desktop/work/tools/openlane_working_dir/openlane/designs/picorv32a/runs/13-01_14-09/results/placement` and use command `magic -T ~/Desktop/work/tools/openlane_working_dir/pdks/sky130A/libs.tech/magic/sky130A.tech lef read ../../tmp/merged.lef def read picorv32a.placement.def`

<p align="center">
  <img alt="magicdone.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/f730a87514ad10be31329a3a606b62d96e10ea45/docs/assets/Day18/magicdone.png" width="1080" >
</p>
 
</details>


<details>
<summary>Timing analysis with ideal clocks using openSTA</summary>

**Thoery:**

*Set-up and Hold Analysis:*

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

*Clock Jitter and skew:*

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
     
 *Clock Latency and Uncertainity:*
- Clock Latency: Clock latency refers to the delay or time it takes for a clock signal to propagate from its source (e.g., a clock generator) to its destination (e.g., a flip-flop or register) within a digital circuit.
- Source Latency: Source latency, also known as data source latency or producer latency, refers to the delay or time it takes for data to be generated or produced at the source before it is transmitted to the network or system.
- Network Latency:  Network latency, also known as communication latency or transmission latency, refers to the delay or time it takes for data to travel through a network or communication channel from the source to its destination.
- Clock Uncertainty: Clock uncertainty, also known as clock jitter or clock skew, represents the variation or uncertainty in the arrival time of a clock signal at different sequential elements (e.g., flip-flops) within a digital circuit.
- While doing synthesis both jitter and skew is present while post CTS jitter is present.

**Labs:**

 + First we need to write a pre_sta.conf file: 
   
<p align="center">
 <img width="1080" alt="presta_tcl.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/f730a87514ad10be31329a3a606b62d96e10ea45/docs/assets/Day18/presta_tcl.png">
 </p>

+ Then write the sdc file to setup constraints: 
<p align="center">
 <img width="1080" alt="presta_sdc.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/f730a87514ad10be31329a3a606b62d96e10ea45/docs/assets/Day18/presta_sdc.png">
 </p>

+ Now go to specified directory `cd ~/Desktop/work/tools/openlane_working_dir/openlane` and use command sta pre_sta.conf to run the sta.
+ Timing report of max delay path type:

<p align="center">
 <img width="1080" alt="presta_rep1.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/f730a87514ad10be31329a3a606b62d96e10ea45/docs/assets/Day18/presta_rep1.png">
 </p>

+ Timing report for min delay:

<p align="center">
 <img width="1080" alt="presta_rep2_min.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/f730a87514ad10be31329a3a606b62d96e10ea45/docs/assets/Day18/presta_rep2_min.png">
 </p>

+ Getting connections of a nets:

<p align="center">
 <img width="1080" alt="presta_repnet.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/f730a87514ad10be31329a3a606b62d96e10ea45/docs/assets/Day18/presta_repnet.png">
 </p> 

+ `report_checks -fields {net cap dlew input pins} -digits 4` :

<p align="center">
 <img width="1080" alt="presta_repchecks.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/f730a87514ad10be31329a3a606b62d96e10ea45/docs/assets/Day18/presta_repchecks.png">
 </p> 

</details>


<details>
<summary>Clock tree synthesis TritonCTS and signal integrity</summary>

**Theory:**

+ Clock tree routing and buffering using an H-tree algorithm is a common technique in VLSI design to efficiently distribute clock signals throughout an integrated circuit (IC).
   + Clock Tree Synthesis: Clock tree synthesis is a crucial step in digital VLSI design to ensure that clock signals are distributed uniformly and with minimal skew to all sequential elements (like flip-flops) within the IC.
   + H-Tree Algorithm: The H-tree algorithm is a well-known method for clock tree routing and buffering. It is named after the tree's shape, which resembles the letter "H." This algorithm helps in achieving a balanced and symmetrical clock distribution network, reducing clock skew.
        - Clock Source: The clock signal originates from a central source, typically an on-chip oscillator or phase-locked loop (PLL).
        - Buffer Insertion: Buffers (usually inverters) are inserted at strategic locations along the clock path to ensure a consistent and stable clock signal. Buffer insertion helps in managing clock skew and signal integrity.
        - Clock Routing: The H-tree structure is created by routing clock lines in a hierarchical fashion. The tree starts with a central trunk (the base of the "H") and branches out in a symmetrical manner.
        - Balanced Tree: The H-tree is designed to be balanced, meaning that the path lengths from the central source to any destination (flip-flop) are nearly identical. This minimizes clock skew.
        - Buffer Sizing: The size of the buffers (inverters) placed in the clock tree is carefully chosen to control the clock signal's rise and fall times and to optimize for power and performance. The buffer sizing should consider the load capacitance and delay requirements.
        - Tree Depth: The depth of the H-tree can be adjusted to match the clock distribution network's specific requirements and the IC's physical layout.
        - Tree Optimization: Advanced VLSI design tools often use optimization algorithms to minimize power consumption, minimize clock skew, and meet performance targets while adhering to the constraints of the H-tree structure.
        - Clock Gating: In some cases, clock gating cells may be inserted along the clock tree to enable the selective disabling of clock domains, reducing dynamic power consumption.
        - Final Verification: After clock tree routing and buffering, extensive verification and timing analysis are performed to ensure that the clock distribution meets the required timing constraints and that clock skew is within acceptable limits.
+ By employing the H-tree algorithm, designers can achieve a balanced and efficient clock distribution network, which is essential for reliable and high-performance operation in complex VLSI circuits, particularly in microprocessors and other digital systems where precise synchronization is critical.

**Labs on CTS:**

+ Use command `write_verilog ~/Desktop/work/tools/openlane_working_dir/openlane/designs/picorv32a/runs/<nameofyourrun>/results/synthesis/picorv32a.synthesis.v` to reflect the changes made on previous run.
+ Then perform `run_floorplan`, `run_placement` and `run_cts`.

<p align="center">
 <img width="1080" alt="cts_done.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/f730a87514ad10be31329a3a606b62d96e10ea45/docs/assets/Day18/cts_done.png">
 </p>

+ CTS output files are generated in `~/Desktop/work/tools/openlane_working_dir/openlane/designs/picorv32a/runs/<nameofyourrun>/results/cts/`.

<p align="center">
 <img width="1080" alt="cts_ls.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/f730a87514ad10be31329a3a606b62d96e10ea45/docs/assets/Day18/cts_ls.png">
 </p>

<p align="center">
 <img width="1080" alt="cts_pic.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/f730a87514ad10be31329a3a606b62d96e10ea45/docs/assets/Day18/cts_pic.png">
 </p>
+ To verify the CTS design use below commands
  
```
echo $::env(LIB_TYPICAL)
echo $::env(CURRENT_DEF)
echo $::env(CTS_MAX_CAP)
echo $::env(CTS_CLK_BUFFER_LIST)
echo $::env(CTS_ROOT_BUFFER)
```

<p align="center">
 <img width="1080" alt="cts_verif.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/f730a87514ad10be31329a3a606b62d96e10ea45/docs/assets/Day18/cts_verif.png">
 </p>

</details>


<details>
<summary>Timing analysis with real clocks using openSTA</summary>

+  Commands used: 

```
openroad                                                                                                       
read_lef designs/picorv32a/runs/16-10_08-16/tmp/merged.lef
read_def designs/picorv32a/runs/6-10_08-16/results/cts/picorv32a.cts.def
write_db pico_cts.db
read_db pico_cts.db
read_verilog designs/picorv32a/runs/crct2/results/synthesis/picorv32a.synthesis_cts.v
read_liberty -max $::env(OPENLANE_ROOT)/designs/picorv32a/src/sky130_fd_sc_hd__slow.lib
read_liberty -min $::env(OPENLANE_ROOT)/designs/picorv32a/src/sky130_fd_sc_hd__fast.lib
set_propagated_clock [all_clocks]
read_sdc designs/picorv32a/src/base.sdc
report_checks -path_delay min_max -format full_clock_expanded -digits 4
```
+ Max is Violating
<p align="center">
 <img width="1080" alt="timrep1_max.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/f730a87514ad10be31329a3a606b62d96e10ea45/docs/assets/Day18/timrep1_max.png">
 </p>

+ Min is Met

<p align="center">
 <img width="1080" alt="timrep1_min.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/f730a87514ad10be31329a3a606b62d96e10ea45/docs/assets/Day18/timrep1_min.png">
 </p>

+ To minimize the slack execute the STA with right timing library.
+ Commands used:

```
exit        (Exit openroad)
openroad
read_db pico_cts.db
read_verilog /openLANE_flow/designs/picorv32a/runs/16-10_08-16/results/synthesis/picorv32a.synthesis_cts.v
read_liberty $::env(LIB_SYNTH_COMPLETE)
link_design picorv32a
read_sdc designs/picorv32a/src/my_base.sdc
set_propagated_clock [all_clocks]
report_checks -path_delay min_max -fields {slew trans net cap input pin} -format full_clock_expanded
echo $::env(CTS_CLK_BUFFER_LIST)
```

<p align="center">
 <img width="1080" alt="timrep2_met.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/f730a87514ad10be31329a3a606b62d96e10ea45/docs/assets/Day18/timrep2_met.png">
 </p>

+ To see the bufferlist:

<p align="center">
 <img width="1080" alt="bufferlist.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/f730a87514ad10be31329a3a606b62d96e10ea45/docs/assets/Day18/bufferlist.png">
 </p>

+ To observe impact of  CTS buffers on setup and hold timing  we nee to run these in openlane using  placement def file.
+ Commands used:

```
exit 
echo $::env(CTS_CLK_BUFFER_LIST)
set ::env(CTS_CLK_BUFFER_LIST) [lreplace $::env(CTS_CLK_BUFFER_LIST) 0 0]
echo $::env(CURRENT_DEF)
set ::env(CURRENT_DEF) /openLANE_flow/designs/picorv32a/runs/13-01_14-09/results/placement/picorv32a.placement.def
run_cts
openroad
read_lef /openLANE_flow/designs/picorv32a/runs/13-01_14-09/tmp/merged.lef
read_def /openLANE_flow/designs/picorv32a/runs/13-01_14-09/results/cts/picorv32a.cts.def
write_db pico_cts1.db
read_db pico_cts1.db
read_verilog /openLANE_flow/designs/picorv32a/runs/13-01_14-09/results/synthesis/picorv32a.synthesis_cts.v
read_liberty $::env(LIB_SYNTH_COMPLETE)
link_design picorv32a
read_sdc designs/picorv32a/src/my_base.sdc
set_propagated_clock [all_clocks]
report_checks -path_delay min_max -fields {slew trans net cap input pin} -format full_clock_expanded
```

+ Max Slack
<p align="center">
 <img width="1080" alt="timrep_last1.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/f730a87514ad10be31329a3a606b62d96e10ea45/docs/assets/Day18/timrep_last1.png">
</p>

+ Min Slack
<p align="center">
 <img width="1080" alt="timrep_last_min.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/f730a87514ad10be31329a3a606b62d96e10ea45/docs/assets/Day18/timrep_last_min.png">
</p>

</details>

<details>
<summary>Missing Screenshot</summary>


 <p align="center">
 <img width="1080" alt="cell_in_synth.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/9f92c13f4b88a35d770c0a25e41150cdd4d9b9f3/docs/assets/Day18/cell_in_synth.png">
</p>

<p align="center">
 <img width="1080" alt="cell_in_magic.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/9f92c13f4b88a35d770c0a25e41150cdd4d9b9f3/docs/assets/Day18/cell_in_magic.png">
</p>
 
</details>

## Day-19 Final Step RTL to GDSII

<details>
<summary>Maze Routing</summary>

+ Maze routinng using lees algorithm:  
   - Lee's algorithm, also known as Lee's maze solving algorithm, is a simple and effective approach for routing in a maze-like grid. It's often used to find the shortest path from a start point to a goal point in a two-dimensional grid. Here's a basic explanation of how Lee's algorithm works for maze routing:
   - Grid Representation: The maze is represented as a 2D grid. Each cell in the grid is either an obstacle (representing walls) or open space through which the path can be routed.
   - Initialization:
       *  Create a grid of the same size as the maze, called a "routing grid."
       *  Initialize all cells to a special value (usually a large number) to represent unexplored cells.
       *  Mark the goal cell with a value of 0 to indicate the destination.
   - Wavefront Propagation:
       * Start from the goal cell (with a value of 0) and work outward.
       * For each cell, consider its unexplored neighbors (up, down, left, right), excluding obstacles and cells that have already been assigned a value.
       * Assign each unexplored neighboring cell a value one greater than the value of the current cell.
       * Repeat this process, incrementing the values as you move away from the goal, until the start cell is reached. This effectively "spreads" a wavefront from the goal to the start.
   - Path Construction:
       * Begin at the start cell.
       * Examine the neighboring cells, and move to the neighboring cell with the lowest value. This will guide you along the shortest path.
       * Repeat this process, moving from cell to cell, until you reach the goal cell.
   - Path Extraction:
       * The path from the start to the goal is now determined by following the cells with decreasing values.
+ Lee's algorithm is simple to implement and guarantees that the shortest path will be found because it explores cells in increasing order of distance from the goal. It can be applied in various scenarios, including maze solving and maze routing in VLSI design. However, it's essential to ensure that the grid doesn't have multiple equally short paths, as the algorithm does not differentiate between them and also  Lee's algorithm is a basic pathfinding algorithm and may not be the most efficient choice for very large and complex routing problems. For more advanced and optimized routing in VLSI design, dedicated tools and algorithms are often used.
 
</details>

<details>
<summary>Design Rule Checks</summary>

- Design Rule Checks (DRC) are a critical part of the VLSI design process. They are automated checks used to ensure that the physical layout of an integrated circuit adheres to the manufacturing and design rules.
- Design Rules: Design rules are a set of constraints and guidelines provided by the semiconductor fabrication process. These rules specify the minimum feature sizes, spacing requirements, layer stack configurations, and other parameters that must be followed to ensure manufacturability and functionality of the chip.
- Types of DRCs:
   + Geometry Checks: These checks ensure that the shapes, dimensions, and spacing of different layout elements (transistors, wires, contacts, etc.) conform to the specified design rules.
   + Spacing Rules: Checks for minimum spacing requirements between adjacent features to prevent short circuits or manufacturing defects.
   + Width Rules: Verifies that the width of conductors and other elements meets the minimum requirements.
   + Enclosure Rules: Ensures that one feature properly encloses or surrounds another, following specified rules.
   + Overlap Rules: Checks for any unauthorized overlaps between features.
   + Clearance Rules: Ensures that there is sufficient clearance between features to prevent electrical shorts.
   + Notch and Corner Rules: Checks for notches and corners in polygons to ensure they conform to design rules.
   + Layer-to-Layer Alignment: Verifies that different layers (metal, polysilicon, etc.) are correctly aligned.
   + Via and Contact Checks: Ensures the proper alignment and dimensions of vias and contacts.
   + Rule Decks: Design rule checks are performed based on rule decks, which contain detailed information about the design rules, layers, and specific checks required for a particular semiconductor process technology. Rule decks are often provided by semiconductor foundries.
- Automated Tools: DRCs are carried out using specialized software tools. These tools compare the layout against the rule deck and generate reports highlighting any violations. Commonly used DRC tools include Calibre, Hercules, and IC Validator.
- Fixing Violations: When DRC violations are identified, designers need to address them by modifying the layout. This may involve resizing, moving, or adjusting various layout elements to comply with the design rules.
- Iterative Process: The design rule checking process is typically iterative. Designers may perform DRCs at various stages of the design process to catch and fix issues as early as possible.
- Compliance and Sign-Off: Successful DRC compliance is a prerequisite for chip tape-out, where the final design is sent for manufacturing. The design must pass all DRC checks to ensure a high likelihood of manufacturing success.
 
</details>

<details>
<summary>Labs:</summary>

+ Commands to be used in openlane : 

```
echo $::env(CURRENT_DEF)   
gen_pdn                     
```

+ Error is thrown after `gen_pdn` command.

<p align="center">
 <img width="1080" alt="error_afterpdn.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/00af10918fa77a31d6922c8024d01b35ba190e1e/docs/assets/Day19/error_afterpdn.png">
</p>

+ Now use below commands : 

```
echo $::env(CURRENT_DEF)            (Ensure the def file of pdn has been created)
echo $::env(ROUTING_STRATEGY)
set ::env(CURRENT_DEF) <path_of_cts.def>
run_routing
```
+ Succesful completion of routing:
  
<p align="center">
 <img width="1080" alt="routedone.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/00af10918fa77a31d6922c8024d01b35ba190e1e/docs/assets/Day19/routedone.png">
</p>

+ Output  Files:

<p align="center">
 <img width="1080" alt="outputfile_routing.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/00af10918fa77a31d6922c8024d01b35ba190e1e/docs/assets/Day19/outputfile_routing.png">
</p>

<p align="center">
 <img width="1080" alt="routedone1.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/00af10918fa77a31d6922c8024d01b35ba190e1e/docs/assets/Day19/routedone1.png">
</p>

</details>


## Day-20-Floorplanning-and-power-planning-labs

<details>
<summary>Theory</summary>

+ Physical design is a process of transforming a logical design  into a physical layout that can be fabricated as an integrated circuit (IC). It involves defining the placement of various components and routing the connections between them while considering factors like timing, power, and area.
  - Floorplanning:
     * Block Placement: Deciding where different functional blocks, such as logic gates, memory cells, and other components, will be located on the chip.
     * Aspect Ratio: Determining the chip's aspect ratio (width-to-height ratio) based on design constraints and manufacturing requirements.
     * Floorplanning in ICC2 involves defining the chip's top-level organization, specifying the locations of different functional blocks, and optimizing the placement for factors like area, power, and timing.
  - Placement:
     * Standard Cell Placement: Placing standard cells (basic logic gates and flip-flops) within the chip area, optimizing for area, power, and timing.
     * Macro Placement: Positioning larger blocks or macros, such as memory arrays, processor cores, or analog components.
     * ICC2 provides advanced placement capabilities, allowing designers to place standard cells, macros, and custom components in the desired locations on the chip. It optimizes placement to meet various design goals.
  - Clock Tree Synthesis:
     * Designing and routing the clock distribution network to ensure clock signals reach all sequential elements with minimal skew and low power consumption.
     * The tool includes clock tree synthesis capabilities to create and optimize clock distribution networks, ensuring clock signals reach sequential elements with minimal skew.
  - Routing:
     * Global Routing: Determining the general paths for interconnections between components or blocks, considering factors like wirelength, congestion, and timing.
     * Detailed Routing: Performing a layer-by-layer routing of wires, including signal and power/ground nets, while adhering to design rules and avoiding crossovers.
     * ICC2 facilitates detailed routing, which involves creating wire connections between components, including both signal and power/ground routing. The tool optimizes the routing while adhering to design rules.
  - Power Distribution:
     * Creating a power distribution network to ensure all components receive adequate power and ground connections, while minimizing voltage drop and power dissipation.
     * Designers can define and optimize the power distribution network, ensuring power and ground are delivered efficiently while minimizing voltage drop and power dissipation.
  - Clock Tree Routing:
     * Routing clock signals to sequential elements while maintaining low skew and balancing the clock tree.
  - Design for Manufacturability:
     * Implementing design rules, such as design rule checks (DRCs) and layout vs. schematic (LVS) checks, to ensure the design can be accurately manufactured.
     * ICC2 integrates design rule checks (DRC) and layout vs. schematic (LVS) checks to ensure the design adheres to foundry-specific rules and is manufacturable.
  - Timing Closure:
     * Iteratively optimizing the design to meet the required timing constraints. This may involve adjusting buffer sizes, rerouting critical paths, and considering clock gating.
     * The tool provides timing analysis and optimization features to help designers achieve the required timing constraints. This may involve buffer sizing, clock tree optimization, and critical path analysis.
  - Power Optimization:
     * Implementing power-saving techniques like clock gating, voltage scaling, and power gating to minimize power consumption.
     * Designers can implement various power-saving techniques using ICC2, such as clock gating, power gating, and voltage scaling.
  - Signal Integrity:
     * Ensuring that signals are delivered without degradation and minimizing the impact of noise, crosstalk, and parasitic effects.
     * ICC2 includes features to address signal integrity issues, such as noise, crosstalk, and parasitic effects that can impact circuit performance.
  - Physical Verification:
     * Performing checks to ensure that the layout adheres to foundry-specific design rules, including DRC (Design Rule Check), LVS (Layout vs. Schematic), and ERC (Electrical Rule Check).
     * The tool performs physical verification checks to ensure the layout is compliant with foundry-specific rules and guidelines.
  - Extraction and Simulation:
     * Performing parasitic extraction to account for the effect of passive components (e.g., resistance and capacitance) on circuit performance.
     * Running simulations to validate the physical design's functionality and performance.
     * ICC2 enables parasitic extraction to account for passive components' effects and provides simulation capabilities for validation.
  - Tape-Out:
     * Preparing the final design for manufacturing by generating GDSII files, which are used to create photomasks for the fabrication process.
     * Once the physical design is complete, ICC2 assists in generating the necessary output files for the manufacturing process, such as GDSII files for photomask creation
       
</details>


<details>
<summary>Labs</summary>

+ Git clone following repositaries:

```
git clone https://github.com/manili/VSDBabySoC.git
git clone https://github.com/Devipriya1921/VSDBabySoC_ICC2.git
git clone https://github.com/bharath19-gs/synopsys_ICC2flow_130nm.git
git clone https://github.com/kunalg123/icc2_workshop_collaterals.git
git clone https://github.com/google/skywater-pdk-libs-sky130_fd_sc_hd.git
git clone https://github.com/kunalg123/sky130RTLDesignAndSynthesisWorkshop.git
``` 

**Synthesis:**

```
//Modify vsdbabysoc.tcl as per our directory path
# csh
# dc_shell
dc_shell>> source vsdbabysoc.tcl
```
**Outputs:**
+ Schematic of vsdbabysoc:

<p align="center">
 <img width="1080" alt="schematic1.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/11e11bf26854626c3d6b675283ca62d038b8e7b5/docs/assets/Day20/schematic1.png">
</p>

  
+ Schematic of core:

<p align="center">
 <img width="1080" alt="schematic.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/11e11bf26854626c3d6b675283ca62d038b8e7b5/docs/assets/Day20/schematic.png">
</p>

+ Report_area:

<p align="center">
 <img width="1080" alt="report_areaZ.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/a6248d5db8bd3e3b8ca417d18f1b3a8dfaafd701/docs/assets/Day21/report_areaZ.png">
</p>

+ Report_timing:

<p align="center">
 <img width="1080" alt="rep_time.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/11e11bf26854626c3d6b675283ca62d038b8e7b5/docs/assets/Day20/rep_time.png">
</p>

+ Report_power:

<p align="center">
 <img width="1080" alt="report_powerZ.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/a6248d5db8bd3e3b8ca417d18f1b3a8dfaafd701/docs/assets/Day21/report_powerZ.png">
</p>

**ICC2:**

+ Modify following files for your path
   - top.tcl
   - icc2_common_setup.tcl
   - icc2_dp_setup.tcl
   - init_design.read_parasitic_tech_example.tcl
   - init_design.mcmm_example.auto_expanded.tcl
   - pns_example.tcl

+ Invoke icc2_shell 

```
//Modify top.tcl as per our directory path
# csh
# icc2_shell
icc2_shell>> source top.tcl
icc2_shell>> start_gui
```
**Ouputs:**

+ Floorplanning done
  
<p align="center">
 <img width="1080" alt="icc2_done.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/11e11bf26854626c3d6b675283ca62d038b8e7b5/docs/assets/Day20/icc2_done.png">
</p>

+ Full schematic:
  
<p align="center">
 <img width="1080" alt="icc3_top1.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/11e11bf26854626c3d6b675283ca62d038b8e7b5/docs/assets/Day20/icc3_top1.png">
</p>

+ Schematic2:
  
<p align="center">
 <img width="1080" alt="icc3_top2.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/11e11bf26854626c3d6b675283ca62d038b8e7b5/docs/assets/Day20/icc3_top2.png">
</p>

+ Schematic3:
  
<p align="center">
 <img width="1080" alt="icc3_top3.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/11e11bf26854626c3d6b675283ca62d038b8e7b5/docs/assets/Day20/icc3_top3.png">
</p>

+ Timing report:
  
<p align="center">
 <img width="1080" alt="icc3_timrep1.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/11e11bf26854626c3d6b675283ca62d038b8e7b5/docs/assets/Day20/icc3_timrep1.png">
</p>


+ Observing for 40% of utilization: modify the  constraints and  rerun the script in dc_shell and generate reports and sdc.

<p align="center">
 <img width="1080" alt="icmod_40.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/11e11bf26854626c3d6b675283ca62d038b8e7b5/docs/assets/Day20/icmod_40.png">
</p>

+ Generated vsdbabysoc.sdc before and after modification:

<p align="center">
 <img width="1080" alt="sdcs.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/11e11bf26854626c3d6b675283ca62d038b8e7b5/docs/assets/Day20/sdcs.png">
</p>


+ Schematic1 :

<p align="center">
 <img width="1080" alt="icmod_top.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/11e11bf26854626c3d6b675283ca62d038b8e7b5/docs/assets/Day20/icmod_top.png">
</p>

+ Schematic2:
  
<p align="center">
 <img width="1080" alt="icmod_top1.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/11e11bf26854626c3d6b675283ca62d038b8e7b5/docs/assets/Day20/icmod_top1.png">
</p>

+ Report_constraints:
  
<p align="center">
 <img width="1080" alt="icmod_reptim.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/11e11bf26854626c3d6b675283ca62d038b8e7b5/docs/assets/Day20/icmod_reptim.png">
</p>

+ Max slack:
  
<p align="center">
 <img width="1080" alt="icmod_repmax.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/11e11bf26854626c3d6b675283ca62d038b8e7b5/docs/assets/Day20/icmod_repmax.png">
</p>

+ Min Slack:
  
<p align="center">
 <img width="1080" alt="icmod_repmin.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/11e11bf26854626c3d6b675283ca62d038b8e7b5/docs/assets/Day20/icmod_repmin.png">
</p>

+ Report_qor:

<p align="center">
 <img width="1080" alt="icmod_repqor.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/11e11bf26854626c3d6b675283ca62d038b8e7b5/docs/assets/Day20/icmod_repqor.png">
</p>

</Details>


## Day-21-Placement-and-CTS-labs

<details>
<summary>Theory</summary>

+ Placement in ICC2: Placement refers to the process of determining the physical locations of various components, such as standard cells, macros, and custom blocks, on the IC layout. ICC2 provides a range of features and capabilities for effective placement:
  - Global Placement: ICC2 performs initial global placement, which involves roughly positioning cells to optimize for area, timing, and power.
  - Incremental Placement: After global placement, incremental placement is performed to refine cell positions, reduce congestion, and optimize further for performance.
  - Congestion-Aware Placement: ICC2 takes into account congestion information to minimize the impact of high-density areas on the placement. It redistributes cells to balance congestion and optimize the design.
  - User Constraints: Designers can specify constraints, such as keep-out areas, blockages, and preferred locations for specific cells or macros.
  - Clock Domain Awareness: ICC2 considers clock domain relationships during placement to minimize clock tree skew and optimize clock distribution.
  - Soft Macros and Hard Macros: ICC2 can place both soft macros (which can be placed and sized by the tool) and hard macros (which are pre-defined and placed as-is) within the layout.

+ Clock Tree Synthesis (CTS) in ICC2: Clock Tree Synthesis is the process of designing and optimizing the clock distribution network in an IC layout, ensuring clock signals reach sequential elements with minimal skew. ICC2 offers comprehensive CTS capabilities:
  - Clock Planning: Designers can define clock domains, set clock frequency constraints, and specify the clock source. ICC2 uses this information to create an optimal clock tree.
  - Clock Tree Building: ICC2 generates the clock tree structure, including the clock buffers and clock distribution network, to deliver clock signals to all sequential elements.
  - Clock Skew Minimization: The tool optimizes the placement and sizing of clock buffers to minimize clock skew, ensuring that flip-flops across the chip are clocked at the same time.
  - Balancing Clock Trees: ICC2 balances the clock tree by considering variations in path lengths to minimize clock skew.
  - Clock Gating: The tool provides options for inserting clock gating cells when necessary to reduce power consumption.
  - Clock Tree Delay Optimization: ICC2 optimizes the clock tree for minimum delay while meeting setup and hold time requirements.

</details>


<details>
<summary>Labs</summary>

+ Floorplanning was run for utilization ratio of 0.07 and 0.4 and placement reports are analysed below:
+ Script top.tcl was modified as per our need:

<p align="center">
 <img width="1080" alt="topcts.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/f2e2404bc2391a81b5df9141acf36f9e38895f89/docs/assets/Day21/topcts.png">
</p>

**Outputs:**

+  check_design.pre_pin_placement

<p align="center">
 <img width="1080" alt="check_designZ.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/a6248d5db8bd3e3b8ca417d18f1b3a8dfaafd701/docs/assets/Day21/check_designZ.png">
</p>

+  report_port_placement.rpt

<p align="center">
 <img width="1080" alt="report_port_placmtZ.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/a6248d5db8bd3e3b8ca417d18f1b3a8dfaafd701/docs/assets/Day21/report_port_placmtZ.png">
</p>

+ report_placement

<p align="center">
 <img width="1080" alt="report_place.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/f2e2404bc2391a81b5df9141acf36f9e38895f89/docs/assets/Day21/report_place.png">
</p>

+ vsdbabysoc.post_estimated_timing.rpt

<p align="center">
 <img width="1080" alt="post_estimated_timrep.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/f2e2404bc2391a81b5df9141acf36f9e38895f89/docs/assets/Day21/post_estimated_timrep.png">
</p>

+ post_estimated_qor:

<p align="center">
 <img width="1080" alt="post_estimated_qor.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/f2e2404bc2391a81b5df9141acf36f9e38895f89/docs/assets/Day21/post_estimated_qor.png">
</p>

<p align="center">
 <img width="1080" alt="post_estimated_qor1.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/f2e2404bc2391a81b5df9141acf36f9e38895f89/docs/assets/Day21/post_estimated_qor1.png">
</p>

+ CTS Window showing {clk} connections:

<p align="center">
 <img width="1080" alt="clockpicZ.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/a6248d5db8bd3e3b8ca417d18f1b3a8dfaafd701/docs/assets/Day21/clockpicZ.png">
</p>

+ Clock tree(Util ratio : 0.07)

<p align="center">
 <img width="1080" alt="ctspic.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/f2e2404bc2391a81b5df9141acf36f9e38895f89/docs/assets/Day21/ctspic.png">
</p>

<p align="center">
 <img width="1080" alt="ctspic1.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/f2e2404bc2391a81b5df9141acf36f9e38895f89/docs/assets/Day21/ctspic1.png">
</p>

+ Clock tree(Util ratio : 0.4)

<p align="center">
 <img width="1080" alt="ctsoic_40m.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/f2e2404bc2391a81b5df9141acf36f9e38895f89/docs/assets/Day21/ctsoic_40m.png">
</p>

</details>

## Day-22-CTS-Analysis-Labs

<details>
<summary>Theory</summary>

**What is CTS?**

+ CTS(Clock Tree Synthesis)  is a crucial step in the physical design . Clock Tree Synthesis is the process of designing and optimizing the clock distribution network within an IC layout to ensure that clock signals are delivered to all the sequential elements, such as flip-flops or latches, with minimal skew and high integrity. 
   * Clock Distribution Network: In a digital IC, clock signals are critical for synchronization and proper operation. The clock distribution network consists of a hierarchy of buffers and wires that carry the clock signal from the clock source (often a clock generator) to all the flip-flops and other clocked elements across the chip.
   * Clock Skew: Clock skew refers to the difference in arrival times of the clock signal at different sequential elements. Excessive clock skew can lead to timing violations, and it needs to be minimized to ensure that all flip-flops are clocked simultaneously.
   * Clock Buffers: Clock buffers are used to amplify and distribute the clock signal. They help in reducing skew by driving the clock signal through multiple branches of the tree, ensuring that the clock signal reaches its destination with minimal delay.
   * Balancing Clock Paths: An essential goal of CTS is to balance the lengths of clock paths. This means that the clock signal should take approximately the same amount of time to reach all the flip-flops. Achieving balanced clock paths reduces clock skew and helps in meeting timing requirements.
   * Clock Gating: In some cases, clock gating cells may be inserted in the clock tree. These cells allow for selective disabling of clock domains to save power when certain parts of the circuit are not in use.
   * H-Tree or Other Structures: Depending on the design, clock trees can be organized in different structures. The H-tree structure is a common choice for balanced clock distribution. It resembles the letter "H" and ensures that clock signals travel symmetrically from a central point.
   * Clock Tree Optimization: CTS tools aim to optimize the clock tree for various objectives, including minimum skew, low power consumption, and meeting setup and hold time requirements.
   * Clock Domain Management: CTS also involves managing clock domains. Clock domains are regions of the chip that share a common clock source and timing constraints. It's important to ensure that clock domains are correctly defined and that clock signals are delivered to the appropriate domains.


**Various algorith used in CTS:**

1. Conventional tree based CTS.
    + Conventional CTS typically involves constructing a clock tree using simpler and more straightforward techniques compared to advanced and complex CTS methodologies.
    + Conventional CTS is a simpler and more traditional approach compared to advanced CTS techniques, which incorporate sophisticated algorithms for clock network optimization. It is often suitable for less complex designs or where specific optimizations are not required. However, in more advanced and high-performance ICs, or designs with multiple clock domains, advanced CTS techniques may be preferred to achieve better results in terms of clock skew, power consumption, and overall performance
2. Multisource CTS.
    +  Multi-source Clock Tree Synthesis (CTS) is a clock distribution technique used in the physical design especially in complex designs with multiple clock domains. In multi-source CTS, there are multiple clock sources, each serving a specific clock domain, and the clock tree synthesis process ensures that clock signals are distributed with low skew within each domain.
    +   Multi-source CTS is a complex and advanced technique, primarily used in modern IC designs with multiple clock domains to ensure synchronization, minimize clock skew, and manage power effectively. It is crucial for high-performance ICs where various functional blocks operate at different clock frequencies or require asynchronous clocking. Effective multi-source CTS requires sophisticated algorithms and tools to address the unique challenges posed by multiple clock domains in a single design.
3. H-tree CTS.
    + H-tree Clock Tree Synthesis (CTS) is a clock distribution technique used in the physical design. The H-tree structure, which resembles the letter "H," is employed to efficiently distribute clock signals to various regions of the chip while minimizing clock skew and maintaining signal integrity.
    + H-tree CTS is particularly useful in IC designs where synchronization and low clock skew are essential, and the design includes multiple clock domains or large on-chip areas. The hierarchical nature of the H-tree structure allows for efficient and uniform clock distribution, which is crucial for high-performance and reliable operation of the IC. It is one of several clock distribution network topologies used in VLSI design, alongside conventional tree-based structures and mesh-based networks, among others.
4. Mesh tree.
    + Mesh Clock Tree Synthesis (CTS) is a clock distribution technique used in the physical design. In mesh CTS, the clock distribution network is designed as a mesh-like grid, allowing for efficient and uniform clock signal distribution throughout the chip.
    + Mesh CTS is often used in IC designs where uniform clock distribution and low clock skew are crucial, particularly in complex designs with large chip areas. The mesh structure is known for its scalability and adaptability to different chip sizes and shapes. Mesh CTS is one of the several clock distribution network topologies used in VLSI design, alongside H-tree structures, conventional trees, and other techniques, depending on the specific design requirements and constraints.

**CTS Checks done:**

+ Skew
+ Pulse width
+ Duty cycle
+ Latency
+ Clock tree power
+ Signal integrity and Crosstalk
+ Timing analysis and fixing


</details>

<details>
<summary>Labs</summary>

+ Command: `check_clock_tree`
   - Checks the clock trees of current design for possible problems with netlist, timing constraints, clock constraints, routing constraints, or other tool configurations that can adversely impact clock tree synthesis.

<p align="center">
 <img width="1080" alt="check_clock_tree.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/d10e05e2c0b7d3830997410e5fd21a094fd7af09/docs/assets/Day22/check_clock_tree.png">
</p>

   - As we can see in above image there is no errors but only one warning under refence cells section.
   - CTS-904 means some clock refernce have no LEQ cell specified fo resizing.
   - This warning arise because tool cannot find cell of different size to replace with while performing optimization and this warning can be ignored as it wont affect further flow.

+ Command: `check_legality`
   -  This command checks he legality of current placement and output a report ofviolations statistics.
 
  <p align="center">
 <img width="1080" alt="check_legality.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/d10e05e2c0b7d3830997410e5fd21a094fd7af09/docs/assets/Day22/check_legality.png">
</p>
   
   - reported violations above can be classified as:

```
Two objects overlap.
A cell violates a pnet.
A cell is illegal at a site.
A cell is not aligned with a site.
A cell has an illegal orientation.
A cell spacing rule is violated.
A layer rule is violated.
A cell is in the wrong region.
Two cells violate cts margins.
Two cells violate coloring.
```

+ Command: `clock_opt`
   - The default behavior of this command is as follows:
        1. Synthesizes and optimizes the clock trees.
        2. Completes the detail routing of the clock trees.
        3. Further optimizes the design for timing,electrical  DRC  violations,
  area, power, and routability, based on actual propagated clock laten-
  cies, and legalizes the design placement.
   - Adjusts the I/O timing
   - Performs RC extraction of the clock nets and computes accurate clock arrival times
   - Performs placement and timing optimization.

<p align="center">
 <img width="1080" alt="clock_opt.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/d10e05e2c0b7d3830997410e5fd21a094fd7af09/docs/assets/Day22/clock_opt.png">
</p>

+ In above image we can see the clock_opt command being invoked in icc2_shell when top.tcl is sourced.

+ There are some default constraints that CTS used, refer to values  below

```
max_trans  - 0.5ns
max_cap    - 0.6pF
max_fanout - 2000
```
+ To modify these default constraints, use commands below
  - `set_clock_tree_options` : Specifies settings like target skew or latency  for  clocks,  exception
duplication across modes or fanout-based nondefault routing rule limit.
+ IC Compiler uses the CTS design rule constraints for all optimization phases, as well as for CTS

+ Command : `set cts_use_debug_mode true`
   - We can use ICC2 with debug mode with above command. 

+ Command : `report_clock_timing -type summary`
   - Specify  a  summary  report,  which  shows  the  worst instances  of transition time, latency and skew over the clock  networks or subnetworks of interest.

<p align="center">
 <img width="1080" alt="rep_ctim_summary.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/d10e05e2c0b7d3830997410e5fd21a094fd7af09/docs/assets/Day22/rep_ctim_summary.png">
</p>
   
   - rp-+ means rising transition(r), propagated clock(p) in the clock pin from launch to capture.
   - Clock Skew is the time difference between arrival of the same edge of a clock signal at the Clock pin of the capture flop and launch flop. Any signal takes some time to travel from one point to another. The time taken by Clock signal to reach from clock source to the clock pin of a particular flip flop is called as Clock latency. Clock skew can also be termed as the difference between the 'capture flop latency' and the 'launch flop latency'.
   - In this report we can find the maximum setup launch latency of 2.45 ns and Minimum setup capture latency of 2.21.
   - func1 is the corner whole flow PD flow was ran on and it represent corner sky130_fd_sc_hd__tt_025C_1v80.

+ Command : `report_clock_timing -type skew`
    - Specify a skew report.
<p align="center">
 <img width="1080" alt="rep_ctim_skew.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/d10e05e2c0b7d3830997410e5fd21a094fd7af09/docs/assets/Day22/rep_ctim_skew.png">
</p>

    * Skew is the differnce in arrival time of clock at launch flop and capture flop.
    * In our design we can see there's no skew.
    * Latency is found to be 3 as expected(latency was set based on sdc file generated  'set_clock_latency 1  [get_clocks clk]' and  'set_clock_latency -source 2 [get_clocks clk]' = 1+2=3)

+ Command : `report_clock_timing -type latency`

<p align="center">
 <img width="1080" alt="rep_ctim_latency.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/d10e05e2c0b7d3830997410e5fd21a094fd7af09/docs/assets/Day22/rep_ctim_latency.png">
</p>

    * Clock latency is the time taken by a clock signal to  move from the clock source to the clock pin of a particular flip-flop.
    * In sdc  command 'set_clock_latency 1  [get_clocks clk]'  is setting network latency to 1 and  command 'set_clock_latency -source 2 [get_clocks clk]' is setting source latencyto 2. same can be observed in above report.

+ Command : `report_global_timing`
     -  The  report_global_timing  command generates a top-level summary of the  timing for the design. The report shows the worst  negative  slack  per endpoint, the sum of all worst negative slacks per endpoint, and a number of violating endpoints. By default, each violating endpoint is onlycounted  one  time  and only one worst slack at each violating endpointcontributes to TNS and WNS. With the -groups option, each endpoint con-tributes  to  the worst negative slack and total negative slack of each group in which it has a violating slack.
     
<p align="center">
 <img width="1080" alt="rep_glob_timing.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/d10e05e2c0b7d3830997410e5fd21a094fd7af09/docs/assets/Day22/rep_glob_timing.png">
</p>

     -  From above report, we can observe 132 set-up violations and 326 hold violations in reg to reg path.
     -  Worst negative slack(WNS) for set-up is '-2.29' and hold is '-0.19'.
     -  Total negative slack(TNS) for set-up is '165.99' and hold is '14.19'.
 

+ Command : `report_clock_tree_option`

<p align="center">
 <img width="1080" alt="rep_clock_tree_option.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/bef0a716dcee9700c05b81f103ccd3b49cea4299/docs/assets/Day22/rep_clock_tree_option.png">
</p>

   + This  command  reports  all  existing  settings   like   clock   target skew/latency  constraints, fanout-based ndr, etc, previously defined by set_clock_tree_options commands.
   + Since none of the options are set its showing none. To set these options use command:
        - ` set_clock_tree_options -target_latency 3`
        - ` set_clock_tree_options -target_skew 0`
        - `set_clock_tree_options -root_ndr_fanout_limit 2000`
   + Now use the same command to report and below is the results

<p align="center">
 <img width="1080" alt="rep_clock_tree_option2.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/bef0a716dcee9700c05b81f103ccd3b49cea4299/docs/assets/Day22/rep_clock_tree_option2.png">
</p>

   + Now we can see all the constraints target skew, target latency and root NDR fanout limit are set t appropriate values. 

</details>


## Day-23-Clock-gating-technique
<details>
<summary>Theory</summary>

**Clock Gating Technique:**

<p align="center">
 <img width="1080" alt="cts.jpg" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/534a766f6419324c6f9b3435c47761b698043bc1/docs/assets/Day23/cts.jpg">
</p>

+ When the design is big and CTS is performed, large power usage will be reported. TO fix this issue whole chip is made into smaller section and each section will have it's own clock tree.
+ To address this problem clock gating technique can be used.

<p align="center">
 <img width="1080" alt="cgt.jpg" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/534a766f6419324c6f9b3435c47761b698043bc1/docs/assets/Day23/cgt.jpg">
</p>
  
+ Clock gating is a power-saving technique that can be applied as part of CTS in the physical design. When used in CTS, clock gating is primarily aimed at optimizing the clock distribution network to reduce dynamic power consumption. Here's how clock gating can be integrated into CTS:
    - Identifying Clock Domains: In the CTS process, clock gating is applied to specific clock domains within the IC design. These domains are identified based on functional requirements and usage patterns. For example, you may have a clock domain that can be gated when the corresponding block is in an idle state.
    - Clock Gating Cells: Clock gating cells, which are essentially logic gates, are inserted in the clock path of the clock domain. These cells control whether the clock signal is allowed to pass through to the sequential elements (e.g., flip-flops) within that domain.
    - Control Signals: Each clock gating cell has an associated control signal. When the control signal is active (e.g., logic high), the clock gating cell allows the clock to pass through. When the control signal is inactive (e.g., logic low), the clock is effectively blocked from reaching the sequential elements.
    - Timing Considerations: Careful consideration of timing constraints is essential when inserting clock gating cells. Timing analysis must ensure that gating the clock signal does not introduce setup and hold time violations for the sequential elements within the clock domain.
    - Activity-Based Gating: The control signals for the clock gating cells can be generated based on activity or specific conditions within the clock domain. For example, if the logic in the domain is idle or waiting for an event, the control signal can be set to block the clock.
    - Verification: Extensive simulation and verification are crucial to ensure that clock gating does not introduce functional issues, such as glitches or race conditions. Verification must validate the correct operation of the gating cells and their control logic.
+ By integrating clock gating into the CTS process, we  can achieve power savings by selectively disabling the clock signals to specific blocks or regions of the chip during idle or low-activity periods. This helps in meeting power efficiency and thermal management goals, which are critical in modern IC design. However, it's important to balance the benefits of power reduction with the added complexity and potential timing challenges introduced by clock gating.
+ Clock gating is introduced in synthesis stage and optimized when physical design starts.
+ Types of clock gating include AND Gate, OR Gate and Universal AND gate.


**Routing:**

<p align="center">
 <img width="1080" alt="routing.jpg" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/534a766f6419324c6f9b3435c47761b698043bc1/docs/assets/Day23/routing.jpg">
</p>

+ Routing  refers to the process of establishing interconnections between various components and modules on the chip to create a functional layout. It involves the design and creation of physical pathways for signals, power, and ground lines to ensure proper communication between components. 

  1. *Routing Grid*: The chip's surface is typically divided into a grid, and routing tracks or channels are defined within this grid. The grid structure simplifies the routing process, making it easier to manage.
  2. *Nets*: In IC design, a "net" is a set of connections that need to be routed together, such as a bus or a group of related signals. Each net has a source (driver) and one or more sinks (receivers) that must be connected.
  3. *Global Routing*: This is the initial phase of routing where major connections are established. Global routing identifies the general paths for signal, power, and ground distribution and minimizes congestion. It determines which layers of the chip will be used for routing.
  4. *Detailed Routing*: After global routing, detailed routing is performed. It involves the layer-by-layer routing of wires and the establishment of connections between components, often utilizing different metal layers to avoid congestion and interference.
  5. *Obstacle Avoidance*: Routing algorithms and tools must consider physical obstacles on the chip, such as macros, standard cells, and other fixed components, to avoid conflicts and ensure manufacturability.
  6. *Multi-Layer Routing: ICs often use multiple metal or poly layers for routing. Designers need to determine which layers to use and the order in which to route signals, taking into account considerations like signal integrity and power distribution.
  7. *Minimizing Crosstalk*: Care must be taken to minimize crosstalk between adjacent signal lines, which can lead to signal degradation. Techniques like spacing, shielding, and differential signaling can help reduce crosstalk
  8. *Routing Quality*: The quality of routing affects the chip's performance, power consumption, and manufacturability. Routing must meet design rule constraints and adhere to timing, signal integrity, and electromigration requirements.
  9. *Via Insertion*: Vias are used to transition between different metal layers. Via insertion is an important part of routing to ensure proper connections between layers. Via count and placement can significantly impact routing efficiency and performance.
  10. *Clock Routing*: Clock signals require special attention to ensure low skew and reliable distribution. Clock trees are constructed during routing to deliver clock signals to all sequential elements evenly.
  11. *Power Distribution*: Routing includes the creation of power distribution networks to deliver power and ground connections to all components, minimizing voltage drop and power dissipation.
  12. *Routing Optimization*: Routing algorithms and tools aim to optimize for various factors, such as wirelength, congestion, timing, and power, while adhering to design constraints.

</details>


<details>
<summary>Labs</summary>

+ P/G routing

<p align="center">
 <img width="1080" alt="pns.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/4f9efdc0cd75a11ed387bcc6dccdfacf00f6ae0b/docs/assets/Day23/pns.png">
</p>

  + `place_opt` is used to place and optimize the current design.
    
    - To perform coarse placement, physical optimization, and legalization with a single command, use the place_opt command.
    - This command supports multithreading and uses the number of threads specified by the set_host_options -max_cores command.
    - The place_opt command consists of the following stages:
         * Initial placement (initial_place): During this stage, the tool merges the clock-gating logic and performs coarse placement. If a block contains scan chains that are annotated by reading a SCANDEF file, the tool also performs scan chain optimization.
         * Initial DRC violation fixing (initial_drc): During this stage, the tool removes existing buffer trees and performs high-fanout-net synthesis and electrical DRC violation fixing.
         * Initial optimization (initial_opto): During this stage, the tool performs timing, area, congestion, and leakage-power optimization.
         * Final placement (final_place): During this stage, the tool performs incremental placement to improve timing and congestion, and legalizes the design.
         * Final optimization (final_opto):During this stage, the tool performs further optimization and legalization to improve timing and congestion.
    - When you run the place_opt command, by default, the tool runs all stages of placement and optimization.
    - To run these stages individually use command like `icc2_shell> place_opt -from initial_drc`
  + `clock_opt` is used to synthesize and route the clocks, and then further optimize the design based on the propagated clock latencies
  + `route_auto` is used to run global routing, trace assignment, and detailed routing at once/automatically

<p align="center">
 <img width="1080" alt="toptcl.jpg" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/4f9efdc0cd75a11ed387bcc6dccdfacf00f6ae0b/docs/assets/Day23/toptcl.png">
</p>

+ Routing and other reports:
   - Command  `report_pr_rules` : This command reports information about the cell row  spacing  rules in the specified technology object.

<p align="center">
 <img width="1080" alt="report_pr_rules.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/4f9efdc0cd75a11ed387bcc6dccdfacf00f6ae0b/docs/assets/Day23/report_pr_rules.png">
</p>
      
+ Previously there was an error while running placement to adress this issue use following solution:
   - Add below commands between `place_opt` and `clock_opt`.
 
```
set_lib_cell_purpose -include cts {sky130_fd_sc_hd__tt_025C_1v80/sky130_fd_sc_hd__buf_*}
synthesize_clock_tree
set_propagated_clock [all_clocks]
```
   - And change the volage value in `init_design.mcmm_example.auto_expanded.tcl` as follows: 

<p align="center">
 <img width="1080" alt="mcmmchanges.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/97719801679718d5e662b73d76cb73928cec9b9b/docs/assets/Day23/mcmmchanges.png">
</p>

   - Below are the images of layout in each stage:
         1) Floorplan:

<p align="center">
 <img width="1080" alt="floorplan.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/fb215ed4b9404a0581086127a1773a4a5b659904/docs/assets/Day23_u/floorplan.png">
</p>  
             - We can observe the hard macros being placed and spcaces reserved for standard cell.
	     
 	 2)  After Placement: 

<p align="center">
 <img width="1080" alt="placement.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/fb215ed4b9404a0581086127a1773a4a5b659904/docs/assets/Day23_u/placement.png">
</p>  
             - We can see standard cell placed(purple boxes)

         3) CTS: We can observe the CTS Buffer inserted in 'visual_mode' window on right side.

<p align="center">
 <img width="1080" alt="cts_done.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/ec869e6859974187c46ed610c1806195ac9f6d67/docs/assets/Day23/cts_done.png">
</p> 
              
	      - To view where buffers are inserted unselect all other option in above window and select CTS buffers  and apply the changes. 

       <p align="center">
 <img width="1080" alt="CTS_bufs.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/fb215ed4b9404a0581086127a1773a4a5b659904/docs/assets/Day23_u/CTS_bufs.png">
</p> 

         4) Post Routing: 

  <p align="center">
 <img width="1080" alt="routed.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/fb215ed4b9404a0581086127a1773a4a5b659904/docs/assets/Day23_u/routed.png">
</p> 

     - Above image shows the full routing and to see vias(left) and power/GND(right) rails refer to  below images: 

<p align="center">
  <img alt="vias.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/65bc6ae97ea4cda7f43cbb95dd526ab07d6ebaf9/docs/assets/Day23_u/vias.png" width="50%" >
&nbsp; &nbsp; &nbsp; &nbsp;
  <img alt="vdd_gnd.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/65bc6ae97ea4cda7f43cbb95dd526ab07d6ebaf9/docs/assets/Day23_u/vdd_gnd.png" width="50%">
&nbsp; &nbsp; &nbsp; &nbsp;
</p>

+ Timing Reports:

<p align="center">
  <img alt="remax.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/97719801679718d5e662b73d76cb73928cec9b9b/docs/assets/Day23/remax.png" width="60%" >
&nbsp; &nbsp; &nbsp; &nbsp;
  <img alt="remin.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/97719801679718d5e662b73d76cb73928cec9b9b/docs/assets/Day23/remin.png" width="40%">
&nbsp; &nbsp; &nbsp; &nbsp;
</p>

   - After proper running of place_opt clock_opt and route_auto, optimization is done properly.
   - Set-up  violations has reduced and slack got improved from '-2.91' to '0.00975'.
   - Similarly hold slack has improved from '-0.19' to '0.00798'.

</details>


## Day-24-Timing-violations-and-ECO

<details>
<summary>Theory</summary>

**Timing Violations:**

+ Timing violations in STA refer to situations where the actual timing behavior of a circuit does not meet the specified requirements, such as setup time, hold time, clock-to-q delay, or other timing constraints. Timing violations can lead to functional errors, performance issues, or even chip failures. Here are some  of timing violations in STA:
   - Setup Time Violation: This occurs when the data signal does not meet the setup time requirement for the receiving flip-flop or latch. In other words, the data arrives too late for the destination flip-flop to capture it correctly on the rising edge of the clock.
   - Hold Time Violation: A hold time violation happens when the data signal changes before the hold time requirement is met. In this case, the data changes too quickly after the clock edge, potentially causing metastability issues.
   - Clock-to-Q Violation: This violation pertains to the delay of a signal from a flip-flop's input to its output, which exceeds the specified clock-to-q time. If the clock-to-q time is too long, it can lead to data arriving too late at the flip-flop output.
   - Max and Min Pulse Width Violations: These violations occur when the data signals do not meet the specified minimum or maximum pulse width requirements. For instance, a signal may be required to stay high or low for a certain duration, and if it doesn't, a timing violation can occur.
   - Setup and Hold Check Violations: In some cases, STA tools will perform setup and hold checks concurrently to ensure that both setup time and hold time requirements are met. Violations in this context can include setup/hold overlap or window violations.
   - Data Path and Clock Path Violations: STA tools often differentiate between data path and clock path violations. Data path violations pertain to data signals and their associated timing, while clock path violations focus on the clock signal's timing, skew, and distribution.
   - Critical Path Violations: The critical path is the longest path in a digital circuit and often determines the maximum achievable clock frequency. Violations in the critical path indicate that the circuit does not meet the desired clock frequency, and the design may need optimization.
+ Negative Slack: Negative slack is a common metric in STA that represents how much a signal is failing to meet its timing requirements. A negative slack value indicates that the signal is violating its timing constraints.
+ Timing violations can be addressed by various methods, including design optimization, clock tree synthesis, adjusting clock frequency, buffering signals, or making changes to the physical layout. STA tools help designers identify and correct these violations by analyzing the circuit's timing paths and proposing solutions to meet the desired timing constraints.

**ECO:** 

+ ECO (Engineering Change Order) in physical design refers to the process of making modifications or changes to the physical layout of the chip after the initial design has been completed. ECOs are typically necessary to fix issues, make optimizations, or adapt the design to meet changing requirements without having to redo the entire design from scratch. Here are some key aspects of ECO in physical design:
+ Reasons for ECO:
  - Functional Corrections: ECOs are often needed to address functional errors or bugs discovered during the verification phase.
  - Performance Optimization: To improve the chip's performance, ECOs can involve changes to critical paths, clock distribution, or power consumption.
  - Changes in Requirements: Sometimes, project requirements change after the initial design, necessitating modifications to the layout.
  - Silicon Fabrication Issues: ECOs may address issues that arise during the manufacturing process, like metal layer incompatibilities or defects.
+ ECO Phases:
  - Analysis: The first step involves identifying the need for an ECO and understanding the changes required. This typically involves timing and physical analysis.
  - Planning: Designers plan the modifications, considering their impact on the rest of the design, including area, power, and timing.
  - Implementation: Changes are made to the layout, which may involve adding, moving, or removing components like gates, wires, or vias.
  - Verification: After ECO implementation, thorough verification is essential to ensure that the changes meet the intended goals and don't introduce new issues.
  - Documentation: All changes made through ECO need to be documented, both for tracking and for future reference.
+ Tools and Methodology:
  - ECOs are facilitated by specialized EDA (Electronic Design Automation) tools that can efficiently analyze, plan, and implement changes in the layout.
  - Tools for physical design, such as place-and-route, DRC (Design Rule Checking), and STA (Static Timing Analysis), are used in conjunction with ECO tools to ensure that changes do not introduce new issues.
+ Types of ECO:
  - Standard ECO: These are typical engineering changes to address issues or make improvements.
  - Functional ECO: Focused on fixing functional bugs.
  - Timing ECO: Focused on improving timing closure.
  - Clock Tree ECO: Addressing issues related to clock distribution.
  - Power ECO: Focused on reducing power consumption.
+ Timing Closure: Timing is a critical aspect of ECO in physical design. Changes should not only fix issues but also ensure that the design still meets its timing constraints.
+ Iteration: ECOs can sometimes result in new issues, so iterative loops of analysis, planning, and implementation are common until the design meets all the requirements.
+ ECOs are an essential part of the chip design process, allowing designers to make necessary adjustments without starting from scratch. However, managing ECOs effectively is a complex task, as changes can have cascading effects throughout the design. Careful planning and verification are crucial to ensure that the modified design is both functionally correct and meets performance, power, and other requirements.
</details>

<details>
<summary>Lab: Set-up and Hold Analysis before solving violations</summary>

+ Timing violations are resolved using two methods in this design, sizing the cell and inserting buffer/inveretr pairs.
+ Sizing the cell:
    - command: `size_cell <cell_to_be_replaced> <lib_cell_to_be_replaced_with>`
    - Incase of set-up violations we can up-size the cells (increase the drive strenght of of cell => decreases the delay)
+ Inserting a buffer:
    - command: `insert_buffer <pin_where_buffer_is_inserted> <lib_cell-buffer/buffer>`
    - To remove the buffer use command `remove_buffer <name_of_inserted_buffer>`
+ Below is the analysis of various reports before reducing violations.
 
+ *Timing analysis :* 
  * command: `report_global_timing -significant_digits 4`

<p align="center">
 <img width="1080" alt="report_glob_b.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/36de71e88ffd978d9793e648f91d3f9ab0ea9089/docs/assets/Day24/report_glob_b.png">
</p>

  * In above report for set-up case, we can observe  worst negative slack(WNS) is '-0.09', total negative slack(TNS) is -0.83 and total violations of 15.
  * All the set-up violations are found in reg2reg path. (reg-to-reg is a path where  both startpoint and endpoint are sequential elements; i.e. either an edge-triggered element or a level sensitive element.)
  * No Hold Violations are there in this designs.  
  * Command: `report_timing -capacitance -transition_time -significant_digits 4 -delay_type <max_or_min>`
 
<p align="center">
 <img width="1080" alt="report_time_b.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/36de71e88ffd978d9793e648f91d3f9ab0ea9089/docs/assets/Day24/report_time_b.png">
</p> 
 
  * In above report we can observe that set-up is  violating with the slack of '-0.0871' and  hold is met with slack of '0.015'.
  * We can observe that cells with lower drive strength are offering huge increment(delay).
  * We can also observe that cells like core/U470 has huge capacitance which might be caused due to high fanout.
  * Attribute 'r' means rising signal and 'f' means falling signal to that particular pin.
  * Its possible to see this timing path in layout using gui of icc2_shell:
  * In Layout:

<p align="center">
 <img width="1080" alt="worst_path.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/36de71e88ffd978d9793e648f91d3f9ab0ea9089/docs/assets/Day24/worst_path.png">
</p>

  * In schematic:

<p align="center">
 <img width="1080" alt="worst_path_sch.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/36de71e88ffd978d9793e648f91d3f9ab0ea9089/docs/assets/Day24/worst_path_sch.png">
</p> 

**Note:**
+ To ease up the set-up analysis two cells core/U617(incr = 0.1822) and core/315(incr = 0.3852) are selected for resizing based in delay they are providing.
+ Above names are instance name , to get refence name i.e library cell attached to it use below command:

```
icc2_shell>>  get_lib_cells -of_objects [get_cells core/U617]
{sky130_fd_sc_hd__tt_025C_1v80/sky130_fd_sc_hd__xor2_1} 
icc2_shell>> get_lib_cells -of_objects [get_cells core/U315]
{sky130_fd_sc_hd__tt_025C_1v80/sky130_fd_sc_hd__nand2_1}
```

+ *Power analysis:*
  * command: ` report_power -significant_digits 5`.

<p align="center">
 <img width="1080" alt="report_power_b.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/36de71e88ffd978d9793e648f91d3f9ab0ea9089/docs/assets/Day24/report_power_b.png">
</p> 

  * Dynamic power(Total Power) consumption occurs when signals which go through the CMOS circuits change their logic state charging and discharging of output node capacitor.
  * In our design, dynamic power = 4.2806 x 10<sup>06</sup> nW.
  * Leakage power consumption is the power consumed by the sub threshold currents and by reverse biased diodes in a CMOS transistor.
  * Leakage power =  6.3970 x 10<sup>01</sup> nW
  * Internal power is the power  consumed by the cell when an input changes, but output does not change.
  * Internal power = 2.8022 x 10<sup>06</sup> nW
  * Switching power dissipation is due to the charging and discharging of total load, which includes the output capacitors and other parasitic capacitors.
  * Net Switching Power    = 1.4784 x 10<sup>06</sup> nW

 +  To get power consumption the two cells selected for resizing use command `report_power -cell_power core/U617` and `report_power -cell_power core/U315` .

<p align="center">
 <img width="1080" alt="report_power_cell_b.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/36de71e88ffd978d9793e648f91d3f9ab0ea9089/docs/assets/Day24/report_power_cell_b.png">
</p> 

   + Cell U315 = 7.2945 x 10<sup>02</sup> nW.
   + Cell U617 = 1.2846 x 10<sup>02</sup> nW.
+ *Area analysis:*

<p align="center">
 <img width="1080" alt="report_qor_b.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/36de71e88ffd978d9793e648f91d3f9ab0ea9089/docs/assets/Day24/report_qor_b.png">
</p> 

  * To get the area of two cells selected for resizing use command `report_area` But as that command is disabled to get the area of individual cell source below tcl script in icc2_shell and invoke function  area_logic_hierarchy to some file and find the area of your cell.

<p align="center">
 <img width="1080" alt="area_tcl.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/36de71e88ffd978d9793e648f91d3f9ab0ea9089/docs/assets/Day24/area_tcl.png">
</p> 

[source: https://solvnet.synopsys.com/]
 * After sourcing the above file, call the function area_logic_hierarchy and push the data to some file, then using command `grep` find the cell area in that file.

<p align="center">
 <img width="1080" alt="area_before.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/36de71e88ffd978d9793e648f91d3f9ab0ea9089/docs/assets/Day24/area_before.png">
</p> 

*Other violations in design:*
+ Command: `report_constraint `.

<p align="center">
 <img width="1080" alt="report_constraint_b.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/36de71e88ffd978d9793e648f91d3f9ab0ea9089/docs/assets/Day24/report_constraint_b.png">
</p> 
  
  * Here we can observe that max trans and max cap is violating with cost of 0.21 and 0.02 respectively.
 
</details>

<details>
<summary>Lab: Solving the violations</summary>

*Set-up violations*
+ As discussed in above section, set-up is  violating with the slack of '-0.0871'.
+ To reduce the slack we have selected two cells that are contrubuting more delay for resizing.
+ Commands used are :

```
//To get the refernce name(lib cell)
icc2_shell>>  get_lib_cells -of_objects [get_cells core/U617]
{sky130_fd_sc_hd__tt_025C_1v80/sky130_fd_sc_hd__xor2_1} 
icc2_shell>> get_lib_cells -of_objects [get_cells core/U315]
{sky130_fd_sc_hd__tt_025C_1v80/sky130_fd_sc_hd__nand2_1}
//Now resize 
icc2_shell>> size_cell core/U617 sky130_fd_sc_hd__xor2_2
1
icc2_shell>> size_cell core/U315 sky130_fd_sc_hd__nand2_2
1
```

*Hold Violation*
+ As observed in timing reports, there are 0 hold violations.
+ But to observe the trend of slack variation(increasing the slack) buffer has been inserted and later reports are analysed.
+ Command used to insert the buffer at pin 'core/U1935/X' : ` insert_buffer core/U1935/X sky130_fd_sc_hd__tt_025C_1v80/sky130_fd_sc_hd__buf_1`
*Max transition violations*
* To see details about violations and pins that are reponsible for these violations use command `report_constraints -max_transition -all_violators`.

<p align="center">
 <img width="1080" alt="report_constraint_all.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/36de71e88ffd978d9793e648f91d3f9ab0ea9089/docs/assets/Day24/report_constraint_all.png">
</p> 

* Here we can observe the various nets that are causing the violations along with thier slack.
* To resolve this issue we can either increse the drive strength of cell that's driving the net or insert buffers with high drive strength after that net.
* Following commands are used to reduce these violations:

```
//getting buffer cell of higher drive strength
icc2_shell>>  get_lib_cells *buf_4*
{sky130_fd_sc_hd__tt_025C_1v80/sky130_fd_sc_hd__buf_4 ..........}
icc2_shell>>  insert_buffer core/n1501 sky130_fd_sc_hd__tt_025C_1v80/sky130_fd_sc_hd__buf_4
icc2_shell>>  insert_buffer core/n1518 sky130_fd_sc_hd__tt_025C_1v80/sky130_fd_sc_hd__buf_4
icc2_shell>>  insert_buffer core/n1479 sky130_fd_sc_hd__tt_025C_1v80/sky130_fd_sc_hd__buf_4
icc2_shell>>  insert_buffer core/n1493  sky130_fd_sc_hd__tt_025C_1v80/sky130_fd_sc_hd__buf_4
icc2_shell>>  insert_buffer core/n1568  sky130_fd_sc_hd__tt_025C_1v80/sky130_fd_sc_hd__buf_4
icc2_shell>>  insert_buffer core/ZBUF_448_0  sky130_fd_sc_hd__tt_025C_1v80/sky130_fd_sc_hd__buf_4
``` 

</details>

<details>
<summary>Lab: Set-up and Hold Analysis after solving violations:</summary>

+ *Timing analysis :* 
  * command: `report_global_timing -significant_digits 4`

<p align="center">
 <img width="1080" alt="report_glob_a.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/36de71e88ffd978d9793e648f91d3f9ab0ea9089/docs/assets/Day24/report_glob_a.png">
</p>

  * In above report we can observe that no set-up and hold violations are present

*Set-up:*
  * Command: `report_timing -capacitance -transition_time -significant_digits 4 -delay_type max -through core/U315`
 
<p align="center">
 <img width="1080" alt="rep_max_after.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/36de71e88ffd978d9793e648f91d3f9ab0ea9089/docs/assets/Day24/rep_max_after.png">
</p> 
 
  * In above report we can observe that set-up  slack has incresed from '-0.0871' to '0.0888'.
  * Thus resizing the cells of combinational network has helped in reducing the violations.

*Hold:*
  * Command: `report_timing -capacitance -transition_time -significant_digits 4 -delay_type min `
 
<p align="center">
 <img width="1080" alt="report_time_min_ab.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/36de71e88ffd978d9793e648f91d3f9ab0ea9089/docs/assets/Day24/report_time_min_ab.png">
</p> 
 
  * In above report we can observe that hold  slack has improved from from '0.0015' to '0.0787'.
  * Thus inserting the buffer cell has helped in reducing the violations.
  * We can also observe the buffer cell `core/eco_cell` inserted (highlighted) in our timing path.

*Max transition*
+ Command: `report_constraint `.

<p align="center">
 <img width="1080" alt="report_constraint_after1.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/36de71e88ffd978d9793e648f91d3f9ab0ea9089/docs/assets/Day24/report_constraint_after1.png">
</p> 
  
  * Here we can observe that max trans and max cap has been reduced to zero from  violating with slack of -0.21 and -0.02.
+ *Power analysis:*
  * command: ` report_power -significant_digits 5`.

<p align="center">
 <img width="1080"  alt="report_power_a.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/36de71e88ffd978d9793e648f91d3f9ab0ea9089/docs/assets/Day24/report_power_a.png">
</p> 

  * Total power has incresed from  4.2806 x 10<sup>06</sup> nW to  4.2832 x 10<sup>06</sup> because of resizing and buffer insertion.
 +  To get power consumption the two cells selected for resizing use command `report_power -cell_power core/U617` and `report_power -cell_power core/U315` .

<p align="center">
 <img width="1080" alt="report_power_cell_a.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/36de71e88ffd978d9793e648f91d3f9ab0ea9089/docs/assets/Day24/report_power_cell_a.png" >
</p> 

   + Cell U315 = 7.2945 x 10<sup>02</sup> nW increased to  7.5607 x 10<sup>02</sup>
   + Cell U617 = 1.2846 x 10<sup>02</sup> nW increaded to  1.9930 x 10<sup>02</sup>
+ *Area analysis:*
  * Command: `report_qor`

<p align="center">
 <img width="1080" alt="report_qor_a.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/36de71e88ffd978d9793e648f91d3f9ab0ea9089/docs/assets/Day24/report_qor_a.png">
</p> 

  * Area has increased from 954536.18 to 954616.14.
  * We can also observe that buffers count  has increased to 104 from 97 previously.
  * To get the area of two cells selected for resizing use above mentioned steps.

<p align="center">
 <img width="1080" alt="area_after.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/36de71e88ffd978d9793e648f91d3f9ab0ea9089/docs/assets/Day24/area_after.png">
</p> 

  * Area of cell U315 has increased from 3.7536 to 6.2560.
  * Area of cell U617 has increased from 8.7584 to 16.2656.
  * Reason of above changes is due to resizing of the cells to cells with higher drive strength.
 
</details>
