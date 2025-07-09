pipeline {
  agent any

  environment {
    SERVICE_NAME = 'react-template'
    SERVICE_PORT = '8080'
  }

  stages {
    stage('Clone Project') {
      steps {
        git 'https://github.com/thingthingsiv/reactjs-template.git'
      }
    }

    stage('Set Script Permission') {
      steps {
        sh 'chmod +x ./deploy.sh'
        sh 'chmod +x ./configure-nginx.sh'
      }
    }

    stage('Build & Run') {
      steps {
        sh './deploy.sh'
      }
    }
  }
}
