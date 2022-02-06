.PHONY: build

REPO= github.com/ca-gip/hackathon-api
IMAGE= hackathon-api
TAG= latest
DOCKER_REPO= europe-west3-docker.pkg.dev/cagip-hackathon-eq03-inno0-6b/hackathon

dependency:
	go mod vendor

build: dependency
	GO111MODULE="on" CGO_ENABLED=0 go build -ldflags="-s" -v -o ./build/hackathon-api $(GOPATH)/src/$(REPO)/main.go

image:
	docker buildx build --no-cache --platform linux/amd64 -t "$(DOCKER_REPO)/$(IMAGE):$(TAG)" -f Dockerfile .

dep:
	glide install

