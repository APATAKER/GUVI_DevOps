pipeline {
    agent any

    stages {
        stage('Build & Test') {
            parallel {
                stage('Build') {
                    steps {
                        echo 'Building the application...'
                        bat 'mvn clean compile'
                    }
                }
                stage('Test') {
                    steps {
                        echo 'Running tests...'
                        bat 'mvn test'
                    }
                }
            }
        }

        stage('Package') {
            steps {
                echo 'Packaging the application...'
                bat 'mvn package'
            }
        }

        stage('Running') {
            steps {
                echo 'Running the application...'
                bat '''#!/bin/bash
                java -cp target/*.jar com.example.App'''
            }
        }

        /*stage('Push Artifact') {
            steps {
                echo 'Pushing the artifact...'
                // Replace with actual command to push the artifact
                sh 'echo "Pushing artifact to repository"'
            }
        }*/

        /*stage('Tag') {
            steps {
                echo 'Tagging the repository...'
                script {
                    try {
                        // This step will intentionally fail
                        sh 'exit 1'
                    } catch (Exception e) {
                        echo 'Tagging failed, but continuing to cleanup...'
                    }
                }
            }
        }*/

        stage('Cleanup') {
            steps {
                echo 'Cleaning up the workspace...'
                // Add any cleanup commands here
                bat 'echo "Cleanup done"'
            }
        }
    }

    post {
        success {
            echo "Pipeline ran with success"
        }
        failure {
            echo "Pipeline failed"
        }
    }
}
