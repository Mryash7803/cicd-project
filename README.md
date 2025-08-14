Automated CI/CD Pipeline for a Dockerized Application on AWS
This project demonstrates a complete, automated CI/CD (Continuous Integration/Continuous Deployment) pipeline built on AWS. The pipeline automatically builds a Docker image for a simple web application, pushes it to a private container registry, and deploys it to a serverless container environment using Amazon ECS.

The primary goal is to create a "hands-off" deployment process where any code change pushed to the GitHub repository is automatically deployed to production.

Live Application
Link to Your Live Application

(Replace the placeholder with the Public IP of your running ECS Task)

Architecture and Workflow
The pipeline is orchestrated by AWS CodePipeline and follows these steps:

Source Stage: CodePipeline is connected to a GitHub repository. It automatically detects any git push to the main branch.

Build Stage:

The source code is sent to AWS CodeBuild.

CodeBuild uses the instructions in the buildspec.yml file to run a series of commands.

It builds a Docker image based on the application's Dockerfile.

The newly built Docker image is tagged and pushed to Amazon ECR (Elastic Container Registry).

A final imagedefinitions.json file is created as a build artifact to pass the image name to the next stage.

Deploy Stage:

CodePipeline takes the imagedefinitions.json artifact from the build stage.

It triggers an Amazon ECS (Elastic Container Service) deployment action.

ECS pulls the new Docker image from ECR and deploys it as a task running on a serverless Fargate cluster, automatically replacing the old version with zero downtime.

Key Features
Fully Automated: Code pushes to GitHub automatically trigger a new deployment.

Containerized: The application is packaged in Docker, ensuring consistency across environments.

Serverless Compute: AWS Fargate runs the container without requiring any server management.

Infrastructure as Code (IaC) Concepts: The Dockerfile and buildspec.yml files define the application environment and build process in code.

Technologies Used
Source Control
GitHub: For source code management.

AWS DevOps & Compute
AWS CodePipeline: The main orchestrator for the CI/CD workflow.

AWS CodeBuild: For building the Docker image.

Amazon ECR (Elastic Container Registry): For storing the container images.

Amazon ECS (Elastic Container Service) with AWS Fargate: For running the containerized application.

AWS IAM: For managing the permissions and service roles required for the pipeline to operate.

Application
Docker: For containerizing the web application.

NGINX: As the lightweight web server inside the container.

HTML/CSS: For the simple front-end application.
