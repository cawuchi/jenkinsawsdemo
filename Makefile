# Makefile

BIN_DIR = bin 

all: clean build

build:
	@echo "Building this project.."
	mkdir $(BIN_DIR)

clean:
	@echo "Cleaning up..."
	rm -rf $(BIN_DIR)
test:
	@echo "Testing..."
	databricks api patch /api/2.0/workspace-conf --json '{ "enableDcs" : "true"}'
