pipeline
{
    agent any
    tools
    {
        maven 'Maven'
    }
    
    stages
    {
        stage('Checkout'){
            steps{
                echo "checkout"
                git branch:"master", url:"https://github.com/AnamikaSaluja/anamika_assignment"
				//checkout scm
            }
        }
        
        stage('Build'){
            steps{
                echo "build"
                bat "mvn clean install"
            }
        }
        
        stage('sonar analysis'){
            steps{
                echo "sonar"
                withSonarQubeEnv("local sonar") 
				{
					bat "mvn org.sonarsource.scanner.maven:sonar-maven-plugin:3.7.0.1746:sonar"
				}
            }
        }
		
		stage ('Upload to Artifactory')
		{
			steps
			{
				rtMavenDeployer (
                    id: 'deployer',
                    serverId: 'anamika_assignment@artifactory',
                    releaseRepo: 'test-pipeline',
                    snapshotRepo: 'test-pipeline'
                )
                rtMavenRun (
                    pom: 'pom.xml',
                    goals: 'clean install',
                    deployerId: 'deployer',
                )
                rtPublishBuildInfo (
                    serverId: 'anamika_assignment@artifactory',
                )
			}
		}
	    
	    stage('Build image')
		{
			steps
			{
				bat 'docker build -t anamika:3 .'
			}
		}
	    
	     stage('Deployment')
		{
			steps
			{
				bat 'docker run -d --name anamikaAssignmentContainer -p 9004:8080 anamika:3'
			}
		}
        
    }
}
