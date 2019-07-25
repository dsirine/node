#!/usr/bin/env groovy

pipeline {
    agent any
def Namespace = "default"
def ImageName = "dsirine/cicd"
def Creds	= "dsirine_docker_hub" 
    stages {
        stage('Checkout'){
        git(url: "https://github.com/dsirine/node.git", branch: "${ghprbSourceBranch}")
        sh "git rev-parse --short HEAD > .git/commit-id"
        imageTag = readFile('.git/commit-id').trim()
        } 
        stage('Unit Test') {
            steps {
                git(url: "https://github.com/dsirine/node.git", branch: "${ghprbSourceBranch}")
                sh "npm install"
                sh "npm test"
            }
        }
        stage('Docker Build') {
                sh "docker build -t ${ImageName}:${imageTag} ."
        }
        stage('Scan docker image') {
                aquaMicroscanner imageName: "${ImageName}:${imageTag}", notCompliesCmd: 'exit 1', onDisallowed: 'fail'
        }
        stage('Docker Build, Push'){
            withDockerRegistry([credentialsId: "${Creds}", url: 'https://index.docker.io/v1/']) {        
            sh "docker push ${ImageName}"
            }
        }    
    }
}
