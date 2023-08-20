
# Samsung-PD-Training
This github repository summarizes the progress made in the samsung PD training. Quick links:

- [Day-0-Tool-Setup-Check](#day-0-Tool-Setup-Check)
- [Day-1-Introduction-to-Verilog-RTL-design-and-Synthesis](#day-1-Introduction-to-Verilog-RTL-design-and-Synthesis)

 
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
