#!/usr/bin/env groovy

pipeline {
    agent any 
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
    }
}
