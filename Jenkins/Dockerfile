FROM jenkins/jenkins:lts
USER root
RUN apt-get update && apt-get install -y docker.io awscli
USER jenkins

#RUN THE DOCKER:
#docker run -d -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home --name jenkins jenkins/jenkins:lts
