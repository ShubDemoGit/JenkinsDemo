prevBuildCommitId = ''

pipeline {
    agent any
    parameters {
        booleanParam(name: 'RESTART', defaultValue: false, description: 'Restart  all services')
    }
    options { skipDefaultCheckout() }
    stages {
        stage("Restart") {
            when { expression { params.RESTART == true } }
            steps {
                script {
                    checkout scm
                    sh script : "echo pwd > commands.sh"
                    restartAll()
                }
            }
        }
        stage("SCM checkout") {
            when { expression { params.RESTART == false } }
            steps {
                script {
                    try {
                        prevBuildCommitId = sh script: "git rev-parse --short HEAD", returnStdout: true
                    } catch (ex) {
                        echo "${ex.message}"
                    }
                    cleanWs()
                    checkout scm
                }
            }
        }
        stage('Modified Projects'){
            when { expression { params.RESTART == false } }
            steps {
                script {
                    echo "In stage : MODIFIED PROJECTS"
                }
            }
        }
        stage('Build Services') {
            when { expression { params.RESTART == false } }
            steps {
                script {
                    echo "In stage : BUILD SERVICES"
                }
            }
        }
        stage('Generate Command') {
            when { expression { params.RESTART == false } }
            steps {
                script {
                    echo "In stage : GENERATE COMMAND"
                }
            }
        }
        stage('Deploy DEV') {
            when { expression { params.RESTART == false } }
            steps {
                script {
                    echo "In stage : DEPLOY DEV"
                }
            }
        }
        stage('Deploy UAT') {
            when { expression { params.RESTART == false } }
            steps {
                script {
                    echo "In stage : DEPLOY UAT"
                }
            }
        }
    }
}