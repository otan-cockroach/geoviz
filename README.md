# GeoVIZ

## Deploy instructions

* Commit relevant changes on cockroachdb/cockroach.
* (optional) Build the container: `docker build -t geoviz .` and play with it at `docker run -p 8080:8080 geoviz`.
* When happy with the container, build it with Google Cloud Build:
```
BRANCH=$(git symbolic-ref --short HEAD)-$USER
SHA=$(git rev-parse --short HEAD)-$USER
gcloud --project cockroach-dev-inf builds submit --substitutions=BRANCH_NAME=$BRANCH,SHORT_SHA=$SHA
```
* Modify Docker container in geoviz.yaml.
* Deploy with `kubectl apply -f geoviz.yaml`.
