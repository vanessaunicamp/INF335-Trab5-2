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

        stage('Run Docker Container') {
            steps {
                script {
                    // Primeiro, pare o container se estiver rodando para evitar conflitos
                    docker.image('olaunicamp').stop()

                    // Remova o container antigo se existir
                    docker.image('olaunicamp').remove()

                    // Execute o container Docker
                    def dockerContainer = docker.image('olaunicamp').run("--name olaunicamp-container -d")
                    sh "docker exec olaunicamp-container echo 'Executing commands inside running container'"
                }
            }
        }
    }

    post {
        always {
            echo 'Finalizando Pipeline'
        }
    }
}
