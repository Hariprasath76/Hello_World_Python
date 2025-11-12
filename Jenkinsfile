pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Hariprasath76/Hello_World_Python.git'
            }
        }

        stage('Build') {
            steps {
                echo 'Building the Docker image...'
                sh 'docker build -t onedata_app .'
            }
        }

        stage('Run') {
            steps {
                echo 'Running container...'
                sh 'docker run -d -p 8000:8000 onedata_app'
            }
        }
    }

    post {
        success {
            echo '✅ Build and run successful!'
        }
        failure {
            echo '❌ Build failed.'
        }
    }
}
