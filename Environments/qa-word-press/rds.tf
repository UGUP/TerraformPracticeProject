module "db" {
  source  = "terraform-aws-modules/rds/aws"

  identifier = "wordpressdb"

  engine            = "mysql"
  engine_version    = "5.7"
  instance_class    = "db.r5.large"
  allocated_storage = 5

  db_name  = "wordpressdb"
  username = "upma"
  port     = "3306"

  iam_database_authentication_enabled = true

  vpc_security_group_ids = [module.sg.security_group_id]

  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window      = "03:00-06:00"

  # Enhanced Monitoring - see example for details on how to create the role
  # by yourself, in case you don't want to create it automatically
  monitoring_interval = "30"
  monitoring_role_name = "MyRDSMonitoringRole"
  create_monitoring_role = true

  tags = {
    Owner       = "upma"
    Environment = "dev"
  }

  # DB subnet group
  create_db_subnet_group = true
  subnet_ids             = [module.wordpress-vpc.private_subnets[0],module.wordpress-vpc.private_subnets[1] ]

  # DB parameter group
  family = "mysql5.7"

  create_random_password=false
  password = "cua8565hyK1!"

  # DB option group
  major_engine_version = "5.7"

  # Database Deletion Protection
  deletion_protection = true

  parameters = [
    {
      name = "character_set_client"
      value = "utf8mb4"
    },
    {
      name = "character_set_server"
      value = "utf8mb4"
    }
  ]

  options = [
    {
      option_name = "MARIADB_AUDIT_PLUGIN"

      option_settings = [
        {
          name  = "SERVER_AUDIT_EVENTS"
          value = "CONNECT"
        },
        {
          name  = "SERVER_AUDIT_FILE_ROTATIONS"
          value = "37"
        },
      ]
    },
  ]
}