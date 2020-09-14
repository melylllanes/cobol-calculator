pipeline {
    agent none
     stages {
         stage('Unit Testing') {
             agent {
                 label 'cobol-bin'
             }
             steps {
                 echo 'Compile unit testing framework'
                 echo 'Unit test'
                 sh './compile ZUTZCPC'
                 echo 'Run test suite calculator'
                 sh './run-ut CALCULATOR2C CALCULATOR2 CALCULATOR2T'
             }
         }
         stage('SonarCloud Analysis') {
             agent {
                 label 'cobol-bin'
             }            
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
           agent {
                label 'cobol-bin'
            }
            steps {
                sh 'cd src/main/cobol; cobc -free -x -o calculator2-exe CALCULATOR2.CBL; ls -al; cp calculator2-exe /tmp; ls /tmp;'
                checkout changelog: false, poll: false, scm: [$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/diana-estrada/hellocucumber.git']]]
                echo 'Buid the calculator binary'
                sh 'chmod 777 /tmp/calculator2-exe; cp /tmp/calculator2-exe .; ls -al; pwd; mvn clean test; pwd'
            }
        }
         stage('Development | Build') {
           agent {
                label 'cobol-bin'
            }
            steps {
                echo 'Build the calculator '
                script{
                  try{
                    sh 'oc new-build --strategy docker --binary --name calculator2-exe'
                    sh 'oc start-build calculator2-exe --from-dir . --follow'
                  }
                  catch (error){
                    sh 'oc start-build calculator2-exe --from-dir . --follow'
                  }
                }
            }
        }
    }
    // post {
    //     always {
    //         cucumber buildStatus: 'UNSTABLE',
    //             reportTitle: 'My report',
    //             fileIncludePattern: '**/*.json'
    //     }
    // }
}
