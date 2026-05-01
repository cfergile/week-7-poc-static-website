### Overview

In this Lab I crated a static hosted website in a bucket hosted on GCP via the Google Container Service "GCS". The infrastrucure was solely spun up using terraform as oopose to ClickOPS. The purpose of this project was to leverage the uses of terraform in creating a bucket and uploading objects to that bucket in order to crate the static website.

### Findings
By the end of my project I was able to come to several conclusions of the efficacy of terraform in the cases of creaating the necessary services and resources for my end goal. While I found terraform to be great at creating buckets, I did not however find it necessarily great at uploading objects. Each object had to be uploaded as an individual resource. This proved to be quite tedious especially in comparison to the ablity to upload several files at the click of a button when using ClickOps comparitively. Creating the bucket itself on the other hand I found to be quite advantageous especially in the consideration of hypothetically creating another bucket. In that case it would be far easier to create another bucket even if a few changes were necessary in configuration.

### Challenges
One of the challenges I encountered was the output block of my codebase. I found a difficult time finding any documentation as to how one should crate a URL output. I searched the offical GCP terraform registry as well as using google's search engine and chatgpt. Using all of these resources I was able to come to a decisoin on how I would format my code. A website block was necessary as well as using the "output 'website_url'" resource which seems to be a common block across multiple cloud platforms.

```
 website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }
```

### Configurations
In order to access the buckets objects through a publicly accessable URL, which is essentially the whole purpose of this project, an IAM role needed to be set in order to give all users access to the objects themselves that were uploaded to the bucket. The role needed for this was roles/storage.objectViewer. I found this method as an efficient and quick way of assigning IAM roles. On another note Uniform bucket level access was set to true ensuring that only IAM permissions were used for object access across the board and not granular acl rules. I am (no pun intended) sure that fine-grained access has its uses. However in our case I found uniform bucket-level access to be optimal.

```
resource "google_storage_bucket" "GCS_bucket1" {
  name                        = "week-7-poc-bucket"
  location                    = "US-CENTRAL1"
  storage_class               = "STANDARD"
  force_destroy               = true
  uniform_bucket_level_access = true

  website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }

}
``` 
### Future Imporvements
Changes that could improve this infrastruture is possibly finding a more efficient way of uploading each object as oppose to each object having its own block of code as if it were a resource. I find that to be the only real downside of this infrastructure.

### Website

URL: https://storage.googleapis.com/week-7-poc-bucket/index.html