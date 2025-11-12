pipeline {
    agent any


    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Hariprasath76/Hello_World_Python.git'
            }
        }
            
        stage('Check Docker') {
            steps {
                sh 'docker version'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo "🚀 Building Docker image..."
                sh 'docker build -t hello_world_app .'
            }
        }

        stage('Run Container') {
            steps {
                echo "🏃 Running the app..."
                // Stop old container if it exists, ignore error
                sh 'docker stop hello_world_app || true'
                sh 'docker rm hello_world_app || true'
                // Run the new container
                sh 'docker run -d --name hello_world_app -p 5001:5000 hello_world_app'
            }
        }
    }

    post {
        success {
            echo "✅ Build and run completed successfully!"
        }
        failure {
            echo "❌ Build failed."
        }
    }
}
