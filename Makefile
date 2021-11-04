build:
	docker build -f ./docker/debug/Dockerfile -t quay.io/amorgant/server-debug:latest .
	docker push quay.io/amorgant/server-debug:latest 


