# Website

## Prerequisites

* ghc   >= 8.10.4
* cabal >= 1.10
* [gcloud](https://cloud.google.com/sdk/docs/install#de )

## Build

```bash
cabal build
```

## Run

```bash
cabal run
```

## Docker

### Build

```bash
# Docker Hub
docker image build -t asattelmaier/website:latest -f docker/Dockerfile .
# Google Cloud
docker image build -t eu.gcr.io/PROJECT_ID/website:latest -f docker/Dockerfile .
```

### Run

```bash
docker run -e INDEX_RESOURCE_LOCATION='https://example.de' -p 8000:8000 --name website asattelmaier/website:latest
```

### Push

```bash
# Docker Hub
docker push asattelmaier/website:latest
# Google Cloud
docker push eu.gcr.io/PROJECT_ID/website:latest
```

