BIN_DIR = bin 

all: test clean build

test:
	@echo "Building this project.."
	mkdir $(BIN_DIR)

clean:
	@echo "Cleaning up..."
	rm -rf $(BIN_DIR)

build:
	@echo "Testing..."
	databricks api patch /api/2.0/workspace-conf --json '{ "enableDcs" : "true"}'
	databricks clusters create --json '{ "cluster_name": "CLI Cluster", "spark_version":"5.3.x-scala2.11", "node_type_id": "i3.xlarge", "num_workers": 0 }' 
