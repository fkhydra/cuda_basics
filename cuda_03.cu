#include "cuda_runtime.h"
#include "device_launch_parameters.h"
#include <stdio.h>

void CPU_kernel(int max_itemcount)
{
 int i;
 for (i = 0; i < max_itemcount; ++i)
 {
  printf("%i\n", i);
 }
}

int main(void)
{
 CPU_kernel(100);
 printf("Finished execution!\n");
 return 0;
}
