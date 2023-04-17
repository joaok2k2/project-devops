pipeline {
    agent any
    
    stages {
        
        stage ('Build docker Image') {
            steps {
                script {
                    dockerapp = docker.build("joaosilvadev/project-devops:${env.BUILD_ID}")
                }
            }
        }

        stage ('Push Docker Image'){
            steps{
                script{
                    docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {
                        dockerapp.push('latest')
                        dockerapp.push("${env.BUILD_ID}")
                    }
                    
                }
            }
        }

        stage ('Deploy Kubernetes'){
            steps{
                script{
                    withAWS (credentialsId: 'aws', region: 'us-west-2') {
                        sh ("aws eks --region us-west-2 update-kubeconfig --name demo-terraform")
                        sh 'kubectl apply -f ./k8s/deployment.yaml'
                    }
                }
            }
        }
    }
}