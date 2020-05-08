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

We try to delete all the testbench files you have written by running<br>
<pre><code>
rm -f  *tb*
rm -f *testbench*
rm -f *test_bench*
rm -f *TestBench*
rm -f *Testbench*
rm -f *testBench*
</code></pre>

Then <b>groundtruth/reg_file_tb_groundtruth.v</b> is copied to the folder.<br>
Then, <b>your reg_file</b> is tested with <b>our reg_file_tb_groundtruth</b> by running the following commands are run,<br>
<pre><code>
iverilog ./*.v -o compiled.out -s reg_file_tb_groundtruth
./compiled.out > printOutputs.txt
diff waveDump.vcd ../../groundtruth/waveDump.vcd >> compareDiff.txt
</code></pre>

Finally, you get marks if the <b>compareDiff.txt</b> file contains no difference than the time stamp.
</ol>

## If you think the marking was unfair

<ol>
    <li>Open <a href="log.txt">log.txt</a>, find the part of log containing your marking process. You can see what went wrong.<li>
    <li>Open temp2/16XXX. If your submission is not there, and you are sure about submitting to feels, let us know. This is highly unlikely.</li>
    <li>Open temp3/16XXX</li>
    <li>If your files are not extracted properly, let us know.</li>
    <li>If the files are extracted properly but you can get full marks by deleting or renaming some files, let us know.</li>
    <li>If you dont have a <b>compiled.out</b> file, then there is an issue with compiling. If the compiling didin't happen becase of a fault in the auto marking process, let us know.</li>
    <li>If you have <b>compiled.out</b> but do not have <b>waveDump.vcd</b>, let us know. This is highly unlikely.</li>
    <li>If you have <b>waveDump.vcd</b>, look at <b>compareDiff.txt</b> to see what is different from <b>groudtruth/waveDump.vcd</b>. If you think the difference is miniute and the marking is unfair, let us know.</li>
</ol>
<ul>
    <li>If you have some other problem, please let us know before we finalize the marks</li>
</ul>

Let us know = send an email to kisarul[at]eng[dot]pdn[dot]ac[dot]lk with a carbon copy to gihanjayatilaka[at]eng[dot]pdn[dot]ac[dot]lk.