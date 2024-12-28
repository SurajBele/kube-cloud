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
                sh '/opt/apache-maven-3.9.9/bin/mvn clean package'
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