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
        script{
          service = docker.build("yatharth0045/my-application")
        }
      }
    }
    stage ('Push Image to DockerHub') {
      steps {
        script{
          docker.withRegistry('https://registry.hub.docker.com', 'dockerhub-credentials') {
              service.push("${env.BUILD_NUMBER}")
              service.push("latest")
          }
        }
      }
    }
    stage ('Deploy Image to Kubernetes') {
      steps {
        sh label: 'kubectl-deploy', script: "kubectl version --short --client"
        // sh label: 'kubectl-deploy', script: "kubectl apply -f deployment-rolling-update.yaml"
      }
    }
  }
}