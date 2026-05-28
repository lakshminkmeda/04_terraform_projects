resource "aws_vpc_peering_connection" "eu_north_1_to_us_east_1" {

  provider    = aws.eu-north-1
  peer_vpc_id = data.terraform_remote_state.us_east_1_main_prod_remote.outputs.vpc_id
  vpc_id      = data.terraform_remote_state.eu_north_1_main_prod_remote.outputs.vpc_id
  auto_accept = false
  peer_region = "us-east-1"

  #  requester {
  #    allow_remote_vpc_dns_resolution = true
  #  }
  tags = merge(
    data.terraform_remote_state.global_prod_main_remote.outputs.default_tags,
    var.default_tags,
    {
      Name = "prod-main-eu-north-1-to-us-east-1"
    },
  )

}

resource "aws_vpc_peering_connection_accepter" "eu_north_1_to_us_east_1_accepter" {
  provider                  = aws.us-east-1
  vpc_peering_connection_id = aws_vpc_peering_connection.eu_north_1_to_us_east_1.id
  auto_accept               = true
  accepter {
    allow_remote_vpc_dns_resolution = true
  }
  tags = merge(
    var.default_tags,
    data.terraform_remote_state.global_prod_main_remote.outputs.default_tags,
    {
      Name = "prod-main-eu-north-1-to-us-east-1-accepter"
    },
  )
}

module "eu_north_1_to_us_east_1_routes" {
  source = "../../../../modules/vpc-peering-routes"

  providers = {
    aws = aws.eu-north-1
  }

  source_region                   = "eu-north-1"
  destination_region              = "us-east-1"
  vpc_peering_connection_id       = aws_vpc_peering_connection.eu_north_1_to_us_east_1.id
  source_cidr                     = data.terraform_remote_state.eu_north_1_main_prod_remote.outputs.vpc_cidr
  destination_cidr                = data.terraform_remote_state.us_east_1_main_prod_remote.outputs.vpc_cidr
  source_vpc_route_table_ids      = data.terraform_remote_state.eu_north_1_main_prod_remote.outputs.vpc_private_route_table_ids
  destination_vpc_route_table_ids = data.terraform_remote_state.us_east_1_main_prod_remote.outputs.vpc_private_route_table_ids

}