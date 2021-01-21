pipeline {
    agent any
        tools {
            terraform 'terraform'
        }
        stages {
            stage('git checkout') {
                steps {
                 git branch: 'main', credentialsId: '4f2f148f-78ee-4c10-b304-d6c3bce8a5a3', url: 'https://github.com/naveena3993/Jenkins.git'
                }
            }
        stage('Terraform init') {
            steps {
                sh 'terraform init'
                }
            }
        stage('terraform plan') {
            steps {
                sh 'terraform plan'
            }
        }
    }

}
