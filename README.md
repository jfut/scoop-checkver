# scoop-checkver

scoop-checkver is a container to check for new version of all apps of a bucket.

- [Docker Hub](https://hub.docker.com/r/jfut/scoop-checkver)

## Usage

Add buckets to check for new version.

```
cd /path/to
mkdir buckets

# Example 1
git clone https://github.com/jfut/scoop-jfut.git buckets/jfut

# Example 2
git clone https://github.com/<your-username>/my-bucket buckets/my-bucket

# and more...
```

### Run checkver.ps1 in all buckets

```
docker run --rm -it -v $PWD/buckets:/scoop/buckets jfut/scoop-checkver
```

### Run checkver.ps1 with autoupdate in all buckets

```
git clone https://github.com/jfut/scoop-checkver.git
mv scoop-checkver/bin-autoupdate /path/to

cd /path/to
docker run --rm -it -v $PWD/buckets:/scoop/buckets -v $PWD/bin-autoupdate:/scoop/bin jfut/scoop-checkver
```

## Build a docker image

Build a docker image on your host.

```
pushd docker
docker build -t scoop-checkver -f Dockerfile .
popd
```

