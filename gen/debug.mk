# Makefile with debugging rules

##############################################
################ OCD CONFIGS #################
##############################################

# OCD Commands Variables
CHIP_FAMILLY_LOWER = $(shell echo $(CHIP_FAMILLY) | tr '[:upper:]' '[:lower:]' | sed 's/.$$//')

# Upload Commands
ifeq ($(LOAD_MEMORY), flash)
UPLOAD_CMDS  = -c 'reset init'
UPLOAD_CMDS += -c 'program $(TARGET)'
UPLOAD_CMDS += -c 'reset'
UPLOAD_CMDS += -c 'shutdown'
else ifeq ($(LOAD_MEMORY), ram)
UPLOAD_CMDS  = -c 'reset init'
UPLOAD_CMDS += -c 'load_image $(TARGET)'
UPLOAD_CMDS += -c 'gdb_breakpoint_override hard'
UPLOAD_CMDS += -c 'reset'
UPLOAD_CMDS += -c 'shutdown'
else
$(error Load memory can only be flash or ram)
endif

# Debug Commands
ifeq ($(LOAD_MEMORY), flash)
DBG_CMDS  = -c 'reset init'
DBG_CMDS += -c 'program $(TARGET)'
DBG_CMDS += -c 'reset halt'
else ifeq ($(LOAD_MEMORY), ram)
DBG_CMDS  = -c 'reset init'
DBG_CMDS += -c 'gdb_breakpoint_override hard'
DBG_CMDS += -c 'load_image $(TARGET)'
DBG_CMDS += -c 'reset halt'
else
$(error Load memory can only be flash or ram)
endif

# Erase Commands
ERASE_CMDS  = -c 'reset halt'
ERASE_CMDS += -c '$(CHIP_FAMILLY_LOWER) mass_erase 0'
ERASE_CMDS += -c 'reset'
ERASE_CMDS += -c 'shutdown'

##############################################
################ OCD COMMANDS ################
##############################################

.PHONY += debug gdb upload flash-erase

debug :
	$(OCD) -f $(OCD_DBG) -f $(OCD_CHIP) -c init $(DBG_CMDS)

gdb:
	$(GDB) -ex 'set pagination off' -ex 'target extended-remote localhost:3333' $(TARGET)

upload :
	$(OCD) -f $(OCD_DBG) -f $(OCD_CHIP) -c init $(UPLOAD_CMDS)

flash-erase :
	$(OCD) -f $(OCD_DBG) -f $(OCD_CHIP) -c init $(ERASE_CMDS)