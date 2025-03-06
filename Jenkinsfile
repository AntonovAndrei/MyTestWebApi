pipeline {
    agent {
        docker {
            image 'mcr.microsoft.com/dotnet/sdk:8.0'
            // ���� ������ ���������� ����� ��������� Docker-�������, ���������������� ������ ����:
            // args '-v /var/run/docker.sock:/var/run/docker.sock'
        }
    }
    stages {
        stage('Checkout') {
            steps {
                // ��������� �����������
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
            script {
                if (env.WORKSPACE) {
                    cleanWs()
                }
            }
        }
    }
}
