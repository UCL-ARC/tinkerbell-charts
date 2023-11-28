
push:
	docker buildx build \
		--platform linux/amd64 \
		--label org.opencontainers.image.source="https://github.com/t-young31/tinkerbell-charts" \
		--tag ghcr.io/t-young31/tink-stack .
	echo $$GH_PAT | docker login ghcr.io -u t-young31 --password-stdin
	docker push ghcr.io/t-young31/tink-stack
