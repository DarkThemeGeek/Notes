#pragma once
#include <string>
class FileRepo{

    public:

    FileRepo();
    void ReadFile();
    void add();
    void delte();


    private:
    std::string sourceFile;
    int vertexNumber;


    
};