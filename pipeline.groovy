pipeline {
    agent any 
    stages {
        stage('pull') { 
            steps {
                git 'https://github.com/SurajBele/studentapp.ui.git'
                 echo "pull successful" 
            }
        }
        stage('Build') { 
            steps {
                sh 'mvn clean package'
                echo "building successful" 
            }
        }
        stage('Test') { 
            steps {
                withSonarQubeEnv(installationName: 'sonar-server', credentialsId: 'sonar-token') {
                sh 'mvn sonar:sonar -Dsonar.projectKey=student-app'
                echo "testing is successful"
                }
            }
        }
        stage('quality gate') { 
            steps {
               
                waitForQualityGate abortPipeline: true
                echo "gate is successful"
            }
        }
        stage('Deploy') { 
            steps {
                echo "deploy is successful"
            }
        }
    }
}