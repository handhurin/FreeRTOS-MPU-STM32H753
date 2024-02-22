# Makefile with board parameters

#################################
######### NUCLEO_H745ZI #########
#################################
ifeq ($(BOARD), NUCLEO_H745ZI)
# Chip Information
CHIP_VENDOR = ST
CHIP_FAMILLY = STM32H7xx
CHIP = STM32H745xx
MACH = cortex-m7
CORE_SELECT = -DCORE_CM7
FPU_SETTINGS = -DFPU_AVAILABLE -mfpu=fpv5-d16 -mfloat-abi=hard
CACHE_SETTINGS = -DCACHE_UNAVAILABLE
MPU_SETTINGS = -DMPU_UNAVAILABLE
FREERTOS_PORTABLE = ARM_CM4_MPU
# Debugger Information
OCD_DBG = interface/stlink.cfg
OCD_CHIP = target/stm32h7x.cfg
# HAL & BSP Information
HAL_SRCS_LIST = $(CONF_HALS_DIR)/stm32h7xx_hal_conf.mk
LINKER_SCRIPT = $(BSP_DIR)/stm32h745zi_mpu_$(LOAD_MEMORY).ld
BSP_DIR = $(BSPs_DIR)/NUCLEO-H745ZI-BSP

#################################
############## ELSE #############
#################################
else
$(error This board is not available for the current software)
endif