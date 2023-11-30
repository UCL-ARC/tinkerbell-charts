SHELL := /bin/bash

push: artifacts_downloaded
	docker buildx build \
		--platform linux/amd64 \
		--label org.opencontainers.image.source="https://github.com/UCL-ARC/tinkerbell-charts" \
		--tag ghcr.io/ucl-arc/tink-stack .
	echo $$GH_PAT | docker login ghcr.io -u ucl-arc --password-stdin
	docker push ghcr.io/ucl-arc/tink-stack

artifacts_downloaded:
	if [ ! -f vmlinuz-x86_64 ]; then ./download.sh; fi
