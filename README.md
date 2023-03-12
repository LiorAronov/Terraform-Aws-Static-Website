# Terraform Aws Static Website
This project is designed to manage the infrastructure for a static website hosted on AWS using Terraform. 
Once we are finished we are going to have the following components:

- S3 bucket that hosts our website files 
- S3 bucket that serves as the redirect to our www subdomain
- S3 bucket that serves as Logging web traffic.
- S3 bucket that serves as Remote State.
- Dynamodb table  that serves as State locking.
- Route 53 records pointed at to our Cloudfront distributions.



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

## requirements
- Active AWS account.
- Registered domains.

## Project Structure
~~~
├── Dev
│   ├── css
│   │    └── style.css
│   ├── html 
│   │    ├── index.html
│   │    └── 404.html
│   ├── web_image 
│   │    └── back_ground.jpg
│   ├── .gitignore
│   ├── beckend.tf
│   ├── main.tf
│   ├── provider.tf
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
    ├── S3_Domain_Sub_Dumain_bucket
    │   ├── data_source.tf
    │   ├── main.tf
    │   ├── output.tf
    │   ├── upload_index.tf
    │   └── variable.tf
    └── S3_logs_bucket
        ├── data_source.tf
        ├── main.tf
        └── variable.tf
~~~
<!-- ## Features -->

## Installation and Usage
To use the project, follow these steps:

1. Clone the repository to your local machine.
2. Set up connection with AWS through the CLI.
    - use aws configure command.

![aws_configure](https://user-images.githubusercontent.com/111339448/224536024-c1b4a3f8-7498-4144-a5f4-e0c5560fc40d.png)

3. Set up the variables.
    - Adjust the terraform.tfvars in Dev folder.
    - domain_name must be the same as your registered domain name (example.com)
    - (domain_name, region)

![variables](https://user-images.githubusercontent.com/111339448/224536160-f10ef14f-e5a9-4f64-a258-18125231e528.png)

4. Navigate to Dev folder from the CLI.

![Navigate_to_Dev](https://user-images.githubusercontent.com/111339448/224536222-ffa2798a-5550-4759-a225-36dafbd71f10.png)

5. Run terraform init to initializing the project.

![terraform_init](https://user-images.githubusercontent.com/111339448/224535918-a02707dd-8938-48f4-84e3-7b1ed760fc68.png)

6. Run terraform apply to deploy the infrastructure.
   - This apply will create 14 Resources.
   - Verify the deployed infrastructure in AWS console.
   - This diployd should create: 3 S3 bucket, 1 DynamoDB table.

![terraform_apply](https://user-images.githubusercontent.com/111339448/224536471-7e3b9a34-7762-45a9-bb22-4a19aa831b49.png)

7.  Get the url of the image from the main bucket.
    - Insert the address to the css file in line 9.
    - On the next apply command the file will be updated in the s3 bucket.

![Get_the_url_of_the image](https://user-images.githubusercontent.com/111339448/224537669-4334bb5a-c9df-42d0-a7d1-2c90df8f69e0.png)

![css file_line 9](https://user-images.githubusercontent.com/111339448/224538064-e02ca03b-6051-4070-b47c-2c7ba474475f.png)

8. Uncomment the terraform {backend} block in the beckend.tf file.
    - Insert the desired variables **manually**.
    - **DO NOT import variable - it will not work!.**
    - (bucket, region, dynamodb_table)

![Uncomment_backend](https://user-images.githubusercontent.com/111339448/224539380-513d3ced-efeb-4240-b8b6-7873e4259bad.gif)

9. Run terraform init to initializing the backend.
    - Enter "yes".
    - Now u cant delate "terraform.tfstate" form your local environment.

![initializing_the_backend](https://user-images.githubusercontent.com/111339448/224539677-0cff9211-9bb6-4683-a21d-b59592fbf8df.png)
   
10. Uncomment the "website_1_logs_bucket" module in the main.tf file.
    - Run terraform init to initializing new provider plugins.
    - Run terraform plan and then Run terraform apply to deploy the infrastructure.
    - This diployd should create: 1 S3 bucket, update css file.

![Uncomment_website_1_logs_bucket](https://user-images.githubusercontent.com/111339448/224539913-12fb20a3-2e6f-41db-9dae-17fa70223594.gif)

![init logs moudle](https://user-images.githubusercontent.com/111339448/224540253-360a3928-069e-404f-9f21-cfd6dba6f6be.png)

10. Uncomment the "website_1_route53" module in the main.tf file.
    - Run terraform init to Initializing provider plugins.
    - Run terraform plan and then Run terraform apply to deploy the infrastructure.
    - This diployd should create 2 route53_record for the domain_bucket and subdomain_bucket.
    - Verify the deployed infrastructure in AWS console.

![Uncomment_website_1_route53](https://user-images.githubusercontent.com/111339448/224540383-cf158668-bd22-4b9f-bdb6-4d6c09d9cc8c.gif)

![init route53 moudle ](https://user-images.githubusercontent.com/111339448/224540711-491a0317-1522-402b-b984-c9a26616629b.png)

11. The site is ready and live.
    - Use the domain_name or subdomain_name to reach him.
    - If the website does not load - try again after a few minutes or/and try from Incognito window.
    - If you don't see the background image, try using another browser.
 
![The site](https://user-images.githubusercontent.com/111339448/224541029-b9bd640d-43cc-4d55-8d0d-1b9cf17c86e2.png)

