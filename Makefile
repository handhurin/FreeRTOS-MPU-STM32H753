# Principal Makefile

##############################################
################## PROJECT ###################
##############################################

PROJ_NAME = freertos-mpu-test
BOARD = NUCLEO_H745ZI
LOAD_MEMORY = flash
VERSION = debug

##############################################
################### MAKE #####################
##############################################

.PHONY = all doxy clean echoes

all : clean build upload

include gen/settings.mk
include gen/path.mk
include gen/build.mk
include gen/debug.mk

clean :
	rm -rf $(BUILD_DIR)

echoes :
	@echo $(PROJ_NAME)
