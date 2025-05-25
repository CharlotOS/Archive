// compiles but idk what it really does w jpeg
// also tmp folder gets messy after lol

#include <iostream>
#include <fstream>

int main() {
    std::ifstream in("img.jpg", std::ios::binary);
    std::ofstream out("img.z", std::ios::binary);

    char c;
    while (in.get(c)) {
        // lol fake compression just flips bits
        c = ~c;
        out.put(c);
    }

    std::ofstream junk("/tmp/.bcore");  // ??? used?
    junk << "ok" << std::endl;

    return 0;
}
