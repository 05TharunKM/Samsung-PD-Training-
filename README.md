
# Samsung-PD-Training
This github repository summarizes the progress made in the samsung PD training. Quick links:

- [Day-0-Tool-Setup-Check](#Day-0-Tool-Setup-Check)
- [Day-1-Introduction-to-Verilog-RTL-design-and-Synthesis](#Day-1-Introduction-to-Verilog-RTL-design-and-Synthesis)
- [Day-2-Timing-libs-hierarchical-vs-flat-synthesis-and-efficient-flop-coding-styles](#Day-2-Timing-libs-hierarchical-vs-flat-synthesis-and-efficient-flop-coding-styles)
 
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

Timing libraries provide a  set of timing information for standard cells. This information includes delay, setup time, hold time, area, power  and other parameters that are critical for accurately estimating the performance of the circuit.

    During the synthesis stage, the design is translated from a HDL code into a gate-level netlist. Timing libraries enable the synthesis tool to make informed decisions about cell selection and placement, optimizing the design for factors like speed, power consumption, or area and also meet timimng requirement. Fabrication processes also introduce variability due to various factors. Timing libraries incorporate these variations, offering libraries for different process corners, voltages, and temperatures(PVT). 

  Below is the screenshot of different types of nand gate: 

<img width="1080" alt="libs.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/373c74c4e290f8fe355dc012d2724a13d1a4f64e/docs/assets/images2/libs.png">

  As we can see in above image, a nand gate of three different flavours are selected for discussion. Since nand is "!A&B", four different combinations of input is given along with specific leakage power. As the area is increase the delay of the cells is decrease but the power will increase. Therefore while selecting cell, synthesis tool will look for optimal cell so that it will satisfy both power, area and timing requirement.  

</details>

 <details>
  <summary>Hierarchical vs flat synthesis</summary>
 
 Multiple_module verilog RTL file: 
  
<img width="1080" alt="mm_rtl.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/373c74c4e290f8fe355dc012d2724a13d1a4f64e/docs/assets/images2/mm_rtl.png">
  
Hierarchical Synthesis: Hierarchical synthesis divides the design into smaller modules or blocks. These blocks can be synthesized independently and reused across multiple projects. It allows us to handle the complexity by breaking it down into manageable pieces and focusing on optimizing individual blocks. Below is the sample of hierarchical synthesis:

<img width="1080" alt="mm_heirsynth.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/373c74c4e290f8fe355dc012d2724a13d1a4f64e/docs/assets/images2/mm_heirsynth.png">

In above verilog file we can see multiple sub module as part of netlist , hence when synthesized (hierarchical)  we can see tool has synthesized all the individual module. Even in the schematic attached below we can see two sub module inside the main multiple module file.  

<img width="1080" alt="heir_sch.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/373c74c4e290f8fe355dc012d2724a13d1a4f64e/docs/assets/images2/heir_sch.png">

  Flat Synthesis: In a flat synthesis approach, the entire design is treated as a single entity, with all modules and components being synthesized together. This approach is simpler to set up and manage for small designs. Command used to perform flat synthesis is "flatten". Below is the figure of flat synthesis netlist:

<img width="1080" alt="mm_flatsynth.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/373c74c4e290f8fe355dc012d2724a13d1a4f64e/docs/assets/images2/mm_flatsynth.png">

 As we can see in the above netlist all the sub module is combined i.e all the modules are synthesized together. flat synthesis makes debugging  easier since  all the design components are synthesized together, making it straightforward to trace signals across the design. Below is the schematic of flat synthesized netlist: 

 <img width="1080" alt="flat_sch.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/373c74c4e290f8fe355dc012d2724a13d1a4f64e/docs/assets/images2/flat_sch.png">

Sometimes instead synthesizing the whole design, it is useful to synthesize individual module. This is the case useful when there are same modules used multiple times so synthesizing one of those module and reusing the same again will save resources as well as time. To do this, while performing synthesis define top module as that one module you want to synthesize. Below is the synthesized netlist of the same: 
<img width="1080" alt="ss_synth.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/373c74c4e290f8fe355dc012d2724a13d1a4f64e/docs/assets/images2/ss_synth.png">
 
</details>

<details>
<summary>Efficient flop coding styles</summary>

 D Flip-flops are  memory storage elements used for data processing. D flip-flop can be built using NAND gate or with NOR gate. There are different methods to build these flip flop and they are discussed below:

 1. D flip flop with asynchronous reset:
 
 <img width="1080" alt="dff_arrtl.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/373c74c4e290f8fe355dc012d2724a13d1a4f64e/docs/assets/images2/dff_arrtl.png">

 In this type of flip flop, flip flop can be reset at any time irrespective of clock edge but latching data (D - Q pin) will still be dependent on sensitive clock edge. Below is the waveform and schematic of the flip flop:  
  
  <img width="1080" alt="dff_arwv.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/373c74c4e290f8fe355dc012d2724a13d1a4f64e/docs/assets/images2/dff_arwv.png">
  As per the description above , when the reset is going from '1' to '0' data from d is latched into flip flop at next clock edge and when the reset pin is going from '0' to '1' it is reset to '0' immediately without waiting for next clock cycle. Schematic of the same is attached below : 

  <img width="1080" alt="dff_arsch.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/373c74c4e290f8fe355dc012d2724a13d1a4f64e/docs/assets/images2/dff_arsch.png">

 Since the available D flip flop in library has active low reset and one we designed is active high reset, a inverter cell is added by synthesis tool. 

  2. D flip flop with asynchronous set:
 
 <img width="1080" alt="dff_asrtl.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/373c74c4e290f8fe355dc012d2724a13d1a4f64e/docs/assets/images2/dff_asrtl.png">

 In this type of flip flop, flip flop can be set at any time irrespective of clock edge but latching data (D - Q pin) will still be dependent on sensitive clock edge. Below is the waveform and schematic of the flip flop:  
  
  <img width="1080" alt="dff_aswv.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/373c74c4e290f8fe355dc012d2724a13d1a4f64e/docs/assets/images2/dff_aswv.png">
  As per the description above , when the set is going from '1' to '0' data from d is latched into flip flop at next clock edge and when the set pin is going from '0' to '1' it is set to '1' immediately without waiting for next clock cycle. Schematic of the same is attached below : 

  <img width="1080" alt="dff_assch.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/373c74c4e290f8fe355dc012d2724a13d1a4f64e/docs/assets/images2/dff_assch.png">

  3. D flip flop with synchronous reset:
 
 <img width="1080" alt="dff_srrtl.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/373c74c4e290f8fe355dc012d2724a13d1a4f64e/docs/assets/images2/dff_srrtl.png">

 In this type of flip flop, setting and resetting is  dependent on  clock edge. Below is the waveform and schematic of the flip flop:  
  
  <img width="1080" alt="dff_srwv.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/373c74c4e290f8fe355dc012d2724a13d1a4f64e/docs/assets/images2/dff_srwv.png">
  As per the description above , when the reset is going from '1' to '0' data from d is latched into flip flop at next clock edge and when the reset pin is going from '0' to '1' it is reset to '0' in next clock cycle. Schematic of the same is attached below : 

  <img width="1080" alt="dff_srsch.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/373c74c4e290f8fe355dc012d2724a13d1a4f64e/docs/assets/images2/dff_srsch.png">
  
</details>

<details>
<summary>Optimization</summary>
 In this section, Optimization techniques used by synthesis tool  are discussed. Two designs - mult2 and mult8. RTL code for the same is attched below : 
 
 <img width="1080" alt="mul2mul8.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/373c74c4e290f8fe355dc012d2724a13d1a4f64e/docs/assets/images2/mul2mul8.png">
Below is truth table for mult2 module in which 3 bit input is multiplied with 2 and 4 bit output is generated.
```
$a[2]-a[1]-a[0] * 2  y[3]-y[2]-y[1]-y[0]
$  0 - 0  - 0          0 - 0  - 0 - 0
$  0 - 0  - 1          0 - 0  - 1 - 0
$  0 - 1  - 0          0 - 1  - 0 - 0
$  0 - 1  - 1          0 - 1  - 1 - 0
$  1 - 0  - 0          1 - 0  - 0 - 0
$  1 - 0  - 1          1 - 0  - 1 - 0
$  1 - 1  - 0          1 - 1  - 0 - 0
$  1 - 1  - 1          1 - 1  - 1 - 0
```
As we can see from above table,  design doesn't neccesarily need any logic cell/modules to operate, output is just input left shifted by one bit. therefore when synthesized, it will show that no logic cells are there to synthesize. Below is the schematic and netlist generated after synthesis : 

 <img width="1080" alt="mul2synth.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/373c74c4e290f8fe355dc012d2724a13d1a4f64e/docs/assets/images2/mul2synth.png">
 <img width="1080" alt="mul2sch.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/373c74c4e290f8fe355dc012d2724a13d1a4f64e/docs/assets/images2/mul2sch.png">
In this schematic, we can observe that input pins a[2],a[1],a[0] are directly connected to  y[3],y[2],y[1] and logic '0' is connected to y[0] and no standard cells are used.

Similarly, Mult8 is synthesized and it is is obvious that output is just input left shifted by 3 bits. Therefore there are no modules or cells synthesizable in design. Below is the schematic and netlist of the mult8 module: 
 
 <img width="1080" alt="mul8_synth.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/373c74c4e290f8fe355dc012d2724a13d1a4f64e/docs/assets/images2/mul8_synth.png">
 <img width="1080" alt="mul8_sch.png" src="https://github.com/05TharunKM/Samsung-PD-Training-/blob/373c74c4e290f8fe355dc012d2724a13d1a4f64e/docs/assets/images2/mul8_sch.png">
 
</details>
