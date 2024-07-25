# GITHUB_TOKEN is used for git clone https and github_actions_secret authentication
ifndef GITHUB_TOKEN
    $(error Please specify GITHUB_TOKEN)
endif
# GH_TOKEN is used for gh within GitHub Actions https://cli.github.com/manual/gh_auth_login
ifndef GH_TOKEN
    $(error Please specify GH_TOKEN)
endif

TF_VARS=config/terraform.tfvars
TF_BACKEND=config/backend.tf
BUCKET_REGION=ap-southeast-2
export TF_VAR_github_token=${GITHUB_TOKEN}
export AWS_DEFAULT_REGION=${BUCKET_REGION}

all: clean deps init infra-clean infra build deploy
publish: clean deps init build deploy
ci: clean deps init build

stage:
	mkdir -p stage

deps: stage
	cd stage && git clone "https://x-access-token:$(GITHUB_TOKEN)@github.com/cliffano/terraform-kon-tiki-studio.git"
	bob dep

init:
	terraform init -var-file="$(TF_VARS)" -backend-config="$(TF_BACKEND)" -backend=true -force-copy

build:
	bob site
	terraform graph

clean:
	bob clean
	rm -rf .terraform/ .terraform.lock.hcl stage/

deploy:
	# Disabled now that we deploy via AWS CodeBuild
	# bob send
	aws s3 cp --recursive --region $(BUCKET_REGION) .bob/site/ae86/ s3://album.qoqoa.com

infra-clean:
	terraform destroy -auto-approve -var-file $(TF_VARS)

infra-refresh:
	terraform refresh -var-file $(TF_VARS)

infra-prepare:
	terraform plan -var-file $(TF_VARS)

infra:
	terraform apply -auto-approve -var-file $(TF_VARS)

infra-import:
	terraform import -var-file $(TF_VARS) $(IMPORT_ARGS)

.PHONY: all stage deps build clean deploy infra-clean infra infra-import init
