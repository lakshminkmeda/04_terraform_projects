resource "aws_vpc_endpoint" "eu_north_1_main_vpc_endpoint_gw" {

  vpc_id            = module.vpc.vpc_id
  vpc_endpoint_type = "Gateway"
  service_name      = "com.amazonaws.eu-north-1.s3"
  route_table_ids   = flatten([module.vpc.private_route_table_ids])

  tags = merge(
    data.terraform_remote_state.global_prod_main_remote.outputs.default_tags,
    var.default_tags,
    {
      Name = "eu-north-1-prod-main-vpc-endpoint-gw"
    },
  )
}