pipeline {
  agent any 
  stages {
    stage('Lint HTML') {
      steps {
          sh 'tidy -q -e *.html'
      }
    }
    stage ('Build Docker image') {
      steps {
        service = docker.build("yatharth0045/my-application")
      }
    }
    stage ('Push Image to DockerHub') {
      steps {
        docker.withRegistry('https://registry.hub.docker.com', 'dockerhub-credentials') {
            service.push("${env.BUILD_NUMBER}")
            service.push("latest")
        }
      }
    }
    // stage ('Deploy Image to Kubernetes') {

    // }
  }
}