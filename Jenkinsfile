#!/user/bin/env groovy

def DOCKER_IMAGE_NAME='build-container'
def DOCKER_IMAGE_VERSION='1.0'

// plugin対応可能か調べる
def NEXUS_HOST_NAME='localhost'
def NEXUS_REPOSITORY_PORT='8083'

pipeline {
    agent any

    stages {
        stage('docker build & docker push') {
            steps {
                script {
                    echo "#############################################"
                    echo "                 docker stage                "
                    echo "#############################################"
                    sh "docker build -t $DOCKER_IMAGE_NAME:$DOCKER_IMAGE_VERSION ./"
                    withCredentials([[$class: 'UsernamePasswordMultiBinding',
                                      credentialsId: 'Nexus',
                                      usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD']]) {
                        sh "docker login -u ${USERNAME} -p ${PASSWORD} $NEXUS_HOST_NAME:$NEXUS_REPOSITORY_PORT"
                    }
                    def DOCKER_IMAGE_ID = sh(returnStdout: true, script: "docker images $DOCKER_IMAGE_NAME:$DOCKER_IMAGE_VERSION --format \"{{.ID}}\"").trim()
                    sh "docker tag ${DOCKER_IMAGE_ID} $NEXUS_HOST_NAME:$NEXUS_REPOSITORY_PORT/$DOCKER_IMAGE_NAME:$DOCKER_IMAGE_VERSION"
                    sh "docker push $NEXUS_HOST_NAME:$NEXUS_REPOSITORY_PORT/$DOCKER_IMAGE_NAME"
                }
            }
        }
    }
}