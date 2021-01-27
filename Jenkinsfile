pipeline{
    agent any
    tools {
        terraform 'terraform'
    }
    stages{
        stage('Git checkout'){
            steps{
               git branch: 'main', credentialsId: '957b5ca3-2495-482e-8bd8-c98f1525cd59', url: 'https://github.com/naveena3993/Jenkins.git'
           }
        }
        stage('Terraform init'){
            steps{
                sh '''terraform init'''
            }
        }
        
        stage('Plan') {
            steps {
                sh 'Terraform plan'
                }
        }
        stage('Terraform apply'){
            steps{
                sh 'terraform apply -auto-approve'
            }
        }
    }
}
