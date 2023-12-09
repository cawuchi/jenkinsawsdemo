pipeline{
  agent any
  stages {
    stage ('Welcome to the Plan A') {
      steps {
        sh 'printenv'
        sh 'echo "Excuting Plan A"'
      }
    }
    stage ('Build and Push Image ERC') {
      steps{
        withEnv (["AWS_ACCESS_KEY_ID=${env.AWS_ACCESS_KEY_ID}", "AWS_SECRET_ACCESS_KEY=${env.AWS_SECRET_ACCESS_KEY}", "AWS_DEFAULT_REGION=${env.AWS_DEFAULT_REGION}"]) {
          //sh 'docker login -u scumproject'
          //sh 'docker build -t scumprojectimage .'
         // sh 'docker tag scumprojectimage:latest 961109637079.dkr.ecr.us-east-2.amazonaws.com/scumprojectimage:latest
          // sh 'docker push  961109637079.dkr.ecr.us-east-2.amazonaws.com/scumprojectimage:latest 
          // sh 'echo testing'
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
        sh 'make clean'
        }
      }
    }
    stage ('Build and provision the Databricks cluster') {
      steps{
        withEnv (["DATABRICKS_HOST=${env.DATABRICKS_HOST}", "DATABRICKS_TOKEN=${env.DATABRICKS_TOKEN}"]) {
           sh 'make build'
           sh 'echo "success!"'
        }
      }
    } 
  } 
}
