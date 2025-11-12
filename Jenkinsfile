pipeline {
    agent any

    environment {
        IMAGE_NAME = "onedata_app"
        CONTAINER_NAME = "onedata_container"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Hariprasath76/Hello_World_Python.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo "🚀 Building Django Docker image..."
                sh 'docker build -t ${IMAGE_NAME} .'
            }
        }

        stage('Run Container') {
            steps {
                sh '''
                    docker rm -f ${CONTAINER_NAME} || true
                    docker run -d --name ${CONTAINER_NAME} -p 8000:8000 ${IMAGE_NAME}
                '''
            }
        }
    }

    post {
        always {
            script {
                def buildStatus = currentBuild.currentResult ?: "UNKNOWN"
                emailext(
                    from: 'jenkins@gmail.com',
                    to: 'hariprasathawsdevops@gmail.com',
                    subject: "Build ${JOB_NAME} #${BUILD_NUMBER} - ${buildStatus}",
                    body: """
                        <p>Hi Team,</p>
                        <p>The build <b>${JOB_NAME} #${BUILD_NUMBER}</b> has finished with status:
                        <b style="color:${buildStatus == 'SUCCESS' ? 'green' : buildStatus == 'FAILURE' ? 'red' : 'orange'}">
                            ${buildStatus}
                        </b></p>
                        <p>Check the full console output at:
                        <a href="${BUILD_URL}">${BUILD_URL}</a></p>
                        <p>Regards,<br>Jenkins Server</p>
                    """,
                    mimeType: 'text/html',
                    attachLog: true
                 )
            }
        }
    }
}
