module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 8.0"

  name = "ALB-PRACTICE-PROJECT"

  load_balancer_type = "application"

  vpc_id             = module.VPC_PRACTICE_PROJECT.vpc_id
  subnets            = [module.VPC_PRACTICE_PROJECT.public_subnets[0],module.VPC_PRACTICE_PROJECT.public_subnets[1]]
  security_groups    = [module.SG_PRACTICE_PROJECT.security_group_id]

#   access_logs = {
#     bucket = "s3-c38"
#   }

  target_groups = [
    {
      arn = module.target_group_practice_project.arn
      name = module.target_group_practice_project.name
    }
  ]

  https_listeners = [
    {
      port                 = 443
      protocol             = "HTTPS"
      certificate_arn      = "arn:aws:iam::123456789012:server-certificate/test_cert-123456789012"
      action_type          = "authenticate-cognito"
      target_group_index   = 0
      authenticate_cognito = {
        user_pool_arn       = "arn:aws:cognito-idp::123456789012:userpool/test-pool"
        user_pool_client_id = "6oRmFiS0JHk="
        user_pool_domain    = "test-domain-com"
      }
    }
  ]

  http_tcp_listeners = [
    {
      port        = 80
      protocol    = "HTTP"
      action_type = "redirect"
      redirect = {
        port        = "443"
        protocol    = "HTTPS"
        status_code = "HTTP_301"
      }
    }
  ]

  tags = {
    Environment = "Test"
  }
}