aws cloudformation create-stack \
	--stack-name udacity-capstone \
	--template-body file://infra-cloudformation.yaml \
	--parameters file://infra-vars.json \
	--region=us-east-1 \
	--capabilities CAPABILITY_IAM
