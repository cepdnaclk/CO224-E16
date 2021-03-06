echo " "
echo "------STUDENT: E16394"
mkdir ./temp3/16394/
echo "MSG: unzipping E16394"
unzip ./temp2/e16394_lab5_part1.zip -d ./temp3/16394/
cd ./temp3/16394/
rm -f *tb*
rm -f *testbench*
rm -f *test_bench*
rm -f *TestBench*
rm -f *Testbench*
rm -f *testBench*
cp ../../groundtruth/alu_tb_gt.v ./
echo "MSG: Compiling E16394"
iverilog ./*.v -o compiled.out -s testbench
echo "MSG: Running E16394"
./compiled.out > printOutputs.txt
echo "MSG: Checking difference E16394"
diff printOutputs.txt ../../groundtruth/printOutputs.txt >> compareDiff.txt
cd ../../
echo " "
echo "------STUDENT: E16088"
mkdir ./temp3/16088/
echo "MSG: unzipping E16088"
unzip ./temp2/e16088_lab5_part1.zip -d ./temp3/16088/
cd ./temp3/16088/
rm -f *tb*
rm -f *testbench*
rm -f *test_bench*
rm -f *TestBench*
rm -f *Testbench*
rm -f *testBench*
cp ../../groundtruth/alu_tb_gt.v ./
echo "MSG: Compiling E16088"
iverilog ./*.v -o compiled.out -s testbench
echo "MSG: Running E16088"
./compiled.out > printOutputs.txt
echo "MSG: Checking difference E16088"
diff printOutputs.txt ../../groundtruth/printOutputs.txt >> compareDiff.txt
cd ../../
echo " "
echo "------STUDENT: E16276"
mkdir ./temp3/16276/
echo "MSG: unzipping E16276"
unzip ./temp2/e16276_lab5_part1.zip -d ./temp3/16276/
cd ./temp3/16276/
rm -f *tb*
rm -f *testbench*
rm -f *test_bench*
rm -f *TestBench*
rm -f *Testbench*
rm -f *testBench*
cp ../../groundtruth/alu_tb_gt.v ./
echo "MSG: Compiling E16276"
iverilog ./*.v -o compiled.out -s testbench
echo "MSG: Running E16276"
./compiled.out > printOutputs.txt
echo "MSG: Checking difference E16276"
diff printOutputs.txt ../../groundtruth/printOutputs.txt >> compareDiff.txt
cd ../../
echo " "
echo "------STUDENT: E16061"
mkdir ./temp3/16061/
echo "MSG: unzipping E16061"
unzip ./temp2/e16061_lab5_part1.zip -d ./temp3/16061/
cd ./temp3/16061/
rm -f *tb*
rm -f *testbench*
rm -f *test_bench*
rm -f *TestBench*
rm -f *Testbench*
rm -f *testBench*
cp ../../groundtruth/alu_tb_gt.v ./
echo "MSG: Compiling E16061"
iverilog ./*.v -o compiled.out -s testbench
echo "MSG: Running E16061"
./compiled.out > printOutputs.txt
echo "MSG: Checking difference E16061"
diff printOutputs.txt ../../groundtruth/printOutputs.txt >> compareDiff.txt
cd ../../
echo " "
echo "------STUDENT: E0"
mkdir ./temp3/0/
echo "MSG: unzipping E0"
unzip ./temp2/ e16320_lab5_part1.zip -d ./temp3/0/
cd ./temp3/0/
rm -f *tb*
rm -f *testbench*
rm -f *test_bench*
rm -f *TestBench*
rm -f *Testbench*
rm -f *testBench*
cp ../../groundtruth/alu_tb_gt.v ./
echo "MSG: Compiling E0"
iverilog ./*.v -o compiled.out -s testbench
echo "MSG: Running E0"
./compiled.out > printOutputs.txt
echo "MSG: Checking difference E0"
diff printOutputs.txt ../../groundtruth/printOutputs.txt >> compareDiff.txt
cd ../../
echo " "
echo "------STUDENT: E16200"
mkdir ./temp3/16200/
echo "MSG: unzipping E16200"
unzip ./temp2/e16200_lab5_part1.zip -d ./temp3/16200/
cd ./temp3/16200/
rm -f *tb*
rm -f *testbench*
rm -f *test_bench*
rm -f *TestBench*
rm -f *Testbench*
rm -f *testBench*
cp ../../groundtruth/alu_tb_gt.v ./
echo "MSG: Compiling E16200"
iverilog ./*.v -o compiled.out -s testbench
echo "MSG: Running E16200"
./compiled.out > printOutputs.txt
echo "MSG: Checking difference E16200"
diff printOutputs.txt ../../groundtruth/printOutputs.txt >> compareDiff.txt
cd ../../
echo " "
echo "------STUDENT: E16096"
mkdir ./temp3/16096/
echo "MSG: unzipping E16096"
unzip ./temp2/e16096_lab5_part1.zip -d ./temp3/16096/
cd ./temp3/16096/
rm -f *tb*
rm -f *testbench*
rm -f *test_bench*
rm -f *TestBench*
rm -f *Testbench*
rm -f *testBench*
cp ../../groundtruth/alu_tb_gt.v ./
echo "MSG: Compiling E16096"
iverilog ./*.v -o compiled.out -s testbench
echo "MSG: Running E16096"
./compiled.out > printOutputs.txt
echo "MSG: Checking difference E16096"
diff printOutputs.txt ../../groundtruth/printOutputs.txt >> compareDiff.txt
cd ../../
echo " "
echo "------STUDENT: E16377"
mkdir ./temp3/16377/
echo "MSG: unzipping E16377"
unzip ./temp2/e16377_lab5_part1.zip -d ./temp3/16377/
cd ./temp3/16377/
rm -f *tb*
rm -f *testbench*
rm -f *test_bench*
rm -f *TestBench*
rm -f *Testbench*
rm -f *testBench*
cp ../../groundtruth/alu_tb_gt.v ./
echo "MSG: Compiling E16377"
iverilog ./*.v -o compiled.out -s testbench
echo "MSG: Running E16377"
./compiled.out > printOutputs.txt
echo "MSG: Checking difference E16377"
diff printOutputs.txt ../../groundtruth/printOutputs.txt >> compareDiff.txt
cd ../../
echo " "
echo "------STUDENT: E16078"
mkdir ./temp3/16078/
echo "MSG: unzipping E16078"
unzip ./temp2/e16078_lab5_part1.zip -d ./temp3/16078/
cd ./temp3/16078/
rm -f *tb*
rm -f *testbench*
rm -f *test_bench*
rm -f *TestBench*
rm -f *Testbench*
rm -f *testBench*
cp ../../groundtruth/alu_tb_gt.v ./
echo "MSG: Compiling E16078"
iverilog ./*.v -o compiled.out -s testbench
echo "MSG: Running E16078"
./compiled.out > printOutputs.txt
echo "MSG: Checking difference E16078"
diff printOutputs.txt ../../groundtruth/printOutputs.txt >> compareDiff.txt
cd ../../
echo " "
echo "------STUDENT: E16068"
mkdir ./temp3/16068/
echo "MSG: unzipping E16068"
unzip ./temp2/e16068_lab5_part1.zip -d ./temp3/16068/
cd ./temp3/16068/
rm -f *tb*
rm -f *testbench*
rm -f *test_bench*
rm -f *TestBench*
rm -f *Testbench*
rm -f *testBench*
cp ../../groundtruth/alu_tb_gt.v ./
echo "MSG: Compiling E16068"
iverilog ./*.v -o compiled.out -s testbench
echo "MSG: Running E16068"
./compiled.out > printOutputs.txt
echo "MSG: Checking difference E16068"
diff printOutputs.txt ../../groundtruth/printOutputs.txt >> compareDiff.txt
cd ../../
echo " "
echo "------STUDENT: E16083"
mkdir ./temp3/16083/
echo "MSG: unzipping E16083"
unzip ./temp2/e16083_lab5_part1.zip -d ./temp3/16083/
cd ./temp3/16083/
rm -f *tb*
rm -f *testbench*
rm -f *test_bench*
rm -f *TestBench*
rm -f *Testbench*
rm -f *testBench*
cp ../../groundtruth/alu_tb_gt.v ./
echo "MSG: Compiling E16083"
iverilog ./*.v -o compiled.out -s testbench
echo "MSG: Running E16083"
./compiled.out > printOutputs.txt
echo "MSG: Checking difference E16083"
diff printOutputs.txt ../../groundtruth/printOutputs.txt >> compareDiff.txt
cd ../../
echo " "
echo "------STUDENT: E16172"
mkdir ./temp3/16172/
echo "MSG: unzipping E16172"
unzip ./temp2/e16172_lab5_part1.zip -d ./temp3/16172/
cd ./temp3/16172/
rm -f *tb*
rm -f *testbench*
rm -f *test_bench*
rm -f *TestBench*
rm -f *Testbench*
rm -f *testBench*
cp ../../groundtruth/alu_tb_gt.v ./
echo "MSG: Compiling E16172"
iverilog ./*.v -o compiled.out -s testbench
echo "MSG: Running E16172"
./compiled.out > printOutputs.txt
echo "MSG: Checking difference E16172"
diff printOutputs.txt ../../groundtruth/printOutputs.txt >> compareDiff.txt
cd ../../
echo " "
echo "------STUDENT: E16012"
mkdir ./temp3/16012/
echo "MSG: unzipping E16012"
unzip ./temp2/e16012_lab5_part1.zip -d ./temp3/16012/
cd ./temp3/16012/
rm -f *tb*
rm -f *testbench*
rm -f *test_bench*
rm -f *TestBench*
rm -f *Testbench*
rm -f *testBench*
cp ../../groundtruth/alu_tb_gt.v ./
echo "MSG: Compiling E16012"
iverilog ./*.v -o compiled.out -s testbench
echo "MSG: Running E16012"
./compiled.out > printOutputs.txt
echo "MSG: Checking difference E16012"
diff printOutputs.txt ../../groundtruth/printOutputs.txt >> compareDiff.txt
cd ../../
echo " "
echo "------STUDENT: E16156"
mkdir ./temp3/16156/
echo "MSG: unzipping E16156"
unzip ./temp2/e16156_lab5_part1.zip -d ./temp3/16156/
cd ./temp3/16156/
rm -f *tb*
rm -f *testbench*
rm -f *test_bench*
rm -f *TestBench*
rm -f *Testbench*
rm -f *testBench*
cp ../../groundtruth/alu_tb_gt.v ./
echo "MSG: Compiling E16156"
iverilog ./*.v -o compiled.out -s testbench
echo "MSG: Running E16156"
./compiled.out > printOutputs.txt
echo "MSG: Checking difference E16156"
diff printOutputs.txt ../../groundtruth/printOutputs.txt >> compareDiff.txt
cd ../../
echo " "
echo "------STUDENT: E16070"
mkdir ./temp3/16070/
echo "MSG: unzipping E16070"
unzip ./temp2/e16070_lab5_part1.zip -d ./temp3/16070/
cd ./temp3/16070/
rm -f *tb*
rm -f *testbench*
rm -f *test_bench*
rm -f *TestBench*
rm -f *Testbench*
rm -f *testBench*
cp ../../groundtruth/alu_tb_gt.v ./
echo "MSG: Compiling E16070"
iverilog ./*.v -o compiled.out -s testbench
echo "MSG: Running E16070"
./compiled.out > printOutputs.txt
echo "MSG: Checking difference E16070"
diff printOutputs.txt ../../groundtruth/printOutputs.txt >> compareDiff.txt
cd ../../
echo " "
echo "------STUDENT: E16217"
mkdir ./temp3/16217/
echo "MSG: unzipping E16217"
unzip ./temp2/e16217_lab5_part1.zip -d ./temp3/16217/
cd ./temp3/16217/
rm -f *tb*
rm -f *testbench*
rm -f *test_bench*
rm -f *TestBench*
rm -f *Testbench*
rm -f *testBench*
cp ../../groundtruth/alu_tb_gt.v ./
echo "MSG: Compiling E16217"
iverilog ./*.v -o compiled.out -s testbench
echo "MSG: Running E16217"
./compiled.out > printOutputs.txt
echo "MSG: Checking difference E16217"
diff printOutputs.txt ../../groundtruth/printOutputs.txt >> compareDiff.txt
cd ../../
echo " "
echo "------STUDENT: E16054"
mkdir ./temp3/16054/
echo "MSG: unzipping E16054"
unzip ./temp2/e16054_lab5_part1.zip -d ./temp3/16054/
cd ./temp3/16054/
rm -f *tb*
rm -f *testbench*
rm -f *test_bench*
rm -f *TestBench*
rm -f *Testbench*
rm -f *testBench*
cp ../../groundtruth/alu_tb_gt.v ./
echo "MSG: Compiling E16054"
iverilog ./*.v -o compiled.out -s testbench
echo "MSG: Running E16054"
./compiled.out > printOutputs.txt
echo "MSG: Checking difference E16054"
diff printOutputs.txt ../../groundtruth/printOutputs.txt >> compareDiff.txt
cd ../../
echo " "
echo "------STUDENT: E16055"
mkdir ./temp3/16055/
echo "MSG: unzipping E16055"
unzip ./temp2/e16055_lab5_part1.zip -d ./temp3/16055/
cd ./temp3/16055/
rm -f *tb*
rm -f *testbench*
rm -f *test_bench*
rm -f *TestBench*
rm -f *Testbench*
rm -f *testBench*
cp ../../groundtruth/alu_tb_gt.v ./
echo "MSG: Compiling E16055"
iverilog ./*.v -o compiled.out -s testbench
echo "MSG: Running E16055"
./compiled.out > printOutputs.txt
echo "MSG: Checking difference E16055"
diff printOutputs.txt ../../groundtruth/printOutputs.txt >> compareDiff.txt
cd ../../
echo " "
echo "------STUDENT: E16134"
mkdir ./temp3/16134/
echo "MSG: unzipping E16134"
unzip ./temp2/e16134_lab5_part1.zip -d ./temp3/16134/
cd ./temp3/16134/
rm -f *tb*
rm -f *testbench*
rm -f *test_bench*
rm -f *TestBench*
rm -f *Testbench*
rm -f *testBench*
cp ../../groundtruth/alu_tb_gt.v ./
echo "MSG: Compiling E16134"
iverilog ./*.v -o compiled.out -s testbench
echo "MSG: Running E16134"
./compiled.out > printOutputs.txt
echo "MSG: Checking difference E16134"
diff printOutputs.txt ../../groundtruth/printOutputs.txt >> compareDiff.txt
cd ../../
echo " "
echo "------STUDENT: E16275"
mkdir ./temp3/16275/
echo "MSG: unzipping E16275"
unzip ./temp2/e16275_lab5_part1.zip -d ./temp3/16275/
cd ./temp3/16275/
rm -f *tb*
rm -f *testbench*
rm -f *test_bench*
rm -f *TestBench*
rm -f *Testbench*
rm -f *testBench*
cp ../../groundtruth/alu_tb_gt.v ./
echo "MSG: Compiling E16275"
iverilog ./*.v -o compiled.out -s testbench
echo "MSG: Running E16275"
./compiled.out > printOutputs.txt
echo "MSG: Checking difference E16275"
diff printOutputs.txt ../../groundtruth/printOutputs.txt >> compareDiff.txt
cd ../../
echo " "
echo "------STUDENT: E16369"
mkdir ./temp3/16369/
echo "MSG: unzipping E16369"
unzip ./temp2/e16369_lab5_part1.zip -d ./temp3/16369/
cd ./temp3/16369/
rm -f *tb*
rm -f *testbench*
rm -f *test_bench*
rm -f *TestBench*
rm -f *Testbench*
rm -f *testBench*
cp ../../groundtruth/alu_tb_gt.v ./
echo "MSG: Compiling E16369"
iverilog ./*.v -o compiled.out -s testbench
echo "MSG: Running E16369"
./compiled.out > printOutputs.txt
echo "MSG: Checking difference E16369"
diff printOutputs.txt ../../groundtruth/printOutputs.txt >> compareDiff.txt
cd ../../
echo " "
echo "------STUDENT: E16222"
mkdir ./temp3/16222/
echo "MSG: unzipping E16222"
unzip ./temp2/e16222_lab5_part1.zip -d ./temp3/16222/
cd ./temp3/16222/
rm -f *tb*
rm -f *testbench*
rm -f *test_bench*
rm -f *TestBench*
rm -f *Testbench*
rm -f *testBench*
cp ../../groundtruth/alu_tb_gt.v ./
echo "MSG: Compiling E16222"
iverilog ./*.v -o compiled.out -s testbench
echo "MSG: Running E16222"
./compiled.out > printOutputs.txt
echo "MSG: Checking difference E16222"
diff printOutputs.txt ../../groundtruth/printOutputs.txt >> compareDiff.txt
cd ../../
echo " "
echo "------STUDENT: E16290"
mkdir ./temp3/16290/
echo "MSG: unzipping E16290"
unzip ./temp2/e16290_lab5_part1.zip -d ./temp3/16290/
cd ./temp3/16290/
rm -f *tb*
rm -f *testbench*
rm -f *test_bench*
rm -f *TestBench*
rm -f *Testbench*
rm -f *testBench*
cp ../../groundtruth/alu_tb_gt.v ./
echo "MSG: Compiling E16290"
iverilog ./*.v -o compiled.out -s testbench
echo "MSG: Running E16290"
./compiled.out > printOutputs.txt
echo "MSG: Checking difference E16290"
diff printOutputs.txt ../../groundtruth/printOutputs.txt >> compareDiff.txt
cd ../../
echo " "
echo "------STUDENT: E16313"
mkdir ./temp3/16313/
echo "MSG: unzipping E16313"
unzip ./temp2/e16313_lab5_part1.zip -d ./temp3/16313/
cd ./temp3/16313/
rm -f *tb*
rm -f *testbench*
rm -f *test_bench*
rm -f *TestBench*
rm -f *Testbench*
rm -f *testBench*
cp ../../groundtruth/alu_tb_gt.v ./
echo "MSG: Compiling E16313"
iverilog ./*.v -o compiled.out -s testbench
echo "MSG: Running E16313"
./compiled.out > printOutputs.txt
echo "MSG: Checking difference E16313"
diff printOutputs.txt ../../groundtruth/printOutputs.txt >> compareDiff.txt
cd ../../
echo " "
echo "------STUDENT: E16022"
mkdir ./temp3/16022/
echo "MSG: unzipping E16022"
unzip ./temp2/e16022_lab5_part1.zip -d ./temp3/16022/
cd ./temp3/16022/
rm -f *tb*
rm -f *testbench*
rm -f *test_bench*
rm -f *TestBench*
rm -f *Testbench*
rm -f *testBench*
cp ../../groundtruth/alu_tb_gt.v ./
echo "MSG: Compiling E16022"
iverilog ./*.v -o compiled.out -s testbench
echo "MSG: Running E16022"
./compiled.out > printOutputs.txt
echo "MSG: Checking difference E16022"
diff printOutputs.txt ../../groundtruth/printOutputs.txt >> compareDiff.txt
cd ../../
echo " "
echo "------STUDENT: E16086"
mkdir ./temp3/16086/
echo "MSG: unzipping E16086"
unzip ./temp2/e16086_lab5_part1.zip -d ./temp3/16086/
cd ./temp3/16086/
rm -f *tb*
rm -f *testbench*
rm -f *test_bench*
rm -f *TestBench*
rm -f *Testbench*
rm -f *testBench*
cp ../../groundtruth/alu_tb_gt.v ./
echo "MSG: Compiling E16086"
iverilog ./*.v -o compiled.out -s testbench
echo "MSG: Running E16086"
./compiled.out > printOutputs.txt
echo "MSG: Checking difference E16086"
diff printOutputs.txt ../../groundtruth/printOutputs.txt >> compareDiff.txt
cd ../../
echo " "
echo "------STUDENT: E16232"
mkdir ./temp3/16232/
echo "MSG: unzipping E16232"
unzip ./temp2/e16232_lab5_part1.zip -d ./temp3/16232/
cd ./temp3/16232/
rm -f *tb*
rm -f *testbench*
rm -f *test_bench*
rm -f *TestBench*
rm -f *Testbench*
rm -f *testBench*
cp ../../groundtruth/alu_tb_gt.v ./
echo "MSG: Compiling E16232"
iverilog ./*.v -o compiled.out -s testbench
echo "MSG: Running E16232"
./compiled.out > printOutputs.txt
echo "MSG: Checking difference E16232"
diff printOutputs.txt ../../groundtruth/printOutputs.txt >> compareDiff.txt
cd ../../
echo " "
echo "------STUDENT: E16223"
mkdir ./temp3/16223/
echo "MSG: unzipping E16223"
unzip ./temp2/e16223_lab5_part1.zip -d ./temp3/16223/
cd ./temp3/16223/
rm -f *tb*
rm -f *testbench*
rm -f *test_bench*
rm -f *TestBench*
rm -f *Testbench*
rm -f *testBench*
cp ../../groundtruth/alu_tb_gt.v ./
echo "MSG: Compiling E16223"
iverilog ./*.v -o compiled.out -s testbench
echo "MSG: Running E16223"
./compiled.out > printOutputs.txt
echo "MSG: Checking difference E16223"
diff printOutputs.txt ../../groundtruth/printOutputs.txt >> compareDiff.txt
cd ../../
echo " "
echo "------STUDENT: E16039"
mkdir ./temp3/16039/
echo "MSG: unzipping E16039"
unzip ./temp2/e16039_lab5_part1.zip -d ./temp3/16039/
cd ./temp3/16039/
rm -f *tb*
rm -f *testbench*
rm -f *test_bench*
rm -f *TestBench*
rm -f *Testbench*
rm -f *testBench*
cp ../../groundtruth/alu_tb_gt.v ./
echo "MSG: Compiling E16039"
iverilog ./*.v -o compiled.out -s testbench
echo "MSG: Running E16039"
./compiled.out > printOutputs.txt
echo "MSG: Checking difference E16039"
diff printOutputs.txt ../../groundtruth/printOutputs.txt >> compareDiff.txt
cd ../../
echo " "
echo "------STUDENT: E16396"
mkdir ./temp3/16396/
echo "MSG: unzipping E16396"
unzip ./temp2/e16396_lab5_part1.zip -d ./temp3/16396/
cd ./temp3/16396/
rm -f *tb*
rm -f *testbench*
rm -f *test_bench*
rm -f *TestBench*
rm -f *Testbench*
rm -f *testBench*
cp ../../groundtruth/alu_tb_gt.v ./
echo "MSG: Compiling E16396"
iverilog ./*.v -o compiled.out -s testbench
echo "MSG: Running E16396"
./compiled.out > printOutputs.txt
echo "MSG: Checking difference E16396"
diff printOutputs.txt ../../groundtruth/printOutputs.txt >> compareDiff.txt
cd ../../
echo " "
echo "------STUDENT: E16089"
mkdir ./temp3/16089/
echo "MSG: unzipping E16089"
unzip ./temp2/e16089_lab5_part1.zip -d ./temp3/16089/
cd ./temp3/16089/
rm -f *tb*
rm -f *testbench*
rm -f *test_bench*
rm -f *TestBench*
rm -f *Testbench*
rm -f *testBench*
cp ../../groundtruth/alu_tb_gt.v ./
echo "MSG: Compiling E16089"
iverilog ./*.v -o compiled.out -s testbench
echo "MSG: Running E16089"
./compiled.out > printOutputs.txt
echo "MSG: Checking difference E16089"
diff printOutputs.txt ../../groundtruth/printOutputs.txt >> compareDiff.txt
cd ../../
echo " "
echo "------STUDENT: E16366"
mkdir ./temp3/16366/
echo "MSG: unzipping E16366"
unzip ./temp2/e16366_lab5_part1.zip -d ./temp3/16366/
cd ./temp3/16366/
rm -f *tb*
rm -f *testbench*
rm -f *test_bench*
rm -f *TestBench*
rm -f *Testbench*
rm -f *testBench*
cp ../../groundtruth/alu_tb_gt.v ./
echo "MSG: Compiling E16366"
iverilog ./*.v -o compiled.out -s testbench
echo "MSG: Running E16366"
./compiled.out > printOutputs.txt
echo "MSG: Checking difference E16366"
diff printOutputs.txt ../../groundtruth/printOutputs.txt >> compareDiff.txt
cd ../../
echo " "
echo "------STUDENT: E1642"
mkdir ./temp3/1642/
echo "MSG: unzipping E1642"
unzip ./temp2/e1642_lab5_part1.zip -d ./temp3/1642/
cd ./temp3/1642/
rm -f *tb*
rm -f *testbench*
rm -f *test_bench*
rm -f *TestBench*
rm -f *Testbench*
rm -f *testBench*
cp ../../groundtruth/alu_tb_gt.v ./
echo "MSG: Compiling E1642"
iverilog ./*.v -o compiled.out -s testbench
echo "MSG: Running E1642"
./compiled.out > printOutputs.txt
echo "MSG: Checking difference E1642"
diff printOutputs.txt ../../groundtruth/printOutputs.txt >> compareDiff.txt
cd ../../
echo " "
echo "------STUDENT: E16388"
mkdir ./temp3/16388/
echo "MSG: unzipping E16388"
unzip ./temp2/e16388_lab5_part1.zip -d ./temp3/16388/
cd ./temp3/16388/
rm -f *tb*
rm -f *testbench*
rm -f *test_bench*
rm -f *TestBench*
rm -f *Testbench*
rm -f *testBench*
cp ../../groundtruth/alu_tb_gt.v ./
echo "MSG: Compiling E16388"
iverilog ./*.v -o compiled.out -s testbench
echo "MSG: Running E16388"
./compiled.out > printOutputs.txt
echo "MSG: Checking difference E16388"
diff printOutputs.txt ../../groundtruth/printOutputs.txt >> compareDiff.txt
cd ../../
echo " "
echo "------STUDENT: E16221"
mkdir ./temp3/16221/
echo "MSG: unzipping E16221"
unzip ./temp2/e16221_lab5_part1.zip -d ./temp3/16221/
cd ./temp3/16221/
rm -f *tb*
rm -f *testbench*
rm -f *test_bench*
rm -f *TestBench*
rm -f *Testbench*
rm -f *testBench*
cp ../../groundtruth/alu_tb_gt.v ./
echo "MSG: Compiling E16221"
iverilog ./*.v -o compiled.out -s testbench
echo "MSG: Running E16221"
./compiled.out > printOutputs.txt
echo "MSG: Checking difference E16221"
diff printOutputs.txt ../../groundtruth/printOutputs.txt >> compareDiff.txt
cd ../../
echo " "
echo "------STUDENT: E16399"
mkdir ./temp3/16399/
echo "MSG: unzipping E16399"
unzip ./temp2/e16399_lab5_part1.zip -d ./temp3/16399/
cd ./temp3/16399/
rm -f *tb*
rm -f *testbench*
rm -f *test_bench*
rm -f *TestBench*
rm -f *Testbench*
rm -f *testBench*
cp ../../groundtruth/alu_tb_gt.v ./
echo "MSG: Compiling E16399"
iverilog ./*.v -o compiled.out -s testbench
echo "MSG: Running E16399"
./compiled.out > printOutputs.txt
echo "MSG: Checking difference E16399"
diff printOutputs.txt ../../groundtruth/printOutputs.txt >> compareDiff.txt
cd ../../
echo " "
echo "------STUDENT: E16364"
mkdir ./temp3/16364/
echo "MSG: unzipping E16364"
unzip ./temp2/e16364_lab5_part1.zip -d ./temp3/16364/
cd ./temp3/16364/
rm -f *tb*
rm -f *testbench*
rm -f *test_bench*
rm -f *TestBench*
rm -f *Testbench*
rm -f *testBench*
cp ../../groundtruth/alu_tb_gt.v ./
echo "MSG: Compiling E16364"
iverilog ./*.v -o compiled.out -s testbench
echo "MSG: Running E16364"
./compiled.out > printOutputs.txt
echo "MSG: Checking difference E16364"
diff printOutputs.txt ../../groundtruth/printOutputs.txt >> compareDiff.txt
cd ../../
echo " "
echo "------STUDENT: E16389"
mkdir ./temp3/16389/
echo "MSG: unzipping E16389"
unzip ./temp2/e16389_lab5_part1.zip -d ./temp3/16389/
cd ./temp3/16389/
rm -f *tb*
rm -f *testbench*
rm -f *test_bench*
rm -f *TestBench*
rm -f *Testbench*
rm -f *testBench*
cp ../../groundtruth/alu_tb_gt.v ./
echo "MSG: Compiling E16389"
iverilog ./*.v -o compiled.out -s testbench
echo "MSG: Running E16389"
./compiled.out > printOutputs.txt
echo "MSG: Checking difference E16389"
diff printOutputs.txt ../../groundtruth/printOutputs.txt >> compareDiff.txt
cd ../../
echo " "
echo "------STUDENT: E16168"
mkdir ./temp3/16168/
echo "MSG: unzipping E16168"
unzip ./temp2/e16168_lab5_part1.zip -d ./temp3/16168/
cd ./temp3/16168/
rm -f *tb*
rm -f *testbench*
rm -f *test_bench*
rm -f *TestBench*
rm -f *Testbench*
rm -f *testBench*
cp ../../groundtruth/alu_tb_gt.v ./
echo "MSG: Compiling E16168"
iverilog ./*.v -o compiled.out -s testbench
echo "MSG: Running E16168"
./compiled.out > printOutputs.txt
echo "MSG: Checking difference E16168"
diff printOutputs.txt ../../groundtruth/printOutputs.txt >> compareDiff.txt
cd ../../
echo " "
echo "------STUDENT: E16319"
mkdir ./temp3/16319/
echo "MSG: unzipping E16319"
unzip ./temp2/e16319_lab5_part1.zip -d ./temp3/16319/
cd ./temp3/16319/
rm -f *tb*
rm -f *testbench*
rm -f *test_bench*
rm -f *TestBench*
rm -f *Testbench*
rm -f *testBench*
cp ../../groundtruth/alu_tb_gt.v ./
echo "MSG: Compiling E16319"
iverilog ./*.v -o compiled.out -s testbench
echo "MSG: Running E16319"
./compiled.out > printOutputs.txt
echo "MSG: Checking difference E16319"
diff printOutputs.txt ../../groundtruth/printOutputs.txt >> compareDiff.txt
cd ../../
echo " "
echo "------STUDENT: E16087"
mkdir ./temp3/16087/
echo "MSG: unzipping E16087"
unzip ./temp2/e16087_lab5_part1.zip -d ./temp3/16087/
cd ./temp3/16087/
rm -f *tb*
rm -f *testbench*
rm -f *test_bench*
rm -f *TestBench*
rm -f *Testbench*
rm -f *testBench*
cp ../../groundtruth/alu_tb_gt.v ./
echo "MSG: Compiling E16087"
iverilog ./*.v -o compiled.out -s testbench
echo "MSG: Running E16087"
./compiled.out > printOutputs.txt
echo "MSG: Checking difference E16087"
diff printOutputs.txt ../../groundtruth/printOutputs.txt >> compareDiff.txt
cd ../../
echo " "
echo "------STUDENT: E16127"
mkdir ./temp3/16127/
echo "MSG: unzipping E16127"
unzip ./temp2/e16127_lab5_part1.zip -d ./temp3/16127/
cd ./temp3/16127/
rm -f *tb*
rm -f *testbench*
rm -f *test_bench*
rm -f *TestBench*
rm -f *Testbench*
rm -f *testBench*
cp ../../groundtruth/alu_tb_gt.v ./
echo "MSG: Compiling E16127"
iverilog ./*.v -o compiled.out -s testbench
echo "MSG: Running E16127"
./compiled.out > printOutputs.txt
echo "MSG: Checking difference E16127"
diff printOutputs.txt ../../groundtruth/printOutputs.txt >> compareDiff.txt
cd ../../
echo " "
echo "------STUDENT: E16368"
mkdir ./temp3/16368/
echo "MSG: unzipping E16368"
unzip ./temp2/e16368_lab5_part1.zip -d ./temp3/16368/
cd ./temp3/16368/
rm -f *tb*
rm -f *testbench*
rm -f *test_bench*
rm -f *TestBench*
rm -f *Testbench*
rm -f *testBench*
cp ../../groundtruth/alu_tb_gt.v ./
echo "MSG: Compiling E16368"
iverilog ./*.v -o compiled.out -s testbench
echo "MSG: Running E16368"
./compiled.out > printOutputs.txt
echo "MSG: Checking difference E16368"
diff printOutputs.txt ../../groundtruth/printOutputs.txt >> compareDiff.txt
cd ../../
echo " "
echo "------STUDENT: E16126"
mkdir ./temp3/16126/
echo "MSG: unzipping E16126"
unzip ./temp2/e16126_lab5_part1.zip -d ./temp3/16126/
cd ./temp3/16126/
rm -f *tb*
rm -f *testbench*
rm -f *test_bench*
rm -f *TestBench*
rm -f *Testbench*
rm -f *testBench*
cp ../../groundtruth/alu_tb_gt.v ./
echo "MSG: Compiling E16126"
iverilog ./*.v -o compiled.out -s testbench
echo "MSG: Running E16126"
./compiled.out > printOutputs.txt
echo "MSG: Checking difference E16126"
diff printOutputs.txt ../../groundtruth/printOutputs.txt >> compareDiff.txt
cd ../../
echo " "
echo "------STUDENT: E16267"
mkdir ./temp3/16267/
echo "MSG: unzipping E16267"
unzip ./temp2/e16267_lab5_part1.zip -d ./temp3/16267/
cd ./temp3/16267/
rm -f *tb*
rm -f *testbench*
rm -f *test_bench*
rm -f *TestBench*
rm -f *Testbench*
rm -f *testBench*
cp ../../groundtruth/alu_tb_gt.v ./
echo "MSG: Compiling E16267"
iverilog ./*.v -o compiled.out -s testbench
echo "MSG: Running E16267"
./compiled.out > printOutputs.txt
echo "MSG: Checking difference E16267"
diff printOutputs.txt ../../groundtruth/printOutputs.txt >> compareDiff.txt
cd ../../
echo " "
echo "------STUDENT: E16261"
mkdir ./temp3/16261/
echo "MSG: unzipping E16261"
unzip ./temp2/e16261_lab5_part1.zip -d ./temp3/16261/
cd ./temp3/16261/
rm -f *tb*
rm -f *testbench*
rm -f *test_bench*
rm -f *TestBench*
rm -f *Testbench*
rm -f *testBench*
cp ../../groundtruth/alu_tb_gt.v ./
echo "MSG: Compiling E16261"
iverilog ./*.v -o compiled.out -s testbench
echo "MSG: Running E16261"
./compiled.out > printOutputs.txt
echo "MSG: Checking difference E16261"
diff printOutputs.txt ../../groundtruth/printOutputs.txt >> compareDiff.txt
cd ../../
echo " "
echo "------STUDENT: E16332"
mkdir ./temp3/16332/
echo "MSG: unzipping E16332"
unzip ./temp2/e16332_lab5_part1.zip -d ./temp3/16332/
cd ./temp3/16332/
rm -f *tb*
rm -f *testbench*
rm -f *test_bench*
rm -f *TestBench*
rm -f *Testbench*
rm -f *testBench*
cp ../../groundtruth/alu_tb_gt.v ./
echo "MSG: Compiling E16332"
iverilog ./*.v -o compiled.out -s testbench
echo "MSG: Running E16332"
./compiled.out > printOutputs.txt
echo "MSG: Checking difference E16332"
diff printOutputs.txt ../../groundtruth/printOutputs.txt >> compareDiff.txt
cd ../../
echo " "
echo "------STUDENT: E16081"
mkdir ./temp3/16081/
echo "MSG: unzipping E16081"
unzip ./temp2/e16081_lab5_part1.zip -d ./temp3/16081/
cd ./temp3/16081/
rm -f *tb*
rm -f *testbench*
rm -f *test_bench*
rm -f *TestBench*
rm -f *Testbench*
rm -f *testBench*
cp ../../groundtruth/alu_tb_gt.v ./
echo "MSG: Compiling E16081"
iverilog ./*.v -o compiled.out -s testbench
echo "MSG: Running E16081"
./compiled.out > printOutputs.txt
echo "MSG: Checking difference E16081"
diff printOutputs.txt ../../groundtruth/printOutputs.txt >> compareDiff.txt
cd ../../
echo " "
echo "------STUDENT: E16049"
mkdir ./temp3/16049/
echo "MSG: unzipping E16049"
unzip ./temp2/e16049_lab5_part1.zip -d ./temp3/16049/
cd ./temp3/16049/
rm -f *tb*
rm -f *testbench*
rm -f *test_bench*
rm -f *TestBench*
rm -f *Testbench*
rm -f *testBench*
cp ../../groundtruth/alu_tb_gt.v ./
echo "MSG: Compiling E16049"
iverilog ./*.v -o compiled.out -s testbench
echo "MSG: Running E16049"
./compiled.out > printOutputs.txt
echo "MSG: Checking difference E16049"
diff printOutputs.txt ../../groundtruth/printOutputs.txt >> compareDiff.txt
cd ../../
echo " "
echo "------STUDENT: E16025"
mkdir ./temp3/16025/
echo "MSG: unzipping E16025"
unzip ./temp2/e16025_lab5_part1.zip -d ./temp3/16025/
cd ./temp3/16025/
rm -f *tb*
rm -f *testbench*
rm -f *test_bench*
rm -f *TestBench*
rm -f *Testbench*
rm -f *testBench*
cp ../../groundtruth/alu_tb_gt.v ./
echo "MSG: Compiling E16025"
iverilog ./*.v -o compiled.out -s testbench
echo "MSG: Running E16025"
./compiled.out > printOutputs.txt
echo "MSG: Checking difference E16025"
diff printOutputs.txt ../../groundtruth/printOutputs.txt >> compareDiff.txt
cd ../../
echo " "
echo "------STUDENT: E16360"
mkdir ./temp3/16360/
echo "MSG: unzipping E16360"
unzip ./temp2/e16360_lab5_part1.zip -d ./temp3/16360/
cd ./temp3/16360/
rm -f *tb*
rm -f *testbench*
rm -f *test_bench*
rm -f *TestBench*
rm -f *Testbench*
rm -f *testBench*
cp ../../groundtruth/alu_tb_gt.v ./
echo "MSG: Compiling E16360"
iverilog ./*.v -o compiled.out -s testbench
echo "MSG: Running E16360"
./compiled.out > printOutputs.txt
echo "MSG: Checking difference E16360"
diff printOutputs.txt ../../groundtruth/printOutputs.txt >> compareDiff.txt
cd ../../
echo " "
echo "------STUDENT: E16173"
mkdir ./temp3/16173/
echo "MSG: unzipping E16173"
unzip ./temp2/e16173_lab5_part1.zip -d ./temp3/16173/
cd ./temp3/16173/
rm -f *tb*
rm -f *testbench*
rm -f *test_bench*
rm -f *TestBench*
rm -f *Testbench*
rm -f *testBench*
cp ../../groundtruth/alu_tb_gt.v ./
echo "MSG: Compiling E16173"
iverilog ./*.v -o compiled.out -s testbench
echo "MSG: Running E16173"
./compiled.out > printOutputs.txt
echo "MSG: Checking difference E16173"
diff printOutputs.txt ../../groundtruth/printOutputs.txt >> compareDiff.txt
cd ../../
echo " "
echo "------STUDENT: E16115"
mkdir ./temp3/16115/
echo "MSG: unzipping E16115"
unzip ./temp2/e16115_lab5_part1.zip -d ./temp3/16115/
cd ./temp3/16115/
rm -f *tb*
rm -f *testbench*
rm -f *test_bench*
rm -f *TestBench*
rm -f *Testbench*
rm -f *testBench*
cp ../../groundtruth/alu_tb_gt.v ./
echo "MSG: Compiling E16115"
iverilog ./*.v -o compiled.out -s testbench
echo "MSG: Running E16115"
./compiled.out > printOutputs.txt
echo "MSG: Checking difference E16115"
diff printOutputs.txt ../../groundtruth/printOutputs.txt >> compareDiff.txt
cd ../../
echo " "
echo "------STUDENT: E16057"
mkdir ./temp3/16057/
echo "MSG: unzipping E16057"
unzip ./temp2/e16057_lab5_part1.zip -d ./temp3/16057/
cd ./temp3/16057/
rm -f *tb*
rm -f *testbench*
rm -f *test_bench*
rm -f *TestBench*
rm -f *Testbench*
rm -f *testBench*
cp ../../groundtruth/alu_tb_gt.v ./
echo "MSG: Compiling E16057"
iverilog ./*.v -o compiled.out -s testbench
echo "MSG: Running E16057"
./compiled.out > printOutputs.txt
echo "MSG: Checking difference E16057"
diff printOutputs.txt ../../groundtruth/printOutputs.txt >> compareDiff.txt
cd ../../
echo " "
echo "------STUDENT: E16076"
mkdir ./temp3/16076/
echo "MSG: unzipping E16076"
unzip ./temp2/e16076_lab5_part1.zip -d ./temp3/16076/
cd ./temp3/16076/
rm -f *tb*
rm -f *testbench*
rm -f *test_bench*
rm -f *TestBench*
rm -f *Testbench*
rm -f *testBench*
cp ../../groundtruth/alu_tb_gt.v ./
echo "MSG: Compiling E16076"
iverilog ./*.v -o compiled.out -s testbench
echo "MSG: Running E16076"
./compiled.out > printOutputs.txt
echo "MSG: Checking difference E16076"
diff printOutputs.txt ../../groundtruth/printOutputs.txt >> compareDiff.txt
cd ../../
echo " "
echo "------STUDENT: E16203"
mkdir ./temp3/16203/
echo "MSG: unzipping E16203"
unzip ./temp2/e16203_lab5_part1.zip -d ./temp3/16203/
cd ./temp3/16203/
rm -f *tb*
rm -f *testbench*
rm -f *test_bench*
rm -f *TestBench*
rm -f *Testbench*
rm -f *testBench*
cp ../../groundtruth/alu_tb_gt.v ./
echo "MSG: Compiling E16203"
iverilog ./*.v -o compiled.out -s testbench
echo "MSG: Running E16203"
./compiled.out > printOutputs.txt
echo "MSG: Checking difference E16203"
diff printOutputs.txt ../../groundtruth/printOutputs.txt >> compareDiff.txt
cd ../../
echo " "
echo "------STUDENT: E16286"
mkdir ./temp3/16286/
echo "MSG: unzipping E16286"
unzip ./temp2/e16286_lab5_part1.zip -d ./temp3/16286/
cd ./temp3/16286/
rm -f *tb*
rm -f *testbench*
rm -f *test_bench*
rm -f *TestBench*
rm -f *Testbench*
rm -f *testBench*
cp ../../groundtruth/alu_tb_gt.v ./
echo "MSG: Compiling E16286"
iverilog ./*.v -o compiled.out -s testbench
echo "MSG: Running E16286"
./compiled.out > printOutputs.txt
echo "MSG: Checking difference E16286"
diff printOutputs.txt ../../groundtruth/printOutputs.txt >> compareDiff.txt
cd ../../
echo " "
echo "------STUDENT: E16351"
mkdir ./temp3/16351/
echo "MSG: unzipping E16351"
unzip ./temp2/e16351_lab5_part1.zip -d ./temp3/16351/
cd ./temp3/16351/
rm -f *tb*
rm -f *testbench*
rm -f *test_bench*
rm -f *TestBench*
rm -f *Testbench*
rm -f *testBench*
cp ../../groundtruth/alu_tb_gt.v ./
echo "MSG: Compiling E16351"
iverilog ./*.v -o compiled.out -s testbench
echo "MSG: Running E16351"
./compiled.out > printOutputs.txt
echo "MSG: Checking difference E16351"
diff printOutputs.txt ../../groundtruth/printOutputs.txt >> compareDiff.txt
cd ../../
echo " "
echo "------STUDENT: E16069"
mkdir ./temp3/16069/
echo "MSG: unzipping E16069"
unzip ./temp2/e16069_lab5_part1.zip -d ./temp3/16069/
cd ./temp3/16069/
rm -f *tb*
rm -f *testbench*
rm -f *test_bench*
rm -f *TestBench*
rm -f *Testbench*
rm -f *testBench*
cp ../../groundtruth/alu_tb_gt.v ./
echo "MSG: Compiling E16069"
iverilog ./*.v -o compiled.out -s testbench
echo "MSG: Running E16069"
./compiled.out > printOutputs.txt
echo "MSG: Checking difference E16069"
diff printOutputs.txt ../../groundtruth/printOutputs.txt >> compareDiff.txt
cd ../../
