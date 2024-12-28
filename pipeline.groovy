pipeline {
    agent any 
    stages {
        stage('pull') { 
            steps {
                git branch: 'main', url: 'https://github.com/SurajBele/studentapp.ui.git'
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
                echo "testing is successful"
            }
        }
        stage('Deploy') { 
            steps {
                echo "deploy is successful"
            }
        }
    }
}