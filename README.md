# Terraform Aws Static Website
This project is designed to manage the infrastructure for a static website hosted on AWS using Terraform. 
It consists of three buckets: 
one for the main domain, which includes the HTML, CSS files and the rest of the site content
one for routing the subdomain to the main domain 
and one for storing log files.

To ensure data security and follow Terraform best practices, this project uses remote state and locking state. 
Additionally, the infrastructure is built using Terraform modules for efficiency and easy reuse of the environment.

## Technologies used
- Terraform
- AWS
- HTML
- CSS

## Project Structure
~~~
├── Dev
│   ├── css
│   │    └──  style.css
│   ├── html 
│   │    ├── index.html
│   │    └──  404.html
│   ├── web_image 
│   │    └──  back_ground.jpg
│   ├── .gitignore
│   ├── beckend.tf
│   ├── main.tf
│   └── variable.tf
│   
└── Modules
    ├── Remote-State-Locking-State
    │   ├── main.tf
    │   └── variable.tf
    ├── Route53
    │   ├── data_source.tf
    │   ├── main.tf
    │   └── variable.tf
    ├── S3_logs_bucket
    │   ├── data_source.tf
    │   ├── main.tf
    │   └── variable.tf
    └──S3_Domain_Sub_Dumain_bucket
        ├── data_source.tf
        ├── main.tf
        ├── output.tf
        ├── upload_index.tf
        └── variable.tf
~~~
...
## Features

## Installation and Usage
To use the project, follow these steps:

1. Clone the repository to your local machine.
2. Set up the variables.
    - Adjust the terraform.tfvars in Dev folder.
    - (domain_name, region, access_key, secret_key)
3. Run terraform init to initializing the project.
4. Run terraform apply to deploy the infrastructure.
   - This apply will create 14 Resources.
   - Verify the deployed infrastructure in AWS console.
   - This diployd should create: 3 S3 bucket, 1 DynamoDB table.
5.  Get the url of the image from the main bucket.
    - Insert the address to the css file in line 9.
    - On the next apply command the file will be updated in the s3 bucket.
6. Uncomment the terraform {backend} block in the beckend.tf file.
    - Insert the desired variables manually.
    - **DO NOT import variable - it will not work!.**
    - (bucket, region, dynamodb_table)
7. Run terraform init to initializing the backend.
    - Enter "yes"
8. Uncomment the "website_1_logs_bucket" module in the main.tf file.
    - Run terraform init to initializing new provider plugins.
    - Run terraform plan and then Run terraform apply to deploy the infrastructure.
    - This diployd should create: 1 S3 bucket
9. Uncomment the "website_1_route53" module in the main.tf file.
    -Run terraform init to Initializing provider plugins.
    - Run terraform plan and then Run terraform apply to deploy the infrastructure.
    - This diployd should create 2 route53_record for the domain_bucket and subdomain_bucket.
    - Verify the deployed infrastructure in AWS console.
11. The site is ready and live
    - Use the domain_name or subdomain_name to reach him.
    - If you don't see the background image, try using another browser.
 

