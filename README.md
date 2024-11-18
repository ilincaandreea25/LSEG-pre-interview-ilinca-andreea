

# Budgeting Application - LSEG Pre-Interview Challenge

This repository contains the implementation of a full-stack budgeting application, with infrastructure automation and deployment configurations. The application provides backend APIs, a user-facing frontend, and deployment configurations using Kubernetes and Terraform.

---

## Table of Contents

- [Project Overview](#project-overview)
- [Features](#features)
- [Technologies Used](#technologies-used)
- [Repository Structure](#repository-structure)
- [Detailed Components](#detailed-components)
  - [Backend](#backend)
  - [Frontend](#frontend)
  - [Infrastructure (Terraform)](#infrastructure-terraform)
  - [Container Orchestration (Kubernetes)](#container-orchestration-kubernetes)
- [Setup and Installation](#setup-and-installation)
- [Usage](#usage)
- [License](#license)
- [Contact](#contact)

---

## Project Overview

The **Budgeting Application** is designed to help users track and manage their financial activities, including income and expenses. The application demonstrates strong modularity with separate backend and frontend components, each capable of independent development and deployment. The project also includes cloud infrastructure automation with **Terraform** and container orchestration using **Kubernetes**.

---

## Features

1. **Full-Stack Solution**:
   - Backend provides RESTful APIs for data management.
   - Frontend is a user-friendly web interface.

2. **Transaction Management**:
   - Add, view, and delete transactions.
   - Categorize income and expenses for better insights.

3. **Scalable Infrastructure**:
   - Cloud provisioning using Terraform.
   - Kubernetes for containerized deployments.

4. **Security and Extensibility**:
   - Secrets managed via Terraform.
   - Modular design for both application and infrastructure.

---

## Technologies Used

- **Backend**: Python (Flask), Docker
- **Frontend**: Python (Flask), HTML, CSS
- **Infrastructure**: Terraform (Infrastructure as Code)
- **Container Orchestration**: Kubernetes
- **Cloud Provider**: Configured for AWS (EKS, RDS, VPC)

---

## Repository Structure

```
folder2/
├── README.md                   # Project documentation
├── budgeting-app/
│   ├── backend/                # Backend service
│   │   ├── .env                # Environment variables for backend
│   │   ├── Dockerfile          # Docker configuration for backend
│   │   ├── requirements.txt    # Python dependencies for backend
│   │   ├── run.py              # Entry point for backend
│   │   └── app/
│   │       ├── __init__.py     # Flask app initialization
│   │       ├── config.py       # App configuration
│   │       ├── models.py       # Database models
│   │       └── routes.py       # API routes
│   ├── frontend/               # Frontend service
│   │   ├── .env                # Environment variables for frontend
│   │   ├── requirements.txt    # Python dependencies for frontend
│   │   ├── run.py              # Entry point for frontend
│   │   └── app/
│   │       ├── __init__.py     # Flask app initialization
│   │       ├── api.py          # API interaction
│   │       ├── views.py        # View logic
│   │       ├── static/         # Static assets (CSS, JS)
│   │       │   └── style.css
│   │       └── templates/      # HTML templates
│   │           ├── index.html
│   │           ├── budget_overview.html
│   │           └── transactions.html
│   ├── kubernetes/             # Kubernetes configurations
│   │   ├── configmap.yaml      # Configuration map
│   │   ├── deployment.yaml     # Deployment definitions
│   │   └── service.yaml        # Service definitions
│   └── terraform/              # Terraform infrastructure
│       ├── main.tf             # Main Terraform configuration
│       ├── variables.tf        # Variable definitions
│       ├── outputs.tf          # Outputs for Terraform
│       ├── modules/            # Modular Terraform configurations
│       │   ├── eks/            # EKS module
│       │   ├── rds/            # RDS module
│       │   ├── secrets/        # Secrets management
│       │   └── vpc/            # VPC module
│       ├── terraform.tfstate   # Current Terraform state
│       └── terraform.tfstate.backup  # Backup of Terraform state
└── .git/                       # Git metadata

```

---

## Detailed Components

### 1. Backend

#### Overview:
The backend is a Python-based Flask application providing a RESTful API for managing transactions.

#### Features:
- Handles CRUD operations for income and expenses.
- Provides endpoints for:
  - Adding a transaction.
  - Retrieving all transactions.
  - Filtering transactions by categories.
  - Deleting a transaction.

#### Key Files:
- **`app/__init__.py`**: Initializes the Flask app and loads configurations.
- **`app/models.py`**: Defines the data models (e.g., `Transaction`) and handles database interactions.
- **`app/routes.py`**: Contains API endpoints for user actions.

#### Configuration:
- Environment variables are managed via the `.env` file.
- The `config.py` file centralizes app configuration, such as database URI and environment settings.

---

### 2. Frontend

#### Overview:
The frontend is also a Flask application that renders the user interface and interacts with the backend API to fetch and display data.

#### Features:
- User-friendly web interface with pages for:
  - Viewing an overview of the budget.
  - Adding new transactions.
  - Viewing categorized transaction lists.
- Integrates static assets (CSS, JavaScript) for interactivity.

#### Key Files:
- **`app/views.py`**: Handles rendering of HTML templates and integrates backend API responses.
- **`templates/`**:
  - **`index.html`**: The homepage showing a summary of financial activities.
  - **`budget_overview.html`**: Displays categorized income and expense charts.
  - **`transactions.html`**: Shows a detailed list of transactions.
- **`static/style.css`**: Defines the styling for the application.

---

### 3. Infrastructure (Terraform)

#### Overview:
The project uses **Terraform** to automate the provisioning of cloud infrastructure, focusing on AWS. The infrastructure is modular and reusable.

#### Features:
- **VPC Module**: Sets up a secure Virtual Private Cloud (VPC) with subnets and security groups.
- **EKS Module**: Provisions an Elastic Kubernetes Service (EKS) cluster for containerized deployments.
- **RDS Module**: Creates a managed relational database for storing financial data.

#### Key Files:
- **`main.tf`**: Defines high-level resources and calls individual modules.
- **`variables.tf`**: Declares variables for customizable configurations (e.g., region, instance type).
- **`outputs.tf`**: Defines the outputs such as the EKS cluster endpoint or RDS connection string.
- **`modules/`**:
  - **`eks/`**: Contains Terraform scripts to provision the EKS cluster.
  - **`rds/`**: Manages the Relational Database Service.
  - **`vpc/`**: Configures the VPC with subnets and routing tables.

---

### 4. Container Orchestration (Kubernetes)

#### Overview:
Kubernetes configurations handle the deployment, scaling, and management of containerized applications.

#### Features:
- **Deployment**:
  - Deploys the backend and frontend as separate services.
  - Manages replicas for high availability.
- **Service**:
  - Exposes the backend and frontend for internal communication and external access.
- **ConfigMap**:
  - Stores environment-specific configurations for the backend and frontend.

#### Key Files:
- **`deployment.yaml`**:
  - Defines the deployment configurations, including the number of replicas and container images.
- **`service.yaml`**:
  - Creates Kubernetes services to expose the backend and frontend.
- **`configmap.yaml`**:
  - Stores and injects configuration settings as environment variables.

---

## Setup and Installation

### Prerequisites
- Install [Docker](https://www.docker.com/).
- Install [Terraform](https://www.terraform.io/).
- Install [kubectl](https://kubernetes.io/docs/tasks/tools/).

### Steps

#### Backend:
1. Navigate to the `backend` directory:
   ```bash
   cd budgeting-app/backend
   ```
2. Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```
3. Run the application:
   ```bash
   python run.py
   ```

#### Frontend:
1. Navigate to the `frontend` directory:
   ```bash
   cd budgeting-app/frontend
   ```
2. Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```
3. Run the application:
   ```bash
   python run.py
   ```

#### Infrastructure:
1. Navigate to the `terraform` directory:
   ```bash
   cd budgeting-app/terraform
   ```
2. Initialize Terraform:
   ```bash
   terraform init
   ```
3. Apply the infrastructure:
   ```bash
   terraform apply
   ```
4. Deploy to Kubernetes:
   ```bash
   kubectl apply -f kubernetes/
   ```

---

## Usage

1. Access the **Frontend** at `http://localhost:5000`.
2. Use the following features:
   - Add and view transactions.
   - Visualize categorized financial data.
3. Backend API can be accessed for direct interaction.

---

## License

This project is proprty to the repository owner only.

---

## Contact

For any questions or suggestions, please contact the repository owner.
