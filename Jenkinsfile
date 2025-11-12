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
    post {
    success {
        emailext(
            to: 'hariprasathawsdevops@gmail.com',
            subject: "✅ SUCCESS: ${env.JOB_NAME} #${env.BUILD_NUMBER}",
            body: """
            Hello Hari 👋,

            ✅ Build Successful!

            • Job: ${env.JOB_NAME}
            • Build Number: ${env.BUILD_NUMBER}
            • Branch: ${env.GIT_BRANCH}
            • Commit: ${env.GIT_COMMIT}

            View build details here:
            ${env.BUILD_URL}

            Best,
            Jenkins 🚀
            """
        )
    }
    failure {
        emailext(
            to: 'hariprasathawsdevops@gmail.com',
            subject: "❌ FAILURE: ${env.JOB_NAME} #${env.BUILD_NUMBER}",
            body: """
            Hello Hari 👋,

            ❌ Build Failed.

            • Job: ${env.JOB_NAME}
            • Build Number: ${env.BUILD_NUMBER}

            Check the logs here:
            ${env.BUILD_URL}

            - Jenkins 🤖
            """
        )
    }
}

}
