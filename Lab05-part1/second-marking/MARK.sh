echo "CO224 Register File Lab Marking Script"
echo "-----------------------------------------------"
chmod 700 CLEAN.sh
./CLEAN.sh

rm -r groundtruth/
cp -r ../first-marking/groundtruth/ ./
cd groundtruth/
iverilog *.v -o compiled.out -s testbench
./compiled.out > printOutputs.txt
cd ../
mkdir temp3/
cp -r ../corrections/TOEDIT/* temp3/

g++ gen-bash.cpp -o gen-bash -lboost_filesystem -lboost_system
./gen-bash > tempscript.sh

chmod 700 tempscript.sh
rm log.txt
./tempscript.sh &> log.txt

rm MARKS_LIST.csv
g++ gen-marks.cpp -o gen-marks -lboost_filesystem -lboost_system
./gen-marks > MARKS_LIST.csv
echo "-----------------------------------------------"
echo "END OF PROGRAM. Please open MARK_LIST.csv and log.txt"