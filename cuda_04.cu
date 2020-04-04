#include "cuda_runtime.h"
#include "device_launch_parameters.h"
#include <stdio.h>

__global__ void GPU_kernel(int max_itemcount)
{
 int i;
 for (i = 0; i < max_itemcount; ++i)
 {
  printf("%i\n", i);
 }
}

int main(void)
{
 GPU_kernel << < 1, 1 >> > (100);
 cudaDeviceSynchronize();
 printf("Finished execution!\n");
 return 0;
}
