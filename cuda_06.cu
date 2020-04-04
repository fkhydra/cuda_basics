#include "cuda_runtime.h"
#include "device_launch_parameters.h"
#include <stdio.h>

__global__ void GPU_kernel(int max_itemcount)
{
 int i;
 int startindex = threadIdx.x + (blockIdx.x * blockDim.x);
 int step = blockDim.x * gridDim.x;
 for (i = startindex; i < max_itemcount; i += step)
 {
  printf("%i\n", i);
 }
}

int main(void)
{
 int thread_count = 128;
 int block_count = (100000 + thread_count - 1) / thread_count;

 GPU_kernel <<< block_count, thread_count >>> (100000);
 cudaDeviceSynchronize();
 printf("Finished execution!\n");
 return 0;
}
