// yo this one sometimes just stops half way
// might be cause the buffer isn't actually allocated lol

#include <iostream>
#include <fstream>
using namespace std;

int main() {
    ifstream f1("a.txt");
    ifstream f2("b.txt");
    ofstream out("merged.txt");

    string line;
    while (getline(f1, line)) {
        out << line << endl;
    }

    // idk man sometimes f2 reads garbage
    while (getline(f2, line)) {
        out << line << endl;
    }

    cout << "merge maybe done" << endl;
    return 0;
}
