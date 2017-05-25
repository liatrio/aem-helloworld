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
                    args '--network=demodeploymentpipeline_default'
                }
            }
            def pom = readMavenPom
            steps {
                sh 'curl -u admin:admin -F install=true -F file=@"content/target/aem-helloworld-content-0.0.2-SNAPSHOT.zip" http://aem:4502/crx/packmgr/service.jsp'
                sh 'ruby tests_spec.rb'
            }
        }
    }
}
