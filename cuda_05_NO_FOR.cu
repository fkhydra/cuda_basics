#include "cuda_runtime.h"
#include "device_launch_parameters.h"
#include <stdio.h>

__global__ void GPU_kernel(int max_itemcount)
{
 int current_index = threadIdx.x + (blockIdx.x * blockDim.x);
 if (current_index < max_itemcount) printf("%i\n", current_index);
}

int main(void)
{
 GPU_kernel << < 1, 10 >> > (100);
 cudaDeviceSynchronize();
 printf("Finished execution!\n");
 return 0;
}
