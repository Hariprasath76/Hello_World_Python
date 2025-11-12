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
            steps { sh '''
            docker rm -f hello_world_container || true
            docker run -d --name hello_world_container -p 5000:5000 hello_world_app
        '''
            }
        }
    }

    post {
    always {
        script {
            def buildStatus = currentBuild.currentResult ?: "UNKNOWN"
            emailext(
                from: 'jenkins@grouppal.in',
                to: 'hariprasath.m@grouppal.in,ajithkumar.k@grouppal.in,magudeeswaran.t@grouppal.in',
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