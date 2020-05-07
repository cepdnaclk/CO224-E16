echo "CO224 Register File Lab Marking Script"
echo "-----------------------------------------------"
cd groundtruth/
rm compiled.out
rm waveDump.vcd
rm printOutputs.txt
iverilog *.v -o compiled.out -s reg_file_tb_groundtruth
./compiled.out > printOutputs.txt
cd ../

rm -r temp1/
mkdir temp1/
unzip $1 -d temp1/

rm -r temp2/
mkdir temp2/
cp temp1/E*/*.zip temp2/

rm -r temp3/
mkdir temp3/

# rm -r temp4/
# mkdir temp4/

# rm -r temp5/
# mkdir temp5/

rm gen-bash
rm tempscript.sh
g++ gen-bash.cpp -o gen-bash -lboost_filesystem -lboost_system
./gen-bash > tempscript.sh

chmod 700 tempscript.sh
rm log.txt
./tempscript.sh > log.txt

rm gen-marks
rm MARKS_LIST.csv
g++ gen-marks.cpp -o gen-marks -lboost_filesystem -lboost_system
./gen-marks > MARKS_LIST.csv
echo "-----------------------------------------------"
echo "END OF PROGRAM. Please open MARK_LIST.csv and log.txt"