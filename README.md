**🏗️ Architecture Overview**

Static Website: Hosted in an Azure Blob Storage container configured for static site hosting.

Content Delivery: Served via Azure CDN for fast, global delivery.

Infrastructure as Code: Entire Azure infrastructure is provisioned and managed via Terraform.

Visitor Tracking: Azure Function App is deployed to count site visits.

Function queries Log Analytics data to track visitors.

Custom Domain: Website is mapped to a custom domain managed through GoDaddy.

**🛠️ Tech Stack**

Azure Storage (Static Website Hosting)

Azure CDN (Performance and Caching)

Azure Functions (Serverless visitor tracking API)

Azure Monitor (Log Analytics Workspace)

Terraform (Infrastructure as Code)

GoDaddy (Domain Name Management)

               
**How Visitor Tracking Works**

When someone visits the website, a JavaScript fetch request is made to the Azure Function API.
The Azure Function queries Log Analytics to count total CDN requests.
The visitor count is dynamically displayed on the resume site.

**🌐 Live Site**

Website URL: manuravikumar-cloudengineer.com

Visitor API URL: https://resume-visitor-api.azurewebsites.net/api/visitors

**📖 Notes**
Blob Storage must have public access enabled for static website files.

CDN is configured to pull content from the Azure Storage static site endpoint.

Log Analytics must have AzureCdnAccessLog category enabled.

Azure Function uses DefaultAzureCredential for authentication.

## Contributing

Contributions are welcome! Please follow these steps:
1. Fork the repository.
2. Create a new branch:
    ```bash
    git checkout -b feature-name
    ```
3. Commit your changes:
    ```bash
    git commit -m "Add feature-name"
    ```
4. Push to your branch:
    ```bash
    git push origin feature-name
    ```
5. Open a pull request.

## License
This project is licensed under the [MIT License](LICENSE).

📬 Contact
If you like this project or have any feedback, feel free to connect with me on LinkedIn. www.linkedin.com/in/manu-ravikumar
