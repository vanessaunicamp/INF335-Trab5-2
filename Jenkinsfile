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
                    dockerImage.inside {
                        // Comandos que você deseja executar dentro do contêiner Docker
                        sh 'echo "Executando dentro do contêiner Docker"'
                        sh 'ls -l'
                    }
                }
            }
        }

        stage('Run Docker Image') {
            steps {
                script {
                    def dockerContainer = docker.image('olaunicamp').run()
                    // Capturar a saída do contêiner e imprimir no console
                    def output = dockerContainer.inside {
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
