rm -rf fromfeels-temp1/
mkdir fromfeels-temp1/
rm -rf fromfeels-temp2/
mkdir fromfeels-temp2/
rm -rf fromfeels-temp3/
mkdir fromfeels-temp3/
rm -rf TOEDIT/
# mkdir TOEDIT/


unzip $1 -d fromfeels-temp1/
cp fromfeels-temp1/*/*.zip fromfeels-temp2/

rm -f gen-bash-1
rm -f tempscript1.sh
g++ gen-bash-1.cpp -o gen-bash-1 -lboost_filesystem -lboost_system
./gen-bash-1 > tempscript1.sh

chmod 700 tempscript1.sh
./tempscript1.sh
mv fromfeels-temp3 TOEDIT
cp -r TOEDIT BEFORE-EDIT