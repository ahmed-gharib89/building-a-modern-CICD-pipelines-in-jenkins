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
                success{
                    echo "========Verify Branch executed successfully========"
                }
                failure{
                    echo "========Verify Branch execution failed========"
                }
            }
        }
        stage("DOcker Build"){
            steps{
                echo "====++++executing DOcker Build++++===="
                sh "docker images -a"
                sh '''
                    cd azure-vote
                    docker build -t azure-vote .
                    docker images -a
                    cd ..
                '''
            }
            post{
                success{
                    echo "====++++DOcker Build executed successfully++++===="
                }
                failure{
                    echo "====++++DOcker Build execution failed++++===="
                }
        
            }
        }
    }
    post{
        success{
            echo "========pipeline executed successfully ========"
        }
        failure{
            echo "========pipeline execution failed========"
        }
    }
}