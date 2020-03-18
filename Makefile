build:
	docker build -t starbase -f Dockerfile.starbase .
	docker tag starbase musinov/starbase

push: build
	docker push musinov/starbase

run:
	docker run --gpus all -it --rm -p 8890:8888 -v $(pwd):/workspace musinov/starbase
	#jupyter-lab --ip=0.0.0.0 --allow-root

tunnel:
	ssh -L 127.0.0.1:8890:127.0.0.1:8890 imusinov@<vm>