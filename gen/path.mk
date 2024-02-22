# Makefile with all project paths

##############################################
############ PROJECT DIRECTORIES #############
##############################################

WORKSPACE = $(shell pwd)

CORE_DIR  = $(WORKSPACE)/core

TOOLS_DIR = $(WORKSPACE)/tools
CMSIS_DIR = $(TOOLS_DIR)/CMSIS
OS_DIR    = $(TOOLS_DIR)/OS/FreeRTOS
HALs_DIR  = $(TOOLS_DIR)/HALs
BSPs_DIR  = $(TOOLS_DIR)/BSPs

GEN_DIR           = $(WORKSPACE)/gen
CONF_FREERTOS_DIR  = $(GEN_DIR)/conf_FreeRTOS
CONF_HALS_DIR      = $(GEN_DIR)/conf_HALs

APPLICATION_DIR = $(WORKSPACE)/application

BUILD_DIR             = $(WORKSPACE)/build
BUILD_CORE_DIR        = $(BUILD_DIR)/core
BUILD_APPLICATION_DIR = $(BUILD_DIR)/application
BUILD_TOOLS_DIR       = $(BUILD_DIR)/tools
BUILD_LIBS_DIR        = $(BUILD_DIR)/libs
TARGET_DIR            = $(BUILD_DIR)/target

##############################################
############## CORE DIRECTORIES ##############
##############################################

# Main Directories
CORE_INCDIR = $(CORE_DIR)/inc
CORE_SRCDIR = $(CORE_DIR)/src

##############################################
########### APPLICATION DIRECTORIES ##########
##############################################

# Application Directories
APPLICATION_INCDIR = $(APPLICATION_DIR)/inc
APPLICATION_SRCDIR = $(APPLICATION_DIR)/src

##############################################
################ OS DIRECTORIES ##############
##############################################²

# FreeRTOS Kernel Directories
OS_KERNEL_INCDIR      = $(OS_DIR)/include
OS_KERNEL_SRCDIR      = $(OS_DIR)
OS_KERNEL_COMMON_DIR  = $(OS_DIR)/portable/Common
OS_KERNEL_MEMMANG_DIR = $(OS_DIR)/portable/MemMang
OS_KERNEL_ARM_DIR     = $(OS_DIR)/portable/GCC/$(FREERTOS_PORTABLE)
OS_KERNEL_OBJDIR      = $(BUILD_DIR)/tools/os

##############################################
############## CMSIS DIRECTORIES #############
##############################################

# CMSIS Directories
ifeq ($(CHIP_FAMILLY), STM32H7xx)
CMSIS_INCDIR_DEVICE = $(CMSIS_DIR)/cmsis_device_stm32h7/Include
else
$(error There is no compatible CMSIS)
endif
CMSIS_INCDIR       = $(CMSIS_DIR)/CMSIS-ARM/CMSIS/Core/Include
CMSIS_RTOS2_INCDIR = $(CMSIS_DIR)/CMSIS-ARM/CMSIS/RTOS2/Include

##############################################
############### HAL DIRECTORIES ##############
##############################################

# HAL Directories
ifeq ($(CHIP_FAMILLY), STM32H7xx)
HAL_DIR = $(HALs_DIR)/HAL-STM32H7
else
$(error There is no compatible HAL)
endif
HAL_INCDIR = $(HAL_DIR)/Inc
HAL_SRCDIR = $(HAL_DIR)/Src
HAL_OBJDIR = $(BUILD_TOOLS_DIR)/hal

##############################################
############### BSP DIRECTORIES ##############
##############################################

# BSP Directories
BSP_INCDIR = $(BSP_DIR)/inc
BSP_SRCDIR = $(BSP_DIR)/src
BSP_OBJDIR = $(BUILD_TOOLS_DIR)/bsp
