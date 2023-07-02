BUILD  ?= build
CFLAGS ?= 
CFLAGS += -Ilib
SRC_OBJ = $(patsubst %.c, $(BUILD)/%.o, $(wildcard src/*.c))
LIB_OBJ = $(patsubst %.c, $(BUILD)/%.o, $(wildcard lib/*.c))

all: $(patsubst src/%.c, $(BUILD)/%.o, $(wildcard src/*.c))

$(BUILD)/lib/%.o: lib/%.c lib/*.h
	@mkdir -p $$(dirname $@)
	$(CC) $(CFLAGS) -c $< -o $@

$(BUILD)/src/%.o: src/%.c lib/*.h
	@mkdir -p $$(dirname $@)
	$(CC) $(CFLAGS) -c $< -o $@

$(BUILD)/%.o: $(BUILD)/src/%.o $(LIB_OBJ)
	@mkdir -p $$(dirname $@)
	$(CC) $(CFLAGS) $^ -o $@

run: all
	$(BUILD)/main.o

clean:
	@rm -rf $(BUILD)
.PRECIOUS: $(BUILD)/lib/%.o $(BUILD)/src/%.o $(BUILD)/%.o
.PHONY: clean
