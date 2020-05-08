#include <stdio.h>
#include <boost/filesystem.hpp>
#include <iostream>
using namespace std;
using namespace boost::filesystem;


int main(){
    string DIRECTORY_ZIP="../first-marking/temp2/";
    string DIRECTORY_UNZIP="./temp3/";
    // string DIRECTORY_COMPILED="./temp4/";
    // string DIRECTORY_DIFF="./temp5/";
    path directoryPath(DIRECTORY_ZIP);
    for (auto ii = directory_iterator(directoryPath); ii != directory_iterator(); ii++){
        if (!is_directory(ii->path())){

            string fileName= ii->path().filename().string();
            int eNo;
            sscanf(fileName.c_str(),"e%d_",&eNo);
            
            cout<< "echo \" \"" << endl;
            cout<< "echo " <<"\"------STUDENT: E" <<eNo << "\"" <<endl;

            // string mkdirCommand="mkdir "+DIRECTORY_UNZIP+to_string(eNo)+"/";
            // cout << mkdirCommand << endl;

            // string unzipCommand = "unzip "+DIRECTORY_ZIP+fileName+" -d "+ DIRECTORY_UNZIP+to_string(eNo)+"/";
            // cout<< "echo " <<"\"MSG: unzipping E" <<eNo << "\"" <<endl;
            // cout << unzipCommand << endl;

            string changedirCommand="cd "+DIRECTORY_UNZIP+to_string(eNo)+"/";
            cout << changedirCommand << endl;
            cout << "rm -f *tb*" << endl;
            cout << "rm -f *testbench*" << endl;
            cout << "rm -f *test_bench*" << endl;
            cout << "rm -f *TestBench*" << endl;
            cout << "rm -f *Testbench*" << endl;
            cout << "rm -f *testBench*" << endl;

            cout << "cp ../../groundtruth/reg_file_tb_groundtruth.v ./" << endl;
            cout<< "echo " <<"\"MSG: Compiling E" <<eNo << "\"" <<endl;
            cout << "iverilog ./*.v -o compiled.out -s reg_file_tb_groundtruth" << endl;
            cout<< "echo " <<"\"MSG: Running E" <<eNo << "\"" <<endl;
            cout << "./compiled.out > printOutputs.txt" << endl;
            cout<< "echo " <<"\"MSG: Checking difference E" <<eNo << "\"" <<endl;
            cout << "diff waveDump.vcd ../../groundtruth/waveDump.vcd >> compareDiff.txt" << endl;
            cout << "cd ../../" << endl;

        }
        else
            continue;
    }
}