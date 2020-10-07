pipeline {
    parameters {
        booleanParam(name: 'TAG_JAVA', defaultValue: true, description: 'Execute Java')
        booleanParam(name: 'TAG_COBOL', defaultValue: true, description: 'Execute Cobol')
        booleanParam(name: 'TAG_CUCUMBER', defaultValue: true, description: 'Execute Ccucumber')
        booleanParam(name: 'TAG_SONAR', defaultValue: true, description: 'Execute Sonar')
    }

    agent { label 'Right_node' }

    stages {
        stage('Check Environment') {
            steps {
                script {
                    if (params.TAG_JAVA.toBoolean()) {
                        TAG_JAVA = 'java'
                 } else {
                        TAG_JAVA = ''
                    }

                    if (params.TAG_COBOL.toBoolean()) {
                        TAG_COBOL = 'cobol'
                    }
                    if (params.TAG_CUCUMBER.toBoolean()) {
                        TAG_CUCUMBER = 'cucumber'
                    }
                        if (params.TAG_SONAR.toBoolean()) {
                        TAG_SONAR = 'sonar'
                        }
                }

                ansiblePlaybook become: true, installation: 'Ansible', inventory: 'l', playbook: 'ansible/check_playbook.yml', tags: 'java, cobol, cucumber, sonar'
            }
        }
    }
}
