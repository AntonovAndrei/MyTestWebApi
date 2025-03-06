pipeline {
    agent {
        docker {
            image 'mcr.microsoft.com/dotnet/sdk:8.0'
            // Дополнительно можно указать аргументы контейнера, например, для монтирования кэша nuget:
            // args '-v /var/jenkins_home/.nuget:/root/.nuget'
        }
    }
    stages {
        stage('Checkout') {
            steps {
                // Клонируем репозиторий прямо в контейнере
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
