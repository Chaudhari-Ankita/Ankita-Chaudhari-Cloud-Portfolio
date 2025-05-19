# GCP Terraform Portfolio Deployment

# Ankita-Chaudhari-Cloud-Portfolio

This project showcases my personal website deployed to Google Cloud Platform using Terraform.

## ✅ Technologies Used

- HTML, CSS, JavaScript
- Google Cloud Storage (GCS)
- Terraform
- GCP CLI & gcloud SDK

## 🚀 Live Site

[Visit My Website](https://storage.googleapis.com/ankita-portfolio-bucket/index.html)

## 📸 Screenshots

![Terraform Apply](screenshots/terraform-apply.png)
![GCP Bucket](screenshots/gcp-bucket.png)
![Live Website](screenshots/live-site.png)

## Steps 

### 1. 🛠️ Create Portfolio Website (HTML, CSS, JS)

 satic website includes:
- `index.html`: Main structure
- `style.css`: Styling (In this project I have used internal css)
- `script.js`: Basic interactivity

---

### 2. ☁️ Set Up Google Cloud Project

1. Created a GCP project Named "Portfolio-Deployment"
2. Enable:
   - Cloud Storage API
   - IAM & Admin API
   - Resource Manager API
   - Cloud Build API
3. Created a service account-> gave permissions for
   - Roles: `Storage Admin`, `Viewer`, `Editor`, `Owner`
4. Generate JSON key → Save as `terraformKey.json`
   - **⚠️ Do NOT upload this file to GitHub**
5. Put the key file in Terraform_GCP_Deploy
6. Add the key file in .gitignore 
7. Set auth environment variable:
    Run the below commmand in git bash

```bash
    - export GOOGLE_APPLICATION_CREDENTIALS="terraform-key.json"

### 3. Verify access with gcloud CLI

1. Run the Command in git bash 

    - gcloud auth activate-service-account --key-file=terraformKey.json
    - gcloud config set project <ProjectID>
    - gcloud storage buckets list

---

### 4. Terraform Code 

1. Created and write the code for main.tf and variables.tf 
2. Run the following terraform commands on git bash to deploy it on GCP

```bash
    - terraform init
    - terraform plan
    - terraform apply

### 5. Get the URL

1. Go to Cloud Storage-> Buckets
2. Select the bucket created for the portfolio
3. Copy Public URL
4. Hit the URL On browser, and your live portfolio is accessible to the internet.

