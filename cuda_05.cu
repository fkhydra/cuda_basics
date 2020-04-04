#include "cuda_runtime.h"
#include "device_launch_parameters.h"
#include <stdio.h>

__global__ void GPU_kernel(int max_itemcount)
{
 int i;
 int startindex = threadIdx.x;
 int step = blockDim.x;
 for (i = startindex; i < max_itemcount; i += step)
 {
  printf("%i\n", i);
 }
}

int main(void)
{
 GPU_kernel << < 1, 10 >> > (100);
 cudaDeviceSynchronize();
 printf("Finished execution!\n");
 return 0;
}
