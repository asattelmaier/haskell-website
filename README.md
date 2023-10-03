# Website

## Prerequisites

* ghc == 9.4.4
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
docker run -p 8000:8000 --name website asattelmaier/website:latest
```

### Push

```bash
# Docker Hub
docker push asattelmaier/website:latest
# Google Cloud
docker push eu.gcr.io/PROJECT_ID/website:latest
```

## Update GHC Version

When updating the GHC version in the project, make sure to follow these steps:

1. Update the `ghc-version` field in the GitHub workflows.
    - Open the `build.yaml` file located in the `.github/workflows` directory.
    - Locate the `ghc-version` field and update it with the desired GHC version.

2. Update the Prerequisites section in the README.md file.
    - Open the README.md file.
    - Locate the `Prerequisites` section.
    - Update the GHC version mentioned in the prerequisites to reflect the newly installed GHC version.
