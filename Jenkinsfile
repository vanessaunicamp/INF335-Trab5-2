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
                    def dockerImage = docker.build("olaunicamp")
                }
            }
        }
        
        stage('Run Docker Image') {
            steps {
                script {
                    dockerImage.run("--rm -d -p 8080:8080")
                }
            }
        }
    }
}
