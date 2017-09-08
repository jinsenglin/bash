all: build push test

init:
	mkdir vagrant
	cd vagrant && vagrant init --box-version "2.7.0" concourse/lite

up:
	cd vagrant && vagrant up

down:
	cd vagrant && vagrant halt

build:
	docker build -t jimlintw/dummy-res:latest .

push:
	docker push jimlintw/dummy-res:latest

test:
	fly -t dummy-ci login --concourse-url http://192.168.100.4:8080
	fly -t dummy-ci destroy-pipeline --pipeline dummy-pipeline -n
	fly -t dummy-ci set-pipeline --config pipeline.yml --pipeline dummy-pipeline -n
	fly -t dummy-ci unpause-pipeline --pipeline dummy-pipeline
	fly -t dummy-ci check-resource --resource dummy-pipeline/dummy-res1
	fly -t dummy-ci trigger-job --job dummy-pipeline/dummy-job --watch
