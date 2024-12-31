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
                sh '''/opt/apache-maven-3.9.9/bin/mvn clean verify sonar:sonar \\
                -Dsonar.projectKey=myproject \\
                -Dsonar.host.url=http://54.175.241.42:9000 \\
                -Dsonar.login=sqp_00647787a60a80002763d1d897e5bf6baef8e24e'''
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