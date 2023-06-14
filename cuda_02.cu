#include "cuda_runtime.h"
#include "device_launch_parameters.h"
#include "helper_cuda.h"
#include <stdio.h>

int main()
{
 int devcount;
 int dev, driverVersion = 0, runtimeVersion = 0;

 cudaGetDeviceCount(&devcount);
 if (devcount == 0) printf("No supported CUDA device found!\n");
 else printf("%i CUDA device(s) found...", devcount);

 for (dev = 0; dev < devcount; ++dev)
 {
  cudaSetDevice(dev);
  cudaDeviceProp deviceProp;
  cudaGetDeviceProperties(&deviceProp, dev);
  printf("\n%d. device name: \"%s\"\n", dev, deviceProp.name);

  cudaDriverGetVersion(&driverVersion);
  cudaRuntimeGetVersion(&runtimeVersion);

  printf("  CUDA driver version / Runtime version          %d.%d / %d.%d\n",
   driverVersion / 1000, (driverVersion % 100) / 10,
   runtimeVersion / 1000, (runtimeVersion % 100) / 10);

  printf("  CUDA Capability version:   %d.%d\n",
   deviceProp.major, deviceProp.minor);

  char msg[256];
  sprintf_s(msg, sizeof(msg),
   "  Total VRAM:     %.0f MBytes "
   "(%llu bytes)\n",
   static_cast<float>(deviceProp.totalGlobalMem / 1048576.0f),
   (unsigned long long)deviceProp.totalGlobalMem);
  printf("%s", msg);

  //_ConvertSMVer2Cores needs cuda-samples to be installed
  printf("  (%2d) Multiprocessor, (%3d) CUDA cores/MP: %d CUDA cores\n",
   deviceProp.multiProcessorCount,
   _ConvertSMVer2Cores(deviceProp.major, deviceProp.minor),
   _ConvertSMVer2Cores(deviceProp.major, deviceProp.minor) *
   deviceProp.multiProcessorCount);

  printf(
   "  GPU max. clock:                            %.0f MHz (%0.2f "
   "GHz)\n",
   deviceProp.clockRate * 1e-3f, deviceProp.clockRate * 1e-6f);

  printf("  VRAM clock:                             %.0f Mhz\n",
   deviceProp.memoryClockRate * 1e-3f);
  printf("  VRAM transfer rate:                  %d-bit\n",
   deviceProp.memoryBusWidth);
  printf("  Warp size:                                %d\n",
   deviceProp.warpSize);
  printf("  Max. threads / multiprocessor: %d\n",
   deviceProp.maxThreadsPerMultiProcessor);
  printf("  Max. threads / block:  %d\n",
   deviceProp.maxThreadsPerBlock);
  printf("  Max. block dimensions (x,y,z):  (%d, %d, %d)\n",
   deviceProp.maxThreadsDim[0], deviceProp.maxThreadsDim[1],
   deviceProp.maxThreadsDim[2]);
  printf("  Max. Grid dimensions (x,y,z): (%d, %d, %d)\n",
   deviceProp.maxGridSize[0], deviceProp.maxGridSize[1],
   deviceProp.maxGridSize[2]);
 }
 return 0;
}
