# CO224 2020 E16 Register File Lab Marking Script

## Usage

<pre><code>
chmod 700 MARK.sh
./MARK.sh fileFromFeels.zip
</code></pre>

## Output
The output will be written to **[MARKS_LIST.csv](MARKS_LIST.csv)**

## How marking is done

<ol>
<li><b>temp1/</b> contains the folders uploaded to feels.</li>
<li><b>temp2/</b> contains the zip files uploaded to feels.</li>
<li><b>temp3/</b><br>
First, the zip files are extracted to <b>temp3/e16XXX</b><br>
Then <b>groundtruth/reg_file_tb_groundtruth.v</b> is copied to the folder.<br>
Then, <b>your reg_file</b> is testes with <b>our reg_file_tb_groundtruth</b> by running the following commands are run,<br>
<pre><code>
iverilog ./*.v -o compiled.out -s reg_file_tb_groundtruth
./compiled.out > printOutputs.txt
diff waveDump.vcd ../../groundtruth/waveDump.vcd >> compareDiff.txt
</code></pre>

Finally, you get marks if the <b>compareDiff.txt</b> file contains no difference than the time stamp.
</ol>