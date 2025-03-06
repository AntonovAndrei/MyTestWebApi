pipeline {
    agent {
        docker {
            image 'mcr.microsoft.com/dotnet/sdk:8.0'
        }
    }
    stages {
        stage('Checkout') {
            steps {
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
        stage('Docker Build') {
            agent any // переопределяем агент для этапа Docker Build
            steps {
                echo 'Building Docker image...'
                sh 'docker build -t mytestwebapi .'
            }
        }
    }
    post {
        always {
            node {
                cleanWs()
            }
        }
    }
}

