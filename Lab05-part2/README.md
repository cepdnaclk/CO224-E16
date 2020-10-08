# E16 CO224 Lab05 Part 2

The submissions made to feels go through **[first-marking](first-marking/)** and generate the **[first MARKS_LIST.csv](first-marking/MARKS_LIST.csv)**.

Then we make **[corrections](corrections/)** and docment them [here](https://github.com/cepdnaclk/CO224-E16/tree/master/Lab05-part2#corrections).

Then we run the corrected file from **[corrections/TOEDIT](corrections/TOEDIT)** through the **[second-marking](second-marking/)** to generate the **[second MARKS_LIST.csv](second-marking/MARKS_LIST.csv)**

The full mark list is [here](https://docs.google.com/spreadsheets/d/1LuNwV9OSPD5Ao1EbTsTpwb4d7jO7kM_NDegpb_vySzQ)

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
    <td>E16069</td>
    <td>0</td>
    <td>For some reason the compiler does not work with i++. It works only with i=i+1</td>
    <td>1</td>
</tr>
<tr>
    <td>E16070</td>
    <td>0</td>
    <td>E16039 + E16069</td>
    <td>1</td>
</tr>
<tr>
    <td>E16086</td>
    <td>0</td>
    <td>Same as E16039</td>
    <td>1</td>
</tr>
<tr>
    <td>E16126</td>
    <td>0</td>
    <td>Same as E16039</td>
    <td>1</td>
</tr>
<tr>
    <td>E16156</td>
    <td>0</td>
    <td>Same as E16039</td>
    <td>1</td>
</tr>
<tr>
    <td>E16172</td>
    <td>0</td>
    <td>Same as E16039</td>
    <td>1</td>
</tr>
<tr>
    <td>E16200</td>
    <td>0</td>
    <td>Same as E16039</td>
    <td>1</td>
</tr>
<tr>
    <td>E16221</td>
    <td>0</td>
    <td>Incorrect order of ports.</td>
    <td>1</td>
</tr>
<tr>
    <td>E16223</td>
    <td>0</td>
    <td>Same as E16039</td>
    <td>1</td>
</tr>
<tr>
    <td>E16313</td>
    <td>0</td>
    <td>Same as E16039</td>
    <td>1</td>
</tr>
<tr>
    <td>E16364</td>
    <td>0</td>
    <td>Same as E16069</td>
    <td>1</td>
</tr>
<tr>
    <td>E16366</td>
    <td>0</td>
    <td>Same as E16069</td>
    <td>1</td>
</tr>
<tr>
    <td>E16369</td>
    <td>0</td>
    <td>Same as E16069</td>
    <td>1</td>
</tr>
<tr>
    <td>E16377</td>
    <td>0</td>
    <td>Edited the module name in the code module register_file to module reg_file</td>
    <td>1</td>
</tr>
<tr>
    <td>E16388</td>
    <td>0</td>
    <td>Same as E16069</td>
    <td>1</td>
</tr>
<tr>
    <td>E16396</td>
    <td>0</td>
    <td>There was an additional semi colon. Dont add semicolons after begin keyword</td>
    <td>1</td>
</tr>
</table>


## Issues
**E16055** Minor difference in wavedump

**E16057** <code>output reg[7:0] registers[0:7]; // 8bit eight registers</code>

**E16061** Wavedump lines 39,40-->40,39. Shall we give full maks?


**E16081** #93 instead of #94 in waveDump. Shall we give full marks?

**E16083** 2 line diff in wavedump.

**E16087** Few line difference in waveDump (including an additional #11)

**E16115** 

**E16127** Small difference in waveDump

**E16168** Solved the extra folder problem and renamed the module to reg_file from register_file. But still there are many differences in the wavedump

**E16173** Many differences in the wavedump

**E16217** Many lines of difference between wavedumps

**E16232** The code has been changed to nano scale for time delays. The wavedumps are different. But the answers are correct (once we divide by the scale). **Update (08/10/2020):** Since timescale is not a major issue, you get full marks.

**E16286** Issue 1: Two line are swapped in the wavedata (looks okay). Issue 2: There is a difference of #3 (might be problematic, please check)

**E16389** 	<code>reg [0:7][0:7] reg_array;</code> Can we declare 2D register arrays?


