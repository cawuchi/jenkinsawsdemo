pipeline{
  agent any
  stages {
    stage ('Welcome to the Plan A') {
      steps {
        // sh 'printenv'
        sh 'echo "Excuting Plan A"'
      }
    }
    stage ('Build and Push Image ERC') {
      steps{
        withEnv (["AWS_ACCESS_KEY_ID=${env.AWS_ACCESS_KEY_ID}", "AWS_SECRET_ACCESS_KEY=${env.AWS_SECRET_ACCESS_KEY}", "AWS_DEFAULT_REGION=${env.AWS_DEFAULT_REGION}"]) {
          sh 'docker login -u AWS -p $(aws ecr get-login-password --region us-east-2) 961109637079.dkr.ecr.us-east-2.amazonaws.com'
          //sh 'docker build -t scumprojectimage .'
         // sh 'docker tag scumprojectimage:latest 961109637079.dkr.ecr.us-east-2.amazonaws.com/scumprojectimage:latest
          // sh 'docker push  961109637079.dkr.ecr.us-east-2.amazonaws.com/scumprojectimage:latest 

        }
      }
    }
    stage ("Test Connection to Terraform"){
      steps{
        sh 'terraform --version'
        // sh 'terraform -chdir=plana init'
        // sh 'terraform -chdir=plana plan'
      }
    }
    stage ('Test Connection to Databricks') {
      steps{
        withEnv (["DATABRICKS_HOST=${env.DATABRICKS_HOST}", "DATABRICKS_TOKEN=${env.DATABRICKS_TOKEN}"]) {
        sh 'databricks configure --token'
        sh 'databricks clusters list'
        sh 'databricks api patch /api/2.0/workspace-conf --json '{"enableDcs":"true"}'' //Enabling the Container Service Feature
        }
      }
    }
    stage ('Build and provision the Databricks cluster') {
      steps{
        withEnv (["DATABRICKS_HOST=${env.DATABRICKS_HOST}", "DATABRICKS_TOKEN=${env.DATABRICKS_TOKEN}"]) {
        sh 'databricks clusters create --json '{ "cluster_name": "DockerCluster-""$BUILD_ID"", "spark_version": "13.3.x-scala2.12", "node_type_id": "i3.xlarge", "num_workers": 0, 
"aws_attributes": {"first_on_demand": 1, "availability": "SPOT_WITH_FALLBACK", "zone_id": "auto", "instance_profile_arn": 
"arn:aws:iam::961109637079:instance-profile/ScumProjectTeam2-ECR", "spot_bid_price_percent": 100, "ebs_volume_count": 0},
"docker_image": {"url":"961109637079.dkr.ecr.us-east-2.amazonaws.com/scumprojectteam2:latest"}, "single_user_name": "scumprojectt2@gmail.com", 
"enable_local_disk_encryption": false, "data_security_mode": "SINGLE_USER", "runtime_engine": "PHOTON" }''

        }
      }
    } 
  } 
}
