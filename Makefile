build:
	docker build -f ./docker/debug/Dockerfile -t quay.io/amorgant/server-debug:debug-0.1 .
	docker push quay.io/amorgant/server-debug:debug-0.1


