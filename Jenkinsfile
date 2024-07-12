pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build('olaunicamp')
                }
            }
        }
        stage('Run Docker Image') {
            steps {
                script {
                    docker.image('olaunicamp').inside {
                        bat 'java OlaUnicamp'
                    }
                }
            }
        }
    }
}
