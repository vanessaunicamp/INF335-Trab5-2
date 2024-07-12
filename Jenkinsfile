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
                    def dockerImage = docker.build('olaunicamp')
                    dockerImage.inside('-v /var/run/docker.sock:/var/run/docker.sock') {
                        sh 'echo "Executando dentro do contêiner Docker"'
                        sh 'ls -l'
                    }
                }
            }
        }

        stage('Run Docker Image') {
            steps {
                script {
                    def dockerContainer = docker.image('olaunicamp').run('-v /var/run/docker.sock:/var/run/docker.sock')
                    def output = dockerContainer.inside('-v /var/run/docker.sock:/var/run/docker.sock') {
                        sh 'echo "Executando o contêiner Docker"'
                        sh 'ls -l'
                    }
                    echo "Saída do contêiner Docker:"
                    echo output
                }
            }
        }
    }
}
