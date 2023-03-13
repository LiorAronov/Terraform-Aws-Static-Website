# Terraform Aws Static Website
This project is designed to manage the infrastructure for a static website hosted on AWS using Terraform. Once we are finished, we will have the following resources:

- An S3 bucket that hosts our main domain with the website files.
- An S3 bucket that serves as a redirect from www.domain-name to our main domain.
- An S3 bucket that contains the logging web traffic.
- An S3 bucket that serves as remote state.
- A DynamoDB table that serves as state locking.
- Route 53 records pointed at our S3 buckets.

To ensure data security and follow Terraform best practices, this project uses remote state and locking state. Additionally, the infrastructure is built using Terraform modules for efficiency and easy reuse of the environment.
## Technologies used
- Terraform
- AWS
- HTML
- CSS

## Requirements
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
## Costs
Using this project may result in charges from AWS. The exact cost will depend on your usage of AWS resources, such as S3 buckets and DynamoDB tables. Please review the pricing information for each service before using this project. You can find more information on AWS pricing at the [AWS Pricing page.](https://aws.amazon.com/pricing/?aws-products-pricing.sort-by=item.additionalFields.productNameLowercase&aws-products-pricing.sort-order=asc&awsf.Free%20Tier%20Type=*all&awsf.tech-category=*all)

![cost_chart](https://user-images.githubusercontent.com/111339448/224671612-97d1afca-e50f-4dc3-a548-51d5dc3c6377.png)

However, it is worth noting that the entire project is designed to operate within the free tier of AWS, which provides a certain level of usage for many AWS services at no charge. This means that for many users, the cost of using this project may be minimal or nonexistent.

## Installation and Usage
To use the project, follow these steps:

1. Clone the repository to your local machine.
2. Set up a connection with AWS through the CLI.
    - Use "aws configure" command.

![aws_configure](https://user-images.githubusercontent.com/111339448/224536024-c1b4a3f8-7498-4144-a5f4-e0c5560fc40d.png)

3. Set up the necessary variables (domain_name, region).
    - Adjust the "terraform.tfvars" in the "Dev" folder.
    - "domain_name" must be the same as your registered domain name (example.com).

![variables](https://user-images.githubusercontent.com/111339448/224536160-f10ef14f-e5a9-4f64-a258-18125231e528.png)

4. Navigate to the "Dev" folder from the CLI.

![Navigate_to_Dev](https://user-images.githubusercontent.com/111339448/224536222-ffa2798a-5550-4759-a225-36dafbd71f10.png)

5. Run "terraform init" to initialize the project.

![terraform_init](https://user-images.githubusercontent.com/111339448/224535918-a02707dd-8938-48f4-84e3-7b1ed760fc68.png)

6. Run "terraform apply" to deploy the infrastructure.
   - This apply will create 14 resources.
   - Verify the deployed infrastructure in the AWS console.
   - This deployment should create: 3 S3 buckets and 1 DynamoDB table.

![terraform_apply](https://user-images.githubusercontent.com/111339448/224536471-7e3b9a34-7762-45a9-bb22-4a19aa831b49.png)

7. Get the URL of the "back_ground.jpg" image from the AWS console.
    - Located at "../images/back_ground.jpg" inside the domain bucket.
    - Insert the URL address into the CSS file on line 9.
    - On the next apply command, the file will be updated in the S3 bucket.

![Get_the_url_of_the image](https://user-images.githubusercontent.com/111339448/224537669-4334bb5a-c9df-42d0-a7d1-2c90df8f69e0.png)

![css file_line 9](https://user-images.githubusercontent.com/111339448/224538064-e02ca03b-6051-4070-b47c-2c7ba474475f.png)

8. Uncomment the terraform-backend block in the "beckend.tf" file.
    - Set up the necessary variables **manually** (bucket-name, region, dynamodb_table-name).
    - **DO NOT import variables - it will not work!.**

![Uncomment_backend](https://user-images.githubusercontent.com/111339448/224539380-513d3ced-efeb-4240-b8b6-7873e4259bad.gif)

9. Run "terraform init" to initialize the backend.
    - Enter "yes."
    - You can now delete "terraform.tfstate" file from your local environment.
    
![initializing_the_backend](https://user-images.githubusercontent.com/111339448/224539677-0cff9211-9bb6-4683-a21d-b59592fbf8df.png)
   
10. Uncomment the "website_1_logs_bucket" module in the "main.tf" file inside the "Dev" folder.
    - Run "terraform init" to initialize new provider plugins.
    - Run "terraform plan" and then run "terraform apply" to deploy the infrastructure.
    - This deployment should create 1 S3 bucket and update the CSS file.

![Uncomment_website_1_logs_bucket](https://user-images.githubusercontent.com/111339448/224539913-12fb20a3-2e6f-41db-9dae-17fa70223594.gif)

![init logs moudle](https://user-images.githubusercontent.com/111339448/224625130-e31ae528-8763-458b-ab9c-ed69211a6c04.png)

11. Uncomment the "website_1_route53" module in the "main.tf" file inside the "Dev" folder.
    - Run "terraform init" to initialize provider plugins.
    - Run "terraform plan" and then run "terraform apply" to deploy the infrastructure.
    - This deployment should create 2 Route53 records for the "domain_bucket" and "subdomain_bucket".
    - Verify the deployed infrastructure in the AWS console.

![Uncomment_website_1_route53](https://user-images.githubusercontent.com/111339448/224540383-cf158668-bd22-4b9f-bdb6-4d6c09d9cc8c.gif)

![init route53 moudle ](https://user-images.githubusercontent.com/111339448/224540711-491a0317-1522-402b-b984-c9a26616629b.png)

12. The site is ready and live.
    - Use the domain_name (example.com) or subdomain_name (www.example.com) to reach it.

![The site](https://user-images.githubusercontent.com/111339448/224541029-b9bd640d-43cc-4d55-8d0d-1b9cf17c86e2.png)

## troubleshooting tips

    - If the website does not load, try again after a few minutes or try from an incognito window.
    - If you don't see the background image, try using another browser.





Deploying infrastructure on AWS incurs costs for the resources used. The following is an estimate of the costs associated with the deployment described in this document.

Route53: This service is used for domain registration and DNS management. The cost for registering a domain varies, but typically ranges from $10 to $15 per year. Additionally, there is a charge for the number of DNS queries performed, which is $0.40 per million queries.

S3 Bucket: The cost for storing data in an S3 bucket depends on the amount of data stored and the number of requests made. Storage costs range from $0.023 per GB per month to $0.12 per GB per month, depending on the storage class used. Requests are charged at $0.005 per 1,000 PUT, COPY, POST, or LIST requests, and $0.0004 per 1,000 GET and all other requests.

CloudFront: This service is used for content delivery and caching. The cost for using CloudFront depends on the amount of data transferred and the number of requests made. Data transfer costs range from $0.085 per GB to $0.14 per GB, depending on the location of the edge server. Request costs are charged at $0.0075 per 10,000 requests.

ACM: This service is used for SSL/TLS certificate management. The cost for using ACM is free.

IAM: This service is used for access management. The cost for using IAM is free.

EC2: This service is used for hosting the application. The cost for using EC2 depends on the type of instance used and the amount of time it is running. On-demand pricing starts at $0.0052 per hour for the t2.nano instance type.

Please note that these costs are estimates and are subject to change. It is recommended to review the AWS pricing documentation for the latest pricing information.