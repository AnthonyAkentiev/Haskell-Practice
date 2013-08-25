#include <stdio.h>

// Variadic templates
template<class... list> 
struct count;

// Specialization
template<> 
struct count<> 
{
    static const size_t value = 0;
};

template<class head, class... tail> 
struct count<head, tail...> 
{
    static const size_t value = 1 + count<tail...>::value;
};



int main(int argc, char** argv)
{
	const size_t n = count<int, char, long>::value; // returns 3
	return n;
}
