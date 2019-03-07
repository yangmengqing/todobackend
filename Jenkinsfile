pipeline {
    agent any
    stages {
        stage('Run Unit Tests') {
            steps {
                sh 'make test'
            }
        }

        stage('Build application artifacts') {
            steps {
                sh 'make build'
            }
        }

        stage('Create release environment and run acceptance test') {
            steps {
                sh 'make release'
            }
        }
    }

    post {
        always {
            step([$class: 'JUnitResultArchiver', testResults: '**/reports/*.xml'])
        }

        cleanup {
            sh 'make clean'
        }
    }
}