# Project-Factory

This project factory builds multiple google projects under a google folder.

# Requirements

The project factory requires terraform command line and a workspace to execute. This can be a CI tool like Jenkins which has credentials for the organization.

Define the following Environment Variables

TF_VARS_admin_email

TF_VARS_organization_id

TF_VARS_billing_account

TF_VARS_credentials_path


This terraform is intended to run on a platform which has credentials for the organization.
