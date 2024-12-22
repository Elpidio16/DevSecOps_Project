pipeline {
    agent any
    environment {
        DOCKER_IMAGE = 'elpidio16/dvwa'
    }
    triggers {
        githubPush()
    }
    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/Elpidio16/DevSecOps_Project.git'
            }
        }
        stage('Build and Push Docker Image') {
            steps {
                script {
                    sh 'docker build -t $DOCKER_IMAGE .'
                    sh 'docker push $DOCKER_IMAGE'
                }
            }
        }
        stage('Terraform Init') {
            steps {
                dir('terraform') {
                    sh 'terraform init'
                }
            }
        }
        stage('Terraform Plan') {
            steps {
                dir('terraform') {
                    sh 'terraform plan -var-file=terraform.tfvars -out=tfplan'
                }
            }
        }
        stage('Terraform Apply') {
            steps {
                dir('terraform') {
                    sh 'terraform apply -auto-approve tfplan'
                }
            }
        }
    }
    post {
        always {
            echo "Pipeline terminé"
        }
        failure {
            echo "Le pipeline a échoué. Consultez les logs Jenkins."
        }
    }
}
