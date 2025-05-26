# Multi-Environment VM Infrastructure

This Terraform configuration manages VM infrastructure across multiple environments (dev, staging, prod) in Google Cloud Platform. The project uses environment-specific variable files to deploy VMs with appropriate configurations for each environment.

## Project Structure

```
.
├── environments/           # Environment-specific variable files
│   ├── dev.tfvars          # Development environment variables
│   ├── staging.tfvars      # Staging environment variables
│   └── prod.tfvars         # Production environment variables
├── modules/                # Reusable Terraform modules
│   └── vm/                 # VM module with network and subnet resources
│       ├── main.tf         # VM module main configuration
│       ├── output.tf       # VM module outputs
│       └── variable.tf     # VM module variables
├── .gitignore              # Git ignore patterns for Terraform
├── .terraform.lock.hcl     # Terraform dependency lock file
├── main.tf                 # Main Terraform configuration
├── variable.tf             # Root-level variable definitions
└── README.md               # Project documentation
```

## Features

- Modular design with reusable VM configuration
- Environment-specific configurations (dev, staging, prod)
- Proper networking setup with VPC and subnet creation
- Remote state management using Google Cloud Storage
- Consistent naming conventions and tagging

## Prerequisites

- Terraform >= 1.0.0
- Google Cloud Platform account and project
- Configured Google Cloud Storage bucket for remote state
- Appropriate GCP permissions

## Usage

1. Clone the repository
2. Navigate to the project directory
3. Initialize Terraform:
   ```bash
   terraform init
   ```
4. Select environment using variable files:

   ```bash
   # For development environment
   terraform plan -var-file=environments/dev.tfvars

   # For staging environment
   terraform plan -var-file=environments/staging.tfvars

   # For production environment
   terraform plan -var-file=environments/prod.tfvars
   ```

5. Apply the configuration:
   ```bash
   # For development environment
   terraform apply -var-file=environments/dev.tfvars
   ```

## Environment Configurations

- **Development**: Uses e2-small machine type with minimal resources
- **Staging**: Uses e2-medium machine type for testing with moderate resources
- **Production**: Uses e2-medium machine types for production workloads

## Remote State

This project uses Google Cloud Storage for remote state management. The state file is stored in the "gp-tf-state" bucket with the prefix "terraform/bookly".

## Security Notes

- Variable files (.tfvars) containing potential sensitive data are excluded from version control
- Always review plans before applying changes to production environments
