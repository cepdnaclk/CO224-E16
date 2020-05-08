# E16 CO224 Lab05 Part 2

The submissions made to feels go through **[first-marking](first-marking/)** and generate the **[first MARKS_LIST.csv](first-marking/MARKS_LIST.csv)**.

Then we make **[corrections](corrections/)**, docment them [#corrections](here) and generate a new zip file.

Then we run the corrected zip file through the **[second-marking](second-marking/)** to generate the **[second MARKS_LIST.csv](second-marking/MARKS_LIST.csv)**

## Corrections

<table>
<tr><b>
    <td>ENo</td>
    <td>First Marking</td>
    <td>Corrections</td>
    <td>Second Marking</td>
</b></tr>

<tr>
    <td>E16039</td>
    <td>0</td>
    <td>The submission has an extra folder level. Just moving the files out of the folder solved the problem.</td>
    <td>1</td>
</tr>
<tr>
    <td>E16068</td>
    <td>0</td>
    <td>Edited the module name in the code module REG_file to module reg_file</td>
    <td>1</td>
</tr>
<tr>
    <td>E16086</td>
    <td>0</td>
    <td>Same as E16093</td>
    <td>1</td>
</tr>
<tr>
    <td>E16126</td>
    <td>0</td>
    <td>Same as E16093</td>
    <td>1</td>
</tr>
<tr>
    <td>E16156</td>
    <td>0</td>
    <td>Same as E16093</td>
    <td>1</td>
</tr>
<tr>
    <td>E16172</td>
    <td>0</td>
    <td>Same as E16093</td>
    <td>1</td>
</tr>
<tr>
    <td>E16200</td>
    <td>0</td>
    <td>Same as E16093</td>
    <td>1</td>
</tr>
<tr>
    <td>E16223</td>
    <td>0</td>
    <td>Same as E16093</td>
    <td>1</td>
</tr>
</table>


## Issues

**E16057** <code>output reg[7:0] registers[0:7]; // 8bit eight registers</code>

**E16061** Wavedump lines 39,40-->40,39. Shall we give full maks?

**E16069** 

<code><pre>
for (i = 0; i < 8; i++) begin
    regfile[i] <= 0;
end   
</pre></code>


**E16070** 

Issue 1: Faulty folder structure. (corrected)
Issue 2:
<code>for(i=0; i<8; i++) begin </code>


**E16081** #93 instead of #94 in waveDump. Shall we give full marks?

**E16083** 2 line diff in wavedump.

**E16087** Few line difference in waveDump (including an additional #11)

**E16115** 

**E16127** Small difference in waveDump

**E16168** 

**E16168** Solved the extra folder problem and renamed the module to reg_file from register_file. But still there are many differences in the wavedump

**E16217** Many lines of difference between wavedumps

**E16221** reg_file module definition parameter order is wrong.

