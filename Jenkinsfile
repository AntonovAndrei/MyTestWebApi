pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                // Клонируем репозиторий
                git url: 'https://github.com/AntonovAndrei/MyTestWebApi.git', branch: 'master'
            }
        }
        stage('Restore and Build') {
            steps {
                echo 'Restore and Build'
                sh 'dotnet restore'
                sh 'dotnet publish -c Release -o ./publish'
            }
        }
        stage('Test') {
            steps {
                echo 'Running tests...'
                sh 'dotnet test'
            }
        }
    }
    post {
        always {
            // Очистка рабочего пространства после сборки
            cleanWs()
        }
    }
}


