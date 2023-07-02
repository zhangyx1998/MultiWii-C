#include <stdio.h>
#include "MSP.h"
#include "serial.h"

int main(int argc, char* argv[]) {
    int fd = serial_open("/dev/ttyUSB0", 115200);
    if (fd < 0) {
        printf("Error opening serial port\n");
        return 1;
    }
    MSP_RAW_IMU_t raw_imu;
    MSP_RAW_IMU(fd, &raw_imu);
    printf("accX: %d\n", raw_imu.accX);
    printf("accY: %d\n", raw_imu.accY);
    printf("accZ: %d\n", raw_imu.accZ);
    printf("gyrX: %d\n", raw_imu.gyrX);
    printf("gyrY: %d\n", raw_imu.gyrY);
    printf("gyrZ: %d\n", raw_imu.gyrZ);
    printf("magX: %d\n", raw_imu.magX);
    printf("magY: %d\n", raw_imu.magY);
    printf("magZ: %d\n", raw_imu.magZ);
    return 0;
}
