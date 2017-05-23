pipeline {
    agent none
    stages {
        stage ('Build') {
            agent {
                docker {
                    image 'alpine'
                }
            }
            steps {
                sh 'mvn clean install'
            }
        }
        stage (Selenium) {
            agent {
                docker {
                    image 'liatrio/selenium-firefox'
                    args '--network=plumbing_default'
                }
            }
            steps {
                sh 'ruby tests_spec.rb'
            }
        }
    }
}
