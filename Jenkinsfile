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
          sh 'docker login -u AWS -p $(aws ecr get-login-password --region us-east-2) 232920852660.dkr.ecr.us-east-2.amazonaws.com'
          sh 'echo testing'
          sh 'docker build -t scumprojectimage .'
          sh 'docker tag scumprojectimage:latest 232920852660.dkr.ecr.us-east-2.amazonaws.com/scumprojectimage:latest'
          sh 'docker push 232920852660.dkr.ecr.us-east-2.amazonaws.com/scumprojectimage:latest'
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
  } 
}
