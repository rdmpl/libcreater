#compiler locations
CC_DIR_3202C = D:/Ali/tools/ALi_IDE_2.1/compilers/gcc3.0.4/bin/
CC_DIR_3281  = C:/Cygwin/mips-sde/bin/
CC_DIR_3716  = /opt/hisi-linux/x86-arm/arm-hisiv200-linux/target/bin/
CC_DIR_3529  = C:/Cygwin/mips-sde/bin/
plat :=
#configure the output dir
OBJ_DIR = ../build/obj/
DEP_DIR = ../build/dep/
LIB_DIR = ../build/lib/
#library name
TARGET := test
LIB := lib$(TARGET)
#compile all c files in current directory
ifeq ($(plat),)
	SRCS := 
else
	SRCS = $(wildcard *.c)
	SRCS += $(foreach dir, $(SUBDIR), $(wildcard $(dir)/*.c))
endif
OBJS := $(patsubst %.c,$(OBJ_DIR)%.o,$(notdir $(SRCS)))
DEPS := $(patsubst %.c,$(DEP_DIR)%.d,$(notdir $(SRCS)))

#configure the compiler seclections by platform
ifeq ($(plat),3281)
	CC = $(CC_DIR_3281)sde-gcc
	AR = $(CC_DIR_3281)sde-ar
	CFLAGS =  -EL -mips2 -O1 -msoft-float -fsigned-char -W 
	ARFLAGS = -r -o
endif
ifeq ($(plat),3711C)
	CC = $(CC_DIR_3281)sde-gcc
	AR = $(CC_DIR_3281)sde-ar
	CFLAGS =  -EL -mips2 -O1 -msoft-float -fsigned-char -W 
	ARFLAGS = -r -o
endif
ifeq ($(plat),3529)
	CC = $(CC_DIR_3281)sde-gcc
	AR = $(CC_DIR_3281)sde-ar
	CFLAGS = -g -EL -mips32r2 -O1 -msoft-float -fsigned-char -W -D_POSIX_SOURCE
	ARFLAGS = -r -o
endif

ifeq ($(plat),3716)
	CC	= $(CC_DIR_3716)arm-hisiv200-linux-gcc
	AR	= $(CC_DIR_3716)arm-hisiv200-linux-ar
	CFLAGS = -D_GNU_SOURCE -Wall -O2 -g -Werror -DSDK_VER_C0 -Werror -DSDK_VER_C0 -O2 -Wall -fPIC -DUSE_AEC -D_GNU_SOURCE -D_XOPEN_SOURCE=600 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
	LDFLAGS = -shared -fPIC
	ARFLAGS = -r -o
endif
ifeq ($(plat),3202C)
	CC = $(CC_DIR_3202C)mips-t2-elf-gcc.exe
	AR = $(CC_DIR_3202C)mips-t2-elf-ar.exe
	CFLAGS =  -O1 -mips2 -EL  -W  -g -msoft-float -fno-delayed-branch
	ARFLAGS = rcs 
endif
CFLAGS += -I../include
LIBS =$(LIB_DIR)$(LIB)_for$(plat)

ifeq ($(plat),)
all: help
else
ifeq ($(plat),3716)
all:$(LIBS).a $(LIBS).so
else
all:$(LIBS).a
endif
endif
$(LIBS).a: $(OBJS)
	@test -d $(LIB_DIR) || mkdir -p $(LIB_DIR)
	@$(AR) $(ARFLAGS) $@ $^
	@echo -------$(LIBS).a prepared!
$(LIBS).so: $(OBJS)
	@echo preparing $(LIBS).so
	@test -d $(LIB_DIR) || mkdir -p $(LIB_DIR)
	@$(CC) $(LDFLAGS) -o $(LIBS).so $(OBJS)
	@echo -------$(LIBS).so prepared!
-include $(DEPS)
$(OBJS):$(OBJ_DIR)%.o:%.c
	@test -d $(OBJ_DIR)|| mkdir -p $(OBJ_DIR)
	@test -d $(DEP_DIR)|| mkdir -p $(DEP_DIR)
	@$(CC) $(CFLAGS) -MM -MT $@ -MF $(patsubst $(OBJ_DIR)%.o, $(DEP_DIR)%.d, $@) $< > /dev/null
	@echo CC $< ...
	@$(CC) $(CFLAGS) -c $< -g -o $@
clean_obj:
	@rm -rf *.o obj/
rebuild: clean_obj all
help:
	@echo "------------------------------------------------"
	@echo Usages:
	@echo "  make plat=3202C ----make library for 3202C"
	@echo "  make plat=3281  ----make library for 3281"
	@echo "  make plat=3711  ----make library for 3711"
	@echo "  make plat=3529  ----make library for 3529"
	@echo "  make plat=3716  ----make library for hisi_3716"
	@echo "------------------------------------------------"
clean:
	@rm -rf *.a *.o *.so $(OBJ_DIR) $(DEP_DIR) $(LIB_DIR) *.d
debug:
	@echo $(SRCS)
	@echo $(OBJS)
	@echo $(DEPS)
