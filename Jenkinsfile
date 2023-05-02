pipeline {
    agent any
    stages {
        stage('Checkout Git') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/Rajesh3284/devOps.git']]])
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t my-image .'
            }
        }
        stage('Run Docker Container') {
            steps {
                sh 'docker run -d -p 80:80 my-image'
            }
        }
	  stage('Tag and push Docker image') {
		steps {
		   
                sh 'docker push rajesh7700/devops:my-image'
            }
	  }
    }
}
