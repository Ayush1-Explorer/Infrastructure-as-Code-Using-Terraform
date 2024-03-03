terraform {
  backend "s3" {
    bucket         = "naam-dede-bhai"  
    key            = "terraform.tfstate" 
    region         = "ap-south-1" 
  }
}