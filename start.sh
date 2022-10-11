#!/bin/bash

start_time=$(date +%s)

banner()
{
  echo "+------------------------------------------+"
  printf "| %-40s |\n" "`date`"
  echo "|                                          |"
  printf "|`tput bold` %-40s `tput sgr0`|\n" "$@"
  echo "+------------------------------------------+"
}

if [ -z "$BASE_DIR" ]
then
  export BASE_DIR=$(pwd)
fi

# Check the home region

banner "Terraform Init"
cd $BASE_DIR/terraform
terraform init -upgrade

banner "Terraform Apply"
terraform apply -auto-approve

cd $BASE_DIR

end_time=$(date +%s)
elapsed=$(( end_time - start_time ))
echo "Time: $elapsed sec"