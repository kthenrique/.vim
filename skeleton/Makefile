# ----------------------------------------------------------------------------#
#                                  MAKEFILE                                   #
# ----------------------------------------------------------------------------#
# -- Project    : <project title>                                             #
# -- Author     : Kelve T. Henrique                                           #
# -- Last update: <date>                                                      #
# ----------------------------------------------------------------------------#
# -- Dependencies:                                                            #
#            * GCC                                                            #
#            *                                                                #
#            *                                                                #
# ----------------------------------------------------------------------------#
                                                                              
# ----------------------------------------------------------------------------#
#                                  USAGE                                      #
# ----------------------------------------------------------------------------#
#          make           .... build the program image                        #
#          make debug     .... build the program image and invoke gdb         #
#          make flash     .... build an flash the application                 #
#          make erase     .... erase the target device                        #
#          make doc       .... run doxygen - output will be in > doc          #
#          make clean     .... remove intermediate and generated files        #
# ----------------------------------------------------------------------------#
                                                                              
TARGET        = main
                                                                             
# ----------------------------------------------------------------------------#
#                               DIRECTORIES                                   #
# ----------------------------------------------------------------------------#
BIN           = ./bin                                 
DOC           = ./doc                                 
SYS           = ../CMSIS                              
                                                                              
                                                                              
# ----------------------------------------------------------------------------#
#                                    TOOLS                                    #
# ----------------------------------------------------------------------------#
TERMINAL      = gnome-terminal                         
TOOLCHAIN     = arm-none-eabi                          
AS            = $(TOOLCHAIN)-as                        
CC            = $(TOOLCHAIN)-gcc                       
CP            = $(TOOLCHAIN)-objcopy                   
OD            = $(TOOLCHAIN)-objdump                   
GDB           = $(TOOLCHAIN)-gdb                       
SIZE          = $(TOOLCHAIN)-size                      
                                                                              
                                                                              
# ----------------------------------------------------------------------------#
#                                  LIBS                                       #
# ----------------------------------------------------------------------------#
LIBS          = -larm_cortexM4_mathL_2                                        
LIBS         += -lxmclibcstubs                                                
LIBS         += -lm                                                           
                                                                              
                                                                              
# ----------------------------------------------------------------------------#
#                             SOURCE FILES                                    #
# ----------------------------------------------------------------------------#
SRC  = $(wildcard *.c)                                                        
SRC += $(OS)/uC-CPU/cpu_core.c                                                
SRC += $(OS)/uC-CPU/ARM-Cortex-M4/GNU/cpu_c.c                                 
SRC += $(wildcard $(OS)/uC-LIB/*.c)                                           
SRC += $(wildcard $(OS)/uCOS-III/Source/*.c)                                  
SRC += $(OS)/uCOS-III/Ports/ARM-Cortex-M4/Generic/GNU/os_cpu_c.c              
SRC += $(wildcard $(BSP)/*.c)                                                 
                                                                              
                                                                              
# ----------------------------------------------------------------------------#
#                                LINKER FILES                                 #
# ----------------------------------------------------------------------------#
LINKER_FILE = $(XMC_GCCDIR)/xmc4500_ucos.ld                                   
                                                                              
                                                                              
# ----------------------------------------------------------------------------#
#                           DIRECTORIES TO INCLUDE                            #
# ----------------------------------------------------------------------------#
                                                                              
INC_DIR = -I$(SRCDIR)                                                         
INC_DIR += -I$(SYS)                                                           
INC_DIR += -I$(CMSIS_INCDIR)                                                  
INC_DIR += -I$(INF_INCDIR)                                                    
                                                                              
                                                                              
                                                                              
# ----------------------------------------------------------------------------#
#                           LIBRARIES TO INCLUDE                              #
# ----------------------------------------------------------------------------#
LIBS_DIR  = -L$(SYS)                                                          
LIBS_DIR += -L$(CMSIS_LIBDIR)                                                 
LIBS_DIR += -L$(INF_LIBDIR)                                                   
LIBS_DIR += -L$(XMC_LIBDIR)                                                   
                                                                              
                                                                             
                                                                             
# ----------------------------------------------------------------------------#
#                                 OBJECT FILES                                #
# ----------------------------------------------------------------------------#
                                                                             
                                                                             
OBJS = $(SRC:.c=.o)                                                           
OBJS+= $(SRCASM:.asm=.o)                                                      
                                                                              
                                                                              
# ----------------------------------------------------------------------------#
#                              COMPILER OPTIONS                               #
# ----------------------------------------------------------------------------#
                                                                              
CFLAGS = -mthumb                                                              
CFLAGS+= -mcpu=$(CPU)                                                         
CFLAGS+= -O0                                                                  
CFLAGS+= -ffunction-sections -fdata-sections -fsigned-char -fstack-usage      
CFLAGS+= -MD -std=c99 -Wall -fms-extensions                                   
CFLAGS+= -DUC_ID=$(UC_ID) -DARM_MATH_CM4 -DXMC4500_F144x1024                  
CFLAGS+= -g3 -fmessage-length=0                                               
AFLAGS = -x assembler-with-cpp                                                 
LFLAGS = -nostartfiles $(LIBS_DIR) -Wl,--gc-sections -Wl,-Map=bin/$(TARGET).map
CPFLAGS = -Obinary                                                             
ODFLAGS = -S                                                                   
                                                                               
                                                                               
                                                                               
# ---------------------------------------------------------------------------- #
#                              BUILD RULES                                     #
# ---------------------------------------------------------------------------- #
                                                                               
all: $(OBJS) $(TARGET).elf $(TARGET)                                           
                                                                               
%.o: %.asm                                                                     
	@echo "----------------------------------------------------------------------"
	@echo "Assembly of $<:"                                                    
	@echo ""                                                                   
	$(CC) -c $(CFLAGS) $(INC_DIR) $(AFLAGS) $< -o $@                           
	@echo ""                                                                   
                                                                               
%.o: %.c                                                                       
	@echo "----------------------------------------------------------------------"
	@echo "Compilation of $<:"                                                 
	@echo ""                                                                   
	$(CC) -c $(CFLAGS) $(INC_DIR) $< -o $@                                     
	@echo ""                                                                   
                                                                               
$(TARGET).elf: $(OBJS)                                                         
	@echo "----------------------------------------------------------------------"
	@echo "Linking:"                                                           
	@echo ""                                                                   
	$(CC) -T $(LINKER_FILE) $(LFLAGS) $(CFLAGS) -o $(BIN)/$(TARGET).elf $(OBJS) $(LIBS)
	@echo ""                                                                   
                                                                               
$(TARGET): $(TARGET).elf                                                       
	@echo "----------------------------------------------------------------------"
	@echo "Creation of Binary:"                                                
	@echo ""                                                                   
	$(CP) $(CPFLAGS) $(BIN)/$(TARGET).elf $(BIN)/$(TARGET).bin                 
	@echo "----------------------------------------------------------------------"
	@echo "Create Listing File:"                                               
	@echo ""                                                                   
	$(OD) $(ODFLAGS) $(BIN)/$(TARGET).elf > $(BIN)/$(TARGET).lst               
	@echo "----------------------------------------------------------------------"
	@echo "Create Static Usage Analysis:"                                      
	@echo ""                                                                   
	$(SIZE) $(BIN)/$(TARGET).elf                                               
                                                                               
                                                                               
                                                                               
# ---------------------------------------------------------------------------- #
#                             DEBUG RULES                                      #
# ---------------------------------------------------------------------------- #
                                                                               
debug: $(TARGET)                                                               
ifdef SystemRoot                                                               
	@call start JLinkGDBServer -Device XMC4500-1024 -if SWD                    
else                                                                           
	$(TERMINAL) -e "JLinkGDBServer -Device XMC4500-1024 -if SWD" &             
	sleep 1 && $(TERMINAL) -e "telnet localhost 2333" &                        
endif                                                                          
	$(GDB) -q $(BIN)/$(TARGET).elf $(GDB_ARGS)                                 
                                                                               
                                                                               
                                                                               
# ---------------------------------------------------------------------------- 
#                             CLEAN RULES                                      
# ---------------------------------------------------------------------------- 
                                                                               
clean:                                                                         
	$(RM) $(call FixPath, ${OBJS} ${DEPS} ${SU})                               
	$(RM) $(call FixPath, ${BIN}/*)                                            
	$(RM) $(call FixPath, ${DOC}/html/*)                                       
                                                                               
