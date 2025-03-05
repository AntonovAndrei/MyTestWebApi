pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/AntonovAndrei/MyTestWebApi.git', branch: 'main'
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
            steps {
                echo 'Building...'
                sh 'docker build -t mytestwebapi .'
            }
        }
        // stage('Deploy') {
        //     steps {
        //         sh 'docker stop mytestwebapi || true'
        //         sh 'docker rm mytestwebapi || true'
        //         sh 'docker run -d --name mytestwebapi -p 9090:8080 mytestwebapi'
        //     }
        // }
        post {
            always {
                // Очищаем рабочую область после завершения сборки
                cleanWs()
            }
        }
    }
}
