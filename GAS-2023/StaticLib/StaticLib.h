#pragma once
#define _CRT_SECURE_NO_WARNINGS
#include <iostream>
#include <windows.h>
#include <ctime>
#include <time.h>

extern "C"
{
	int __stdcall MathPow(int num, int exp);
	int __stdcall MathRand(int a, int b);
	void __stdcall OutputInt(unsigned int a);
	void __stdcall OutputIntNoLine(unsigned int a);
	void __stdcall OutputStr(char* ptr);
	void __stdcall OutputStrNoLine(char* ptr);
}