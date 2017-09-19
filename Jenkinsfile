#!groovy
pipeline {
    agent any
    triggers {
        pollSCM('H/3 * * * 1-5')
    }
    environment {
        MAIN_DIR = ''
    }
    stages {
        stage('Develop Branch <server dev>') {
            when {
                branch 'develop'
            }
            steps {
                ansiColor('xterm') {
                    echo '<<< start develop >>>'
                    sh '/usr/bin/terraform init -backend-config "bucket=prd-terraform-ss"'
                    sh '/usr/bin/terraform env workspace prd'
                    sh '/usr/bin/terraform plan -var-file=/etc/terraform/prd/credentials.tfvars'
                }
            }
        }
        /*stage('Master Branch <server prd>') {
        when {
            branch 'master'
        }
        steps {
            ansiColor('xterm') {
                echo '<<< start develop >>>'
            }
        }
    }*/
    }
}