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
                sh 'mvn install -B'
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
                sh 'curl -u admin:admin -F file=~/.m2/repositories/com/shinesolutions/aem-helloworld-content/0.0.2-SNAPSHOT/aem-helloworld-content-0.0.2-SNAPSHOT.zip -F install=true http://aem:4502/crx/packmgr/service.jsp'
                sh 'ruby tests_spec.rb'
            }
        }
    }
}
