#include <stdio.h>
#include <boost/filesystem.hpp>
#include <iostream>
#include <fstream>
#include <map> 
#include <iterator>
using namespace std;
using namespace boost::filesystem;


int main(){
    cout << "E_NO , marks "<< endl;

    string DIRECTORY_ZIP="./temp2/";
    string DIRECTORY_UNZIP="./temp3/";
    string MARK_LIST_FILE_NAME="MARKS_LIST.csv";
    path directoryPath(DIRECTORY_ZIP);

    map<string,int> enoMarks;

    for (auto ii = directory_iterator(directoryPath); ii != directory_iterator(); ii++){
        if (!is_directory(ii->path())){
            string fileName= ii->path().filename().string();
            int eNo;
            sscanf(fileName.c_str(),"e%d_",&eNo);
            
            string txtFileName=DIRECTORY_UNZIP+to_string(eNo)+"/compareDiff.txt";
            // cout <<txtFileName<<endl;


            string line;
            int count=0;
            ifstream file(txtFileName);
            if(file.is_open()){
                while(!file.eof()){
                    getline(file,line);
                    // cout<< line << endl;
                    count++;
                }
                file.close();
            }
            else{
                // cout << "ERROR" << endl;
            }
            string eeno="E"+to_string(eNo);
            if((count-1)<=5){
                enoMarks[eeno]=1;
            }
            else{
                enoMarks[eeno]=0;
            }

        }
        else continue;

        
    }
    map<string, int>::iterator it;
    int totalStudents=0;
    int correctStudents=0;
    for(it=enoMarks.begin();it!=enoMarks.end();it++){
        cout << it->first+", "+to_string(it->second) << endl;
        totalStudents++;
        correctStudents+=it->second;
    }

    cout << "Total, "<<totalStudents<<endl;
    cout << "Correct, "<<correctStudents<<endl;
}