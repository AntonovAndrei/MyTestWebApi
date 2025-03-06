pipeline {
    agent {
        docker {
            image 'mcr.microsoft.com/dotnet/sdk:8.0'
        }
    }
    stages {
        stage('Checkout') {
            steps {
                // Клонируем репозиторий
                git url: 'https://github.com/AntonovAndrei/MyTestWebApi.git', branch: 'master'
                // Сохраняем рабочее пространство для дальнейших этапов
                stash name: 'source', includes: '**/*'
            }
        }
        stage('Restore and Build') {
            steps {
                // Восстанавливаем исходный код из stash
                unstash 'source'
                echo 'Restore and Build'
                sh 'dotnet restore'
                sh 'dotnet publish -c Release -o ./publish'
                // Сохраняем изменённое рабочее пространство для следующих этапов (если необходимо)
                stash name: 'build', includes: '**/*'
            }
        }
        stage('Test') {
            steps {
                unstash 'build'
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


