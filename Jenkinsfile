pipeline {
    agent {
        docker {
            image 'mcr.microsoft.com/dotnet/sdk:8.0'
        }
    }
    stages {
        stage('Checkout') {
            steps {
                // ��������� �����������
                git url: 'https://github.com/AntonovAndrei/MyTestWebApi.git', branch: 'master'
                // ��������� ������� ������������ ��� ���������� ������
                stash name: 'source', includes: '**/*'
            }
        }
        stage('Restore and Build') {
            steps {
                // ��������������� �������� ��� �� stash
                unstash 'source'
                echo 'Restore and Build'
                sh 'dotnet restore'
                sh 'dotnet publish -c Release -o ./publish'
                // ��������� ��������� ������� ������������ ��� ��������� ������ (���� ����������)
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
        stage('Docker Build') {
            // ����� �������������� ������, ����� ������������ �������� ������, ��� �������� ������� docker
            agent any
            steps {
                // ��������������� ������� ������������ ��� ������ Docker ������
                unstash 'build'
                echo 'Building Docker image...'
                sh 'docker build -t mytestwebapi .'
            }
        }
    }
    post {
        always {
            // ������� �������� ������������ ����� ������
            cleanWs()
        }
    }
}


