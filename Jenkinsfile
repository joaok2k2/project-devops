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
    }
}