all: build push test

build:
	docker build -t jimlintw/dummy-res:latest .

push:
	docker push jimlintw/dummy-res:latest

test:
	fly -t dummy-ci login --concourse-url http://127.0.0.1:8080
	fly -t dummy-ci set-pipeline --config pipeline.yml --pipeline dummy-pipeline
	fly -t dummy-ci unpause-pipeline --pipeline dummy-pipeline
	fly -t dymmy-ci trigger-job --job dummy-pipeline/dummy-job --watch
