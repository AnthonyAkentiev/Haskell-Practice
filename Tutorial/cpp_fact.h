#include <stdio.h>

template<size_t n>
struct fact 
{
    static const size_t value = n * fact<n - 1>::value;
};

// specialization for n==0
template<> 
struct fact<0> 
{ 
    static const size_t value = 1;
};


int main(int argc, char** argv)
{
	static size_t f5 = fact<5>::value;

	return f5;
}
