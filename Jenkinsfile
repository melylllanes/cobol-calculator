
pipeline {
    parameters {
        booleanParam(name: 'TAG_COBOL', defaultValue: true, description: 'Execute Cobol')
      
    }

    agent { label 'Right_node' }

    stages {
        stage('Check Environment') {
            steps {
                script {              
                    if (params.TAG_COBOL.toBoolean()) {
                        TAG_COBOL = 'cobol'
                    }else {
                        TAG_COBOL = ''
                    }                 
                }

                ansiblePlaybook become: true, installation: 'Ansible', inventory: 'l',
                playbook: 'ansible/check_playbook.yml', tags: params.TAG_COBOL
            }
        }
    }
}
