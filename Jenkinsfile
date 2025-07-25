@Library('my-shared-lib') _

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
        script {
          // Assuming your shared lib has a function to set permission
          setScriptPermission(['deploy.sh', 'configure-nginx.sh'])
          // Or if you want to keep shell, just leave it here
          // sh 'chmod +x ./deploy.sh'
          // sh 'chmod +x ./configure-nginx.sh'
        }
      }
    }

    stage('Build & Run') {
      steps {
        script {
          // Assuming your shared lib has a function to run deploy
          runDeployScript('./deploy.sh')
          // Or keep shell call directly
          // sh './deploy.sh'
        }
      }
    }
  }
}
