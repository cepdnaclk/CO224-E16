#include <stdio.h>
#include <boost/filesystem.hpp>
#include <iostream>
using namespace std;
using namespace boost::filesystem;


int main(){
    string DIRECTORY_ZIP="./fromfeels-temp2/";
    string DIRECTORY_UNZIP="./fromfeels-temp3/";
    path directoryPath(DIRECTORY_ZIP);
    for (auto ii = directory_iterator(directoryPath); ii != directory_iterator(); ii++){
        if (!is_directory(ii->path())){

            string fileName= ii->path().filename().string();
            int eNo;
            sscanf(fileName.c_str(),"e%d_",&eNo);

            cout << "mkdir "<< DIRECTORY_UNZIP << eNo <<"/"<<endl;
            cout << "unzip "<<DIRECTORY_ZIP<<fileName<<" -d "<<DIRECTORY_UNZIP << eNo <<"/"<<endl;


        }
        else
            continue;
    }
}