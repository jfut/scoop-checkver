# scoop-checkver

scoop-checkver is a container to check for new version of all apps of a bucket.

## Usage

Add buckets to check for new version.

```
cd buckets

# example 1
git clone https://github.com/jfut/scoop-jfut.git jfut

# example 2
git clone https://github.com/<your-username>/my-bucket

# and more...

cd ..
```

Run checkver.ps1 in all buckets.

```
docker run --rm -it -v $PWD/buckets:/scoop/buckets scoop-checkver
```

## Build a docker image

Build a docker image on your host.

```
cd docker
docker build -t scoop-checkver -f Dockerfile .
cd ..
```

