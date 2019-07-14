#!/usr/bin/env groovy

stage("Unit Tests") {
  git(url: "https://github.com/dsirine/node.git", branch: "${ghprbSourceBranch}")
  sh "npm install"
  sh "npm test"
}
