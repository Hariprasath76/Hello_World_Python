pipeline {
    agent any

    environment {
        IMAGE_NAME = "hello_world_app"
    }

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
                sh 'docker build -t ${IMAGE_NAME} .'
            }
        }

        stage('Run Container') {
            steps {
                sh 'docker run -d --name hello_world_container -p 5000:5000 ${IMAGE_NAME}'
            }
        }
    }

    post {
        success {
            echo '✅ Build succeeded!'
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
            echo '❌ Build failed!'
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
