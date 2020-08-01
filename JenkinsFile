pipeline {
  agent any 
  stages {
    stage('Lint HTML') {
      steps {
          sh 'tidy -q -e *.html'
      }
    }
    // stage ('Build Docker image') {

    // }
    // stage ('Push Image to DockerHub') {

    // }
    // stage ('Deploy Image to Kubernetes') {

    // }
  }
}