#!/usr/bin/env groovy

pipeline {
    agent any 
    stages {
        stage('Unit Test') {
            steps {
                git(url: "https://github.com/dsirine/node.git", branch: "${ghprbSourceBranch}")
                sh "npm install"
                sh "npm test"
            }
        }
    }
}
