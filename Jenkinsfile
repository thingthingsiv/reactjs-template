@Library('my-shared-lib@main') _

pipeline {
  agent any

  stages {
    stage('Test Shared Library Functions') {
      steps {
        script {
          echo "Testing setScriptPermission function"
          setScriptPermission(['deploy.sh', 'configure-nginx.sh'])

          echo "Testing runDeployScript function"
          runDeployScript('echo Hello from shared library')
        }
      }
    }
  }
}
