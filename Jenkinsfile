pipeline {
    agent any
    stages {
        /*stage('Checkout') {
            steps {
                git 'git@github.com:yangmengqing/todobackend.git'
            }
        }*/
        stage('Test Make') {
            steps {
                sh 'make test'
            }
        }
    }
}