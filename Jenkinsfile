pipeline {
    agent any
    environment {
        imageName = "my-app"
	  containerName = "my-site"
    }
    stages {
        stage('Checkout Git') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/Rajesh3284/devOps.git']]])
            }
        }
        stage('Build image') {
            steps {
                    sh "docker build -t ${env.imageName} ."
                    sh "docker run --rm -d --name ${env.containerName} -p 80:80 ${enmv.imageName}"
            }
        }
        stage('Push image to Docker Hub') {
            steps {
                // Push the Docker image to Docker Hub repository
                sh 'docker push sriharsha7/devops:my-site'
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                // Deploy the Docker image to Kubernetes using kubectl
                sh 'kubectl apply -f kubernetes-manifest.yaml'
            }
        }
    }
    post {
        always {
            script {
                def containerName = "my-site-${env.BUILD_NUMBER}"
                def imageName = "my-app:${env.BUILD_NUMBER}"
                sh "docker stop ${containerName}"
                sh "docker rm ${containerName}"
                sh "docker rmi -f ${imageName}"
            }
        }
    }
}
