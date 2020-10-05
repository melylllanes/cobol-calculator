pipeline {
    agent none
     stages {
         stage('Check Environment') {
             steps {
                 ansiblePlaybook become: true, installation: 'Ansible', inventory: 'l', playbook: 'check_playbook.yml', tags: '$(TAG_JAVA),$(TAG_COBOL),$(TAG_CUCUMBER),$(TAG_SONAR)'
             }
         }
         stage('Unit Testing') {
             steps {
                 echo 'Compile unit testing framework'
                 echo 'Unit test'
                 sh './compile ZUTZCPC'
                 echo 'Run test suite calculator'
                 sh './run-ut CALCULATOR2C CALCULATOR2 CALCULATOR2T'
             }
         }
         stage('SonarCloud Analysis') {            
             environment {
                 scannerHome = tool 'SonarCubeScanner'
             }            
             steps {
                 withSonarQubeEnv('sonar') {
                     sh "${scannerHome}/bin/sonar-scanner"
                 }               
             }
         }
        stage('Functional Testing Cucumber') {
            steps {
                sh 'cd src/main/cobol; cobc -free -x -o calculator2-exe CALCULATOR2.CBL; ls -al; cp calculator2-exe /tmp; ls /tmp;'
                checkout changelog: false, poll: false, scm: [$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/diana-estrada/hellocucumber.git']]]
                echo 'Buid the calculator binary'
                sh 'chmod 777 /tmp/calculator2-exe; cp /tmp/calculator2-exe .; ls -al; pwd; mvn clean test; pwd'
            }
        }
        
    }
    
}
