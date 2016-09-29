PHONY   := all clean
PROJECT := example

SRC_DIR   := src
SRC_FILES := $(wildcard $(SRC_DIR)/*.c)

OBJ_DIR   := obj
OBJ_FILES := $(addprefix $(OBJ_DIR)/,$(notdir $(SRC_FILES:.c=.o)))

GIT_VERSION := $(shell git --no-pager describe --tags --always)
GIT_COMMIT  := $(shell git rev-parse --verify HEAD)
GIT_DATE    := $(firstword $(shell git --no-pager show --date=iso-strict --format="%ad" --name-only))
BUILD_DATE  := $(shell date --iso=seconds)

# If working tree is dirty, append dirty flag
ifneq ($(strip $(shell git status --porcelain 2>/dev/null)),)
	GIT_VERSION := $(GIT_VERSION)-D
endif

CC     := gcc
CFLAGS := -Wall -Wextra -pedantic -ansi -O\
	-DGIT_VERSION=\"$(GIT_VERSION)\"\
	-DGIT_COMMIT=\"$(GIT_COMMIT)\"\
	-DGIT_DATE=\"$(GIT_DATE)\"\
	-DBUILD_DATE=\"$(BUILD_DATE)\"

RM    := rm -f
RMDIR := rmdir

all: $(PROJECT)

$(PROJECT): $(OBJ_FILES)
	$(CC) $^ -o $@

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c | $(OBJ_DIR)
	$(CC) $^ $(CFLAGS) -c -o $@

$(OBJ_DIR):
	mkdir -p $@

clean:
	$(RM) $(OBJ_DIR)/*.o $(PROJECT)
	$(RMDIR) $(OBJ_DIR)
