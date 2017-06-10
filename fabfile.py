# -*- coding: utf-8 -*-

import os
from fabric.api import *

VARS = [
  'subnet_1',
  'web_private_ip'
]

OUTPUTS = list()

def create(env="development", level="basic"):
  paths = configuration(env)
  if level == 'basic':
    # creates only infrastructure without instances or applications
    files = ['aws.tf', 'outputs_basic.tf', 'vars.tf', 'vpc.tf']
    with lcd("{0}/{1}".format(paths[0], paths[1])):
      local("mkdir tmp")
      for f in files:
        local("cp {0} tmp".format(f))

      local("cd tmp/ && terraform plan -var-file={0}/{1}/{2}.tfvars".format(paths[0], paths[2], env))
      option = raw_input('Confirm create? (y/n): ')

      if option == 'y':
        local("terraform apply -var-file={0}/{1}.tfvars".format(paths[1], env))
        local("cp tmp/terraform.state ../")
        local("cp tmp/terraform.state.backup ../")
        local("rm -r tmp/")
      else:
        print('Confirmation canceled!')


    # with lcd(paths[0]):
      # local("cp aws.tf")

def infra():
  pass

def ec2():
  pass

def plan(env="development"):
  paths = configuration(env)
  with lcd(paths[0]):
    local("terraform plan -var-file={0}/{1}.tfvars".format(paths[1], env))

def apply(env="development"):
  paths = configuration(env)
  with lcd(paths[0]):
    local("terraform apply -var-file={0}/{1}.tfvars".format(paths[1], env))

def destroy(env="development"):
  paths = configuration(env)
  with lcd(paths[0]):
    local("terraform destroy -force -var-file={0}/{1}.tfvars".format(paths[1], env))

def variables(env="development"):
  paths = configuration(env)
  with lcd(paths[0]):
    for var in VARS:
      OUTPUTS.append(local("terraform output {0}".format(var)))

  print OUTPUTS

def configuration(env):
  full_path = os.path.dirname(os.path.abspath(__file__))
  if env == 'development':
    return (full_path, 'infrastructure/development', 'infrastructure/variables')
