pipeline {
    agent any
    tools {
        maven 'Maven'
    }
    stages {
        stage ('Build') {
            steps {
                git 'https://github.com/shinesolutions/aem-helloworld.git'
                sh 'mvn clean install'
            }
        }
    }
}
