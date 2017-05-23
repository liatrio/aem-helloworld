pipeline {
    agent none
    stages {
        stage ('Build') {
            agent {
                docker {
                    image 'maven:3-jdk-8-onbuild-alpine'
                }
            }
            steps {
                sh 'mvn install -PautoInstallPackage -Dpublish.crx.host=aem -Dpublish.crx.port=4502'
            }
        }
        stage ('Selenium') {
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
