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

include conf/settings.mk
include conf/path.mk
include conf/build.mk
include conf/debug.mk

clean :
	rm -rf $(BUILD_DIR)

echoes :
	@echo $(PROJ_NAME)
