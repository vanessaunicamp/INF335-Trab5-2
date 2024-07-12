pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'github-pat', url: 'https://github.com/vanessaunicamp/INF335-Trab5-2']]])
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
                    docker.image('olaunicamp').run()
                }
            }
        }
    }
}
