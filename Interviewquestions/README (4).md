## Trading App Run Book ##

# Purpose of this document

This document aims to provide a comprehensive runbook for the "Trading App", containing all the necessary information to build, deploy and use the application

# Context 

The Trading Application works mainly as an trading platform, displaying it's private orderbook.\
We have access to web screens allowing us to perform order (sell,buy) on various assets. \
The Trading Application is using FIX protocol standard to manage orders, automatically filling trades when a buyer and seller are found for a given order.

# Application Simplified Architecture

The Trading application consist of 3 main components

![schema](resources/simplified_arch.jpg)


# Important links

app demo : https://orderbook.computerlab.online \
api demo : https://orderbook-api.computerlab.online/docs \
Sourcecode : https://github.com/theacademy/pss-orderbook-deploy/ \
Infrastructure : https://github.com/theacademy/sre-course-teams \
AWS ECR List : http://ecrlist-ps.computerlab.online/index.php \
Jenkins : https://jenkins.computerlab.online/ \
Kubernetes : https://k8sdashboard.computerlab.online/ \
Kubernetes login: https://k8slogin.computerlab.online/ \
Grafana : https://grafana.computerlab.online/ 


# Application Detailed Architecture



# ERD

In the schema below you will find the Entity Relationship Diagram of the application's database

![ERD](resources/data_model.jpg)

# Front End 

The front end of our application consist of 5 screens:\

Home : Landing page when reaching our app\
Login : Login page, where we can create our application account aswell\
Quotes : Screen displaying the available products and allowing user to buy and sell\
Portfolio : Display user current orders \
Orderbook : Display the current buy and sell orders\
Manage Accounts : Display the current users, their role and membership startdate. Requires admin role to be visible.\

Only the first two screens listed are available until you are logged in.\
With the admin privilege, the user can see an additional screen "Manage Accounts"

## Quotes : New Orders

Once logged in, user are able to use the Quotes screen to find a specific product, and create a new buy or sell order.

![demo_quotes](resources/demo_quotes_screen.gif)

## Portfolio

In this screen we will find all our orders with their status and a Holdings section, showing the netted number of shares filled

![demo_portfolio](resources/demo_portfolio_screen.gif)

## Orderbook

In this screen we be able to display the orderbook, containing all the orders, and filter by symbols or status.

![demo_Orderbook](resources/demo_orderbook_screen.gif)

# Deployment : Jenkins

In order to build our application, we are using Jenkins pipeline.\
The pipeline consist of 3 steps to build our 3 components.\
Each image will be built using kaniko, a specific agent in Jenkins allowing us to build with Docker.\


The full pipeline code

```
pipeline {
  agent none
  stages {
    
    stage('Build Trading Front End') {
       agent {
          node {
            label 'kaniko'
          }
        }
      steps {
        container(name: 'kaniko') {
          sh '''echo \'{ "credsStore": "ecr-login" }\' > /kaniko/.docker/config.json
/kaniko/executor -f `pwd`/Dockerfiles/Dockerfile_nginx -c `pwd` --insecure --skip-tls-verify --cache=false --destination=${ECR_REPO}:${JOB_NAME}fe-dev-${BUILD_NUMBER}'''
        }
      }
    }
    
    
    stage('Build and Publish DB') {
      agent {
        node {
          label 'kaniko'
        }
      }
      steps {
        container(name: 'kaniko') {
          sh '''echo \'{ "credsStore": "ecr-login" }\' > /kaniko/.docker/config.json
/kaniko/executor -f `pwd`/Dockerfiles/Dockerfile_mysql -c `pwd` --insecure --skip-tls-verify --cache=false --destination=${ECR_REPO}:${JOB_NAME}db-dev-${BUILD_NUMBER}'''
        }
      }
    }

    
    stage('Build and Publish API') {
      agent {
        node {
          label 'kaniko'
        }
      }
      steps {
        container(name: 'kaniko') {
          sh '''echo \'{ "credsStore": "ecr-login" }\' > /kaniko/.docker/config.json
/kaniko/executor -f `pwd`/Dockerfiles/Dockerfile_fastapi -c `pwd` --insecure --skip-tls-verify --cache=false --destination=${ECR_REPO}:${JOB_NAME}api-dev-${BUILD_NUMBER}'''
        }
      }
    }
  }

  environment {
    ECR_REPO = '108174090253.dkr.ecr.us-east-1.amazonaws.com/production-support-course'
  }
 
}
```

# Deployment Infrastructure : Our EKS Cluster

EKS or Amazon Elastic Kubernetes Service is a service provided by AWS to run our Kubernetes cluster in AWS cloud.

The configuration for our application can be found under the folder https://github.com/theacademy/sre-course-teams/tree/main/apps/eks-sre-course \

![manifest](resources/kube_manifest.jpg)


# Monitoring Tools

Several components are used to enable logging, metric computation and visualization.

## Loki - Log Scrapping

Loki is a horizontally scalable, highly available, multi-tenant log aggregation system inspired by Prometheus. It is designed to be very cost effective and easy to operate.\
It does not index the contents of the logs, but rather a set of labels for each log stream.

If you look for further information on loki, https://grafana.com/oss/loki/

### Investigation logs with Loki

We are visualizing Loki output through grafana https://grafana.computerlab.online/\
We are able to access logs from many components, using labels to filter on a specific one.

![loki](resources/demo_loki.gif)

In this example below, we are checking the fluxCD logs. This is where we could find errors regarding our Kubernetes manifests (typo, incorrect yaml structure ect ), potentially preventing a deployments to be done.

![loki_flux](resources/demo_loki_flux_investigation.gif)


## Prometheus - Metric Building

Prometheus is our metric database.
Prometheus collects and stores its metrics as time series data, i.e. metrics information is stored with the timestamp at which it was recorded, alongside optional key-value pairs called labels.\

We are visualizing Prometheus metrics through grafana https://grafana.computerlab.online/, and Grafana itself is able to use prometheus metrics to build visualization, making the combination of both tool powerful.

