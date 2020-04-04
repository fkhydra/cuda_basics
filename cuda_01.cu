#include "cuda_runtime.h"
#include "device_launch_parameters.h"
#include <stdio.h>

int main()
{
 int devcount;
 cudaGetDeviceCount(&devcount);
 printf("%i device(s) found...", devcount);
 return 0;
}
