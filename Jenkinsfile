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

    stage('Build & Run') {
      steps {
        sh './deploy.sh'
      }
    }
  }
}
