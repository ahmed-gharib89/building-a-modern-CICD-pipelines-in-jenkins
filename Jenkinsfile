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
        stage("Start test app"){
            steps{
                echo "====++++executing Start test app++++===="
                sh """
                    docker-compose up -d
                    chmod +x ./scripts/test_container.sh
                    ./scripts/test_container.sh
                """

            }
            post{
                success{
                    echo "====++++Start test app executed successfully++++===="
                }
                failure{
                    echo "====++++Start test app execution failed++++===="
                }
        
            }
        }
        stage("Run test"){
            steps{
                echo "====++++executing Run test++++===="
                sh """
                    pip3 install pytest
                    pytest ./tests/test_sanple.py
                """
            }
            post{
                success{
                    echo "====++++Run test executed successfully++++===="
                }
                failure{
                    echo "====++++Run test execution failed++++===="
                }
        
            }
        }
        stage("End test"){
            steps{
                echo "====++++executing End test++++===="
                sh "docker-compose down"
            }
            post{
                success{
                    echo "====++++End test executed successfully++++===="
                }
                failure{
                    echo "====++++End test execution failed++++===="
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