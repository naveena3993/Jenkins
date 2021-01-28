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
            withCredentials([azureServicePrincipal('dev-azure-com')])
            clientId='$AZURE_CLIENT_ID';
            clientsecret= '$AZURE_CLIENT_SECRET';
            TenantID= '$AZURE_TENANT_ID';
            subscriptionid='$Azure_Subscription_ID'
      ]]) {
                sh '''terraform init'''
            }
        }
        
        stage('Terraform apply'){
            steps{
                sh 'terraform apply -auto-approve'
            }
        }
    }
}
