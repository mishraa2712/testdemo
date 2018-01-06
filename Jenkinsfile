pipeline {
    agent any
    stages {
        stage('Build Step') {
            steps {
                bat 'mvn clean compile'
            }
        }
        stage('Manual Input') {
            steps {
                input "Does the staging environment look ok?"
            }
        }
        stage('Test Result') {
            steps {
                bat 'mvn test'
            }
        }
    }
}
