pipeline{
  agent any
  stages {
    stage ('Build') {
      steps {
        sh 'printenv'
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
  } 
}
