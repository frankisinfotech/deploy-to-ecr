pipeline {
  agent any
  stages {
    
    stage ('Build Private ECR') {
      steps {
        withEnv(["AWS_ACCESS_KEY_ID=${env.AWS_ACCESS_KEY_ID}", "AWS_SECRET_ACCESS_KEY=${env.AWS_SECRET_ACCESS_KEY}", "AWS_DEFAULT_REGION=${env.AWS_DEFAULT_REGION}"]) 
          {
            sh 'docker login --username AWS -p $(aws ecr get-login-password --region eu-west-1) 765176032689.dkr.ecr.eu-west-1.amazonaws.com'
            sh 'docker build -t merchantapi .'
            sh 'docker tag merchantapi:latest 765176032689.dkr.ecr.eu-west-1.amazonaws.com/merchantapi:$BUILD_ID'
            sh 'docker push 765176032689.dkr.ecr.eu-west-1.amazonaws.com/merchantapi:$BUILD_ID'
            
          }
      }
    }

    stage ('Install kubectl') {
      steps {
        sh 'curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.28.8/2024-04-19/bin/linux/amd64/kubectl'
        sh 'chmod +x ./kubectl'
        sh './kubectl version --client'
      }
    }
    
  }
}
