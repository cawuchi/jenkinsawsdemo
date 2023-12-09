BIN_DIR = bin 

all: enable cluster remove

test:
	@echo "Building this project.."
	mkdir $(BIN_DIR)

clean:
	@echo "Cleaning up..."
	rm -rf $(BIN_DIR)

enable:
	@echo "Enabling the Container Service Feature..."
	databricks api patch /api/2.0/workspace-conf --json '{ "enableDcs" : "true"}'

cluster:
       @echo "Building the cluster
	 databricks clusters create --json '{ "cluster_name": "DockerCluster-image, "spark_version": "13.3.x-scala2.12", "node_type_id": "i3.xlarge", "num_workers": 0, 
"aws_attributes": {"first_on_demand": 1, "availability": "SPOT_WITH_FALLBACK", "zone_id": "auto", "instance_profile_arn": 
"arn:aws:iam::961109637079:instance-profile/ScumProjectTeam2-ECR", "spot_bid_price_percent": 100, "ebs_volume_count": 0},
"docker_image": {"url":"961109637079.dkr.ecr.us-east-2.amazonaws.com/scumprojectteam2:latest"}, "single_user_name": "scumprojectt2@gmail.com", 
"enable_local_disk_encryption": false, "data_security_mode": "SINGLE_USER", "runtime_engine": "PHOTON" }'

remove:
      @echo "Removing the cluster
      databricks clusters delete 
