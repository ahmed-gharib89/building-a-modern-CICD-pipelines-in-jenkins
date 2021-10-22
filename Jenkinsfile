pipeline{
    agent{
        label "docker"
    }
    stages{
        stage("Verify Branch"){
            steps{
                echo "========executing Verify Branch========"
                echo "git branch: ${GIT_BRANCH}"
            }
            post{
                always{
                    echo "========always========"
                }
                success{
                    echo "========Verify Branch executed successfully========"
                }
                failure{
                    echo "========Verify Branch execution failed========"
                }
            }
        }
    }
    post{
        always{
            echo "========always========"
        }
        success{
            echo "========pipeline executed successfully ========"
        }
        failure{
            echo "========pipeline execution failed========"
        }
    }
}