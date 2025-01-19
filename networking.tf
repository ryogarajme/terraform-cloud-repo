moved {
  from = aws_vpc.this
  to = module.networking-YS_Learnings.aws_vpc.this
}

moved {
  from = aws_subnet.this
  to = module.networking-YS_Learnings.aws_subnet.this["public-1"]
}

module "networking-YS_Learnings" {
  source  = "app.terraform.io/YSacademy/networking-YS_Learnings/aws"
  version = "0.1.1"
  vpc_config = {
    name       = "tfcloud-vpc"
    cidr_block = var.cidr_block
    tags = {
      Environment = "Production"
      Project     = "MyApp"
    }
  }

  subnet_config = {
    "public-1" = {
      cidr_block = var.subnet_cidr
      az         = "us-east-1c"
      public     = true
      tags = {
        Type = "Public"
      }
    },
    "private-1" = {
      cidr_block = "10.0.2.0/24"
      az         = "us-east-1b"
      public     = false
      tags = {
        Type = "Private"
      }
    }
  }
}



# resource "aws_vpc" "this" {
#   cidr_block = var.cidr_block
#   tags = {
#     Name = "terraform-cloud"
#   }
# }

# resource "aws_subnet" "this" {
#   vpc_id     = aws_vpc.this.id
#   cidr_block = var.subnet_cidr

#   tags = {
#     Name = "terraform-cloud-subnet"
#   }
# }