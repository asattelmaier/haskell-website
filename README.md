# Website

## Prerequisites

* ghc   >= 8.10.4
* cabal >= 1.10

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
docker image build -t asattelmaier/website:latest -f docker/Dockerfile .
```

### Run

```bash
docker run -e INDEX_RESOURCE_LOCATION='https://example.de' -p 8000:8000 --name website asattelmaier/website:latest
```

### Push

```bash
docker push asattelmaier/website:latest
```

