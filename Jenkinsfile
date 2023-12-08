pipeline{
  agent any
  stages {
    stage ('Build') {
      steps {
        // sh 'printenv'
        sh 'echo "Hello"'
      }
    }
    stage ('Publish ERC') {
      steps{
        withEnv (["AWS_ACCESS_KEY_ID=${env.AWS_ACCESS_KEY_ID}", "AWS_SECRET_ACCESS_KEY=${env.AWS_SECRET_ACCESS_KEY}", "AWS_DEFAULT_REGION=${env.AWS_DEFAULT_REGION}"]) {
          sh 'docker login -u AWS -p $(aws ecr get-login-password --region us-east-2) 961109637079.dkr.ecr.us-east-2.amazonaws.com'
          sh 'docker build -t ecr-demoing .'
          sh 'docker tag ecr-demoing:latest 961109637079.dkr.ecr.us-east-2.amazonaws.com/erc-demoing:""$BUILD_ID""'
          sh 'docker push  961109637079.dkr.ecr.us-east-2.amazonaws.com/erc-demoing:""$BUILD_ID""'

        }
      }
    }
    stage ("Testing Terraform"){
      steps{
        sh 'terraform --version'
        sh 'terraform -chdir=instance init'
        sh 'terraform -chdir=instance plan'
      }
    }
    stage ('Testing Databricks') {
      steps{
        withEnv (["DATABRICKS_HOST=${env.DATABRICKS_HOST}", "DATABRICKS_TOKEN=${env.DATABRICKS_TOKEN}"]) {
        sh 'databricks configure --token'
        sh 'databricks clusters list'
        }
      }
    }  
  } 
}
