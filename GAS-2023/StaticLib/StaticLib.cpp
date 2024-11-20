#include "StaticLib.h"


extern "C"
{
    int __stdcall MathPow(int num, int exp) {
        return pow(num, exp);
    }

    int __stdcall MathRand(int a, int b) {
        srand(time(NULL));
        int random_num = rand() % (b - a + 1) + a;
        return random_num;
    }

    void __stdcall OutputInt(unsigned int a) {
        std::cout << a << std::endl;
    }

    void __stdcall OutputIntNoLine(unsigned int a) {
        std::cout << a;
    }

    void __stdcall OutputStr(char* ptr) {
        SetConsoleCP(1251);
        SetConsoleOutputCP(1251);
        if (ptr == nullptr) {
            std::cout << '\n';
            return;
        }
        for (int i = 0; ptr[i] != '\0'; i++)
            std::cout << ptr[i];

        std::cout << '\n';
    }
    void __stdcall OutputStrNoLine(char* ptr) {
        SetConsoleCP(1251);
        SetConsoleOutputCP(1251);
        if (ptr == nullptr) {
            return;
        }
        for (int i = 0; ptr[i] != '\0'; i++)
            std::cout << ptr[i];
    }
}