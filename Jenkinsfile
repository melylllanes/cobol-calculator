
pipeline {
    parameters {
        booleanParam(name: 'isJAVA', defaultValue: true, description: 'Execute Java')
        booleanParam(name: 'isCOBOL', defaultValue: true, description: 'Execute Cobol')
        booleanParam(name: 'isCUCUMBER', defaultValue: true, description: 'Execute Cucumber')
        booleanParam(name: 'isSONAR', defaultValue: true, description: 'Execute Sonar')
    }

    agent { label 'Right_node' }

    stages {
        stage('Check Environment') {
            steps {
                script {

                    if (params.isJAVA.toBoolean()) {
                        TAG_JAVA = 'java'
                 } else {
                        TAG_JAVA = ''
                    }

                    if (params.isCOBOL.toBoolean()) {
                        TAG_COBOL = 'cobol'
                    }else {
                        TAG_COBOL = ''
                    }
                    if (params.isCUCUMBER.toBoolean()) {
                        TAG_CUCUMBER = 'cucumber'
                    }else {
                        TAG_CUCUMBER = ''
                    }
                    if (params.isSONAR.toBoolean()) {
                        TAG_SONAR = 'sonar'
                    } else {
                        TAG_SONAR = ''
                    }
                }

                ansiblePlaybook become: true, installation: 'Ansible', inventory: 'l',
                playbook: 'ansible/check_playbook.yml', tags: ""
            }
        }
    }
}
