# -*- coding: utf-8 -*-

from fabric.api import *

VARS = [
  'subnet_1',
  'web_private_ip'
]

OUTPUTS = list()

def plan(aws_env="development"):
  paths = configuration(aws_env)
  with lcd(paths[0]):
    local("terraform plan -var-file={0}/{1}.tfvars".format(paths[1], aws_env))

def apply(aws_env="development"):
  paths = configuration(aws_env)
  with lcd(paths[0]):
    local("terraform apply -var-file={0}/{1}.tfvars".format(paths[1], aws_env))

def destroy(aws_env="development"):
  paths = configuration(aws_env)
  with lcd(paths[0]):
    local("terraform destroy -force -var-file={0}/{1}.tfvars".format(paths[1], aws_env))

def variables(aws_env="development"):
  paths = configuration(aws_env)
  with lcd(paths[0]):
    for var in VARS:
      OUTPUTS.append(local("terraform output {0}".format(var)))

  print OUTPUTS

def configuration(aws_env):
  if aws_env == 'development':
    return ('infrastructure/development', '../variables')
