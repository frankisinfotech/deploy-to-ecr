pipeline {
  agent any
  stages {

    stage ('Build and Publish Image') {
      steps {
        withEnv(["AWS_ACCESS_KEY_ID=${env.AWS_ACCESS_KEY_ID}", "AWS_SECRET_ACCESS_KEY=${env.AWS_SECRET_ACCESS_KEY}", "AWS_DEFAULT_REGION=${env.AWS_DEFAULT_REGION}"]) 
          {
            sh 'docker login --username AWS -p $(aws ecr-public get-login-password --region us-east-1) public.ecr.aws/g0b5g9q2'
            sh 'docker build -t cohortimages .'
            sh 'docker tag cohortimages:latest public.ecr.aws/g0b5g9q2/cohortimages:latest'
            sh 'docker push public.ecr.aws/g0b5g9q2/cohortimages:latest'
          }
      }
    }
  }
}
