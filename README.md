# HabotConnect DevOps Engineering Blueprint

## Candidate

**Name:** Asmit Singh

**Role:** Junior Cloud & DevOps Engineer Assessment

---

# Project Overview

This project implements a secure, automated, and production-ready cloud deployment pipeline for HabotConnect.

The solution addresses the following engineering challenges:

- Infrastructure provisioning using Terraform
- Automated DevSecOps pipeline using GitHub Actions
- Secure schema validation using Django REST Framework
- Least-Privilege IAM implementation
- Fail-Closed deployment strategy

---

# Architecture

The architecture consists of:

Developer

↓

GitHub Repository

↓

GitHub Actions

↓

Terraform

↓

Google Cloud Platform

↓

Cloud Storage (D0 Raw Landing)

↓

BigQuery (D1 Staging)

↓

Django REST API

↓

React Frontend

↓

Parent / Guardian

---

# Task 1

Infrastructure as Code

Implemented using Terraform.

Resources Created

- Cloud Storage Bucket
- BigQuery Dataset
- IAM Roles
- Bucket Versioning
- Lifecycle Management
- Labels

---

# Task 2

CI/CD Pipeline

GitHub Actions pipeline executes

- Checkout
- Black Formatter
- Flake8
- Bandit
- Gitleaks
- Terraform Format
- Terraform Validate

Pipeline follows Fail-Closed deployment.

Any failure immediately blocks deployment.

---

# Task 3

Django REST Validation

Serializer validates

- Email
- Phone Number
- Student Age
- Weekly Hours
- Guardian Consent
- Business Rules (DCYN)

---

# Security Features

- Least Privilege IAM
- Secret Detection
- Static Code Analysis
- Infrastructure Validation
- Serializer Validation
- Encryption at Rest
- Versioning Enabled

---

# Repository Structure

```text
.github/

django/

docs/

presentation/

terraform/

README.md
```

---

# Future Improvements

- Kubernetes Deployment
- Docker Compose
- Cloud Monitoring
- Cloud Logging
- Automated Unit Tests
- Infrastructure Drift Detection

---

# Conclusion

This project demonstrates Infrastructure as Code, DevSecOps automation, schema validation, and cloud security best practices while implementing a production-style Google Cloud deployment.
